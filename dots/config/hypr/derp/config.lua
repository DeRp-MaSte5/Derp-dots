hl.config({
    general = {
        border_size = 2,
        gaps_in = 7,
        gaps_out = 25,
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 }, 
            inactive_border = "rgb(6B2DCF)",
    }},
    decoration = {
        rounding = 15,
        rounding_power = 3,
        dim_inactive = false,
        dim_strength = 0.2,
        blur = {
            enabled = true,
            size = 15,
            passes = 2,
            variant = "frost",
            vibrancy = 0.3
        },
        shadow = {
            enabled = true,
            range = 10,
            render_power = 2
        },
        glow = {
            enabled = true,
            range = 4
        },
        motion_blur = {
            enabled = true,
            samples = 12
        },
        wobble = {
            enabled = true,
            mesh = 12,
            stiffness = 200,
            damping = 25,
            intensity = 0.1
        }
    },
    input = {
        kb_model = "pc105",
        kb_layout = "us",
        repeat_rate = 35,
        repeat_delay = 500
    },
    misc = {
        vrr = 1,
        animate_manual_resizes = true,
        animate_mouse_windowdragging = true,
        enable_swallow = true,
        session_lock_xray = true,
        session_lock_blur = true,
        layers_hog_keyboard_focus = true
    },
    render = {
        direct_scanout = true,
        cm_enabled = true,
        ctm_animation = 2
    },
    cursor = {

    }
})