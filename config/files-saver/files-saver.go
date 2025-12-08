package main

import (
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/BurntSushi/toml"
)

const (
	appName = "files-saver"
	gitrepo = "/home/elias/projects/perso/dotfiles"
)

type PathMapping struct {
	SrcPath string `toml:"srcPath"`
	DstPath string `toml:"dstPath"`
}

type Config struct {
	Paths []PathMapping `toml:"paths"`
}

func main() {
	config, err := GetConfig()

	if err != nil {
		panic(err)
	}

	for _, pathMapping := range config.Paths {

		if IsDir(pathMapping.SrcPath) {

			err := CopyDir(pathMapping.SrcPath, pathMapping.DstPath)

			if err != nil {
				panic(err)
			}

			continue
		}

		err := CopyFile(pathMapping.SrcPath, pathMapping.DstPath)

		if err != nil {
			panic(err)
		}

	}

	err = GitCommitAndPush()

	if err != nil {
		panic(err)
	}
}

func CopyFile(src, dst string) error {
	dstDir := filepath.Dir(dst)

	if err := os.MkdirAll(dstDir, 0755); err != nil {
		return fmt.Errorf("failed to create destination directory: %v", err)
	}

	sourceFile, err := os.Open(src)

	if err != nil {
		return fmt.Errorf("failed to open source file: %v", err)
	}

	defer sourceFile.Close()

	destinationFile, err := os.Create(dst)

	if err != nil {
		return fmt.Errorf("failed to create destination file: %v", err)
	}

	defer destinationFile.Close()

	if _, err = io.Copy(destinationFile, sourceFile); err != nil {
		return fmt.Errorf("failed to copy file: %v", err)
	}

	if err = destinationFile.Sync(); err != nil {
		return fmt.Errorf("failed to sync file: %v", err)
	}

	return nil
}

func CopyDir(src, dst string) error {
	files, err := os.ReadDir(src)

	if err != nil {
		return fmt.Errorf("failed to read source directory: %v", err)
	}

	for _, file := range files {

		if file.IsDir() {
			CopyDir(filepath.Join(src, file.Name()), filepath.Join(dst, file.Name()))

			continue
		}

		if err = CopyFile(filepath.Join(src, file.Name()), filepath.Join(dst, file.Name())); err != nil {
			return fmt.Errorf("failed to copy file: %v", err)
		}
	}

	return nil
}

func IsDir(path string) bool {
	if path[len(path)-1:] == "/" {
		return true
	}

	return false
}

func GitCommitAndPush() error {
	exec.Command("git", "-C", gitrepo, "add", ".").Run()

	exec.Command("git", "-C", gitrepo, "commit", "-m", "auto save commit").Run()

	cmd := exec.Command("git", "-C", gitrepo, "push")

	if err := cmd.Run(); err != nil {
		return err
	}

	return nil
}

func GetConfig() (Config, error) {
	configDir, err := ConfigDir()

	if err != nil {
		return Config{}, err
	}

	var cfg Config

	if _, err := toml.DecodeFile(configDir, &cfg); err != nil {
		return Config{}, err
	}

	return cfg, nil
}

func ConfigDir() (string, error) {
	xdgConfig := os.Getenv("XDG_CONFIG_HOME")
	if xdgConfig == "" {
		home, err := os.UserHomeDir()
		if err != nil {
			return "", err
		}
		xdgConfig = filepath.Join(home, ".config")
	}
	return filepath.Join(xdgConfig, appName, "config.toml"), nil
}
