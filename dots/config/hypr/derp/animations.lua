hl.curve( "ease_in_back", {
    type = "bezier",
    points = {
        {
        0.76,
        0
    },
    {
        0.24,
        1
}}})





hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4,
    bezier = "ease_in_back",
    style = "slidefadevert 40%"
})