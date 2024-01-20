with import ./colors.nix; ''

* {
    color: ${ text };
    font-family: 'JetBrainsMono NF';
    font-size: 14px;
    font-weight: bold;
    min-height: 5px;
}

tooltip {}

window#waybar,
#tray .active > :nth-child(2) > :nth-child(2) {
    background-color: ${ bg };
    opacity: 0.95;
    border-radius: 10px;
    border: 2px solid ${ border };
    padding: 5px 0;
}

#tray .active > :nth-child(2) > :nth-child(2) > * {
    margin: 2px 10px;
    border-radius: 10px;
}

#tray .active > :nth-child(2) > :nth-child(2) > *:hover {
    background-color: ${ active_background };
}


#workspaces button.focused {
    background-color: ${ active_background };
}

#workspaces button.active {

}

#workspaces {
    padding: 2px 5px;
}

#clock,
#temperature,
#custom-nightlight,
#cpu,
#memory,
#pulseaudio,
#tray,
#custom-kernel,
#bluetooth,
#window,
#mpris {
    padding: 0 5px;

}

#workspaces {
    margin-left: 4px;
}

#window.empty {
    background: rgba(0, 0, 0, 0);
}

#window {
    color: ${ text };
    margin-left: 4px;
}

#pulseaudio {
    margin-right: 4px;
}

#custom-nightlight {
    margin-left: 16px;
}

#mpris {
    margin-left: 16px;
}

''
