-- variables
local ide = "subl"
-- Sublime text, uses subl as its command

local terminal = "kitty"
local file_explorer = "nemo"
local launcher = "wofi --show drun"

-- exec
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + D", hl.dsp.exec_cmd(ide))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_explorer))
hl.bind("SUPER + R", hl.dsp.exec_cmd(launcher))
hl.bind("code:107", hl.dsp.exec_cmd("grimblast copy area"))

-- window management
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + C", hl.dsp.window.kill())
hl.bind("SUPER + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + V", hl.dsp.window.float({ action = toggle}))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })



-- Bind for Multimedia keys, i only use volume and play/pause personally, but including all for compatability
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Workspaces
for i = 1, 10 do 
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i}))
end
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))