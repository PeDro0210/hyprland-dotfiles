#!/bin/bash

wallustDir="$HOME/.config/hypr/wallust"

# Is for forcing the "save" action, which is needed to apply the color borders
mv $wallustDir/wallust-hyprland.conf $wallustDir/new-wallust-hyprland.conf -f

mv $wallustDir/new-wallust-hyprland.conf $wallustDir/wallust-hyprland.conf -f
