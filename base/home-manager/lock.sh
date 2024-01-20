#!/usr/bin/env bash
swayidle=$1
wallpaper=$2

# Times the screen off and puts it to background
$swayidle \
    timeout 10 'hyprctl dispatch dpms off' \
    resume 'hyprctl dispatch dpms on' \ 
	timeout 150 'systemctl suspend' &
	
# Locks the screen immediately
swaylock \
	--image $wallpaper \
	--clock \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--effect-blur 10x5 \
	--effect-vignette 0.7:0.2 \
	--ring-color 1A57CB \
	--key-hl-color 560088 \
	--line-color 00000000 \
	--inside-color 00000088 \
	--separator-color 00000000 \
	--fade-in 0.5
# Kills last background task so idle timer doesn't keep running
kill %%