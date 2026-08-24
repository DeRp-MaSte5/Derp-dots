local browser = "waterfox"
hl.on("hyprland.start", function ()
    hl.exec_cmd(browser)
    hl.exec_cmd("waybar & awww-daemon")
    hl.exec_cmd("vesktop")
    hl.exec_cmd("steam")
    hl.exec_cmd("cliphist & wl-paste -t text --watch clipman store --no-persist")
    hl.exec_cmd("xwaylandvideobridge")
end)

hl.on("config.reloaded", function ()
    hl.notification.create({
        text = "Config has been reloaded! Here be dragons!",
        timeout = 3000,
        icon = "hint",
        color = "rgb(7121A6)",
        font_size = 16,
    })
end)
