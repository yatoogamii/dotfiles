-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
  output = "HDMI-A-3",
  mode = "highres",
  position = "auto-left",
  scale = "auto",
})

hl.monitor({
  output = "DP-2",
  mode = "highres",
  position = "auto-right",
  scale = "auto",
})
---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "ghostty"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("waybar")
  hl.exec_cmd("fcitx5 -d")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,

    border_size = 0,

    col = {
      active_border = { colors = { "rgba(75, 128, 202, 1)" }, angle = 45 },
      inactive_border = "rgba(100,99,101,1)",
    },

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing = false,

    layout = "dwindle",
  },

  decoration = {
    rounding = 0,
    rounding_power = 2,

    -- Change transparency of focused and unfocused windows
    active_opacity = 0.9,
    inactive_opacity = 0.9,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },

    blur = {
      enabled = true,
      size = 15,
      passes = 3,
      vibrancy = 10,
    },
  },

  animations = {
    enabled = true,
  },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "border", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 2.0, bezier = "almostLinear" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.2, bezier = "almostLinear" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 3.0, bezier = "easeOutQuint" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
  dwindle = {
    preserve_split = true, -- You probably want this
    force_split = 2,
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
  master = {
    new_status = "master",
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})

----------------
----  MISC  ----
----------------

hl.config({
  misc = {
    force_default_wallpaper = 0,  -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
  },
})

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    -- -1 dont follow but can scroll, 0 dont follow and dont scroll, 1 follow
    follow_mouse = -1,

    sensitivity = -0.3, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = false,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- Apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + K", hl.dsp.window.close())
hl.bind(
  mainMod .. " + F",
  hl.dsp.window.fullscreen_state({
    internal = 3,
    client = 0,
    action = "toggle",
  })
)
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(
  mainMod .. " + Insert",
  hl.dsp.exec_cmd(
    'grim -g "$(slurp)" -  | tee "$HOME/Pictures/Screenshots"/"Screenshot_$(date +%Y%m%d-%H%M%S).png" | wl-copy'
  )
) -- dwindle only
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("firefox"))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
-- Move focused window
hl.bind("ALT" .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind("ALT" .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("ALT" .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind("ALT" .. " + down", hl.dsp.window.move({ direction = "down" }))
-- Move window to workspace
hl.bind("CTRL" .. " + left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind("CTRL" .. " + right", hl.dsp.window.move({ workspace = "+1" }))
-- Move to workspace
hl.bind("SHIFT" .. " + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind("SHIFT" .. " + right", hl.dsp.focus({ workspace = "+1" }))
-- Switch workspace
hl.bind(mainMod .. " + TAB", hl.dsp.workspace.swap_monitors({ monitor1 = "HDMI-A-3", monitor2 = "DP-2" }))
-- Move/Resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Volumes --
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})

hl.window_rule({
  -- Ignore maximize requests from apps. You'll probably like this.
  name = "ignore-app-maximize-reqs",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  -- Hyprland-run windowrule
  name = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move = "20 monitor_h-120",
  float = true,
})

hl.window_rule({
  match = {
    initial_title = "^(Godot)$",
    initial_class = "negative:^(Godot)$",
  },
  float = true,
  move = "640 100",
  -- size = { 1280, 720 },
})

hl.workspace_rule({
  workspace = 1,
  monitor = "HDMI-A-3",
  default = true,
})

hl.workspace_rule({
  workspace = 2,
  monitor = "DP-2",
  default = true,
})
