if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end
function aniwatch
    ani-cli --skip $argv
end
