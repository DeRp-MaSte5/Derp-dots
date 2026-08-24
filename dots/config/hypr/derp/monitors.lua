hl.monitor ({
	output = "DP-1",
	mode = "1920x1080@180",
	position = "0x0",
	scale = 1,
	vrr = 1,
})
hl.monitor ({
	output = "DP-2",
	mode = "1920x1080@180",
	position = "1920x0",
	scale = 1,
	supports_hdr = 1,
})
hl.monitor ({
	output = "HDMI-A-1",
	mode = "4096x2160@60.00",
	position = "0x0",
	scale = 2,
})


--- Incase you have a seperate config for monitors, see https://wiki.hypr.land/Configuring/Basics/Monitors/ for more informtion.