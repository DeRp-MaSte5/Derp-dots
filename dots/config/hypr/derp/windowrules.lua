local terminal = "kitty"
local file_explorer = "nemo"
local browser = "waterfox"
local ide = "codium"
local video_player = "mpv"
hl.window_rule({
    name = "terminal",
    match = { class = terminal },
	opacity = 0.6,
	float = true,
	size = {
        "(monitor_w*0.68)",
        "(monitor_h*0.66)",
    },
	center = true
})
hl.window_rule({
    name = "file_explorer",
    match = { class = file_explorer },
	opacity = 0.6,
	float = true,
	size = {
        "(monitor_w*0.75)",
        "(monitor_h*0.75)",
    },
	center = true,
    dim_around = true
})
hl.window_rule({
    name = "vesktop",
    match = { class = "vesktop" },
	opacity = 0.7,
    workspace = "5 silent"
})
hl.window_rule({
    name = "browser",
    match = { class = browser },
	opacity = "0.7 override 0.7 override 1 override",
    workspace = "4 silent",
    no_dim = true
})
hl.window_rule({
    name = "browser_fullscreen",
    match = { 
        class = browser,
        fullscreen = true
    },
    decorate = false
})
hl.window_rule({
    name = "youtube_opacity",
    match = { 
        class = browser,
        title = ".*" .. "- YouTube" .. ".*"
    },
    opacity = "1 override"
})
hl.window_rule({
    name = "ide",
    match = { class = ide },
	opacity = 0.8
})
hl.window_rule({
    name = "video_player",
    match = { class = video_player },
	no_dim = true
})
hl.window_rule({
    name = "steam",
    match = { class = "steam" },
	opacity = 0.7,
	float = true,
	size = {
        "(monitor_w*0.75)",
        "(monitor_h*0.787)",
    },
	center = true
})
hl.window_rule({
    name = "prism",
    match = { class = "org.prismlauncher.PrismLauncher" },
	opacity = 0.7
})
hl.window_rule({
    name = "qbittorrent",
    match = { class = "org.qbittorrent.qBittorrent" },
	opacity = 0.7
})
hl.window_rule({
    name = "wofi",
    match = { class = "wofi" },
	opacity = 0.7
})

-- Suppress maximize clutter
hl.window_rule({
    name = "suppress_maximize",
    match = { class = ".*" },
    suppress_event = "maximize"
})
hl.window_rule({
    -- Fix some dragging issues with XWayland
    -- Ripped directly from the hyprland example config, never had issues, but used a version of it before. Adding just incase.
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})


-- I prefer having my workspaces monitor dedicated. If using a one monitor setup, change this. Same if not dual monitor.
for i = 1, 3 do
    hl.workspace_rule({
        workspace = i,
        monitor = "DP-1",
        persistent = true
    })
end
for i = 4, 6 do
    hl.workspace_rule({
        workspace = i,
        monitor = "DP-2",
        persistent = true
    })
end

hl.layer_rule({
    name = "blur-waybar",
    match = { namespace = "waybar"},
    blur = true,
    ignore_alpha = 0.8
})
