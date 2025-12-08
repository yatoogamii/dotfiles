package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"github.com/godbus/dbus/v5"
)

const (
	signalSender        = "org.mpris.MediaPlayer2.spotify"
	signalMember        = "PropertiesChanged"
	notificationBusName = "org.freedesktop.Notifications"
	notificationBusPath = "/org/freedesktop/Notifications"
	coverPath           = "/tmp/spotify-cover.png"
)

type TrackInfo struct {
	Title  string
	Artist string
	Album  string
	ArtUrl string
}

func main() {
	conn, err := dbus.ConnectSessionBus()

	if err != nil {
		log.Fatalf("Could not get system bus: %v", err)
	}

	defer conn.Close()

	if err := conn.AddMatchSignal(
		dbus.WithMatchSender(signalSender),
		dbus.WithMatchMember(signalMember),
	); err != nil {
		log.Fatalf("Could not add match signal: %v", err)
	}

	signals := make(chan *dbus.Signal, 10)
	conn.Signal(signals)

	log.Println("Listening for Spotify track changes...")

	for sig := range signals {

		if len(sig.Body) < 2 {
			// Metadata hasn't changed
			continue
		}

		changes, ok := sig.Body[1].(map[string]dbus.Variant)

		if !ok {
			continue
		}

		if metadata, ok := changes["Metadata"]; ok {
			handleMetadataChange(metadata)
		}

	}
}

func handleMetadataChange(metadata dbus.Variant) {
	metaMap, ok := metadata.Value().(map[string]dbus.Variant)

	if !ok {
		return
	}

	track := extractTrackInfo(metaMap)

	if track.Title == "Advertisement" {
		return
	}

	if err := downloadCover(track.ArtUrl); err != nil {
		log.Printf("Failed to download cover: %v", err)
	}

	if err := sendNotification(track); err != nil {
		log.Printf("Failed to send notification: %v", err)
	}

}

func downloadCover(url string) error {
	resp, err := http.Get(url)

	if err != nil {
		return err
	}

	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("Failed to download cover: %s", resp.Status)
	}

	out, err := os.Create(coverPath)

	if err != nil {
		return err
	}

	defer out.Close()

	_, err = io.Copy(out, resp.Body)

	return err
}

func sendNotification(track TrackInfo) error {
	conn, err := dbus.SessionBus()

	if err != nil {
		return err
	}

	defer conn.Close()

	obj := conn.Object(notificationBusName, notificationBusPath)

	body := fmt.Sprintf("<b>%s</b>\nby %s\nfrom %s", track.Title, track.Artist, track.Album)

	absPath, _ := filepath.Abs(coverPath)

	call := obj.Call(
		"org.freedesktop.Notifications.Notify",
		0,
		"spotify",
		uint32(0),
		absPath,
		"Now Playing",
		body,
		[]string{},
		map[string]dbus.Variant{},
		int32(5000),
	)

	return call.Err

}

func extractTrackInfo(metadata map[string]dbus.Variant) TrackInfo {
	track := TrackInfo{}

	if title, ok := metadata["xesam:title"]; ok {
		track.Title = variantToString(title)
	}

	if artist, ok := metadata["xesam:artist"]; ok {
		track.Artist = variantToStringArray(artist)
	}

	if album, ok := metadata["xesam:album"]; ok {
		track.Album = variantToString(album)
	}

	if artURL, ok := metadata["mpris:artUrl"]; ok {
		track.ArtUrl = variantToString(artURL)
	}

	return track
}

func variantToString(v dbus.Variant) string {
	if s, ok := v.Value().(string); ok {
		return s
	}
	return ""
}

func variantToStringArray(v dbus.Variant) string {
	if arr, ok := v.Value().([]string); ok && len(arr) > 0 {
		return strings.Join(arr, ", ")
	}
	return ""
}
