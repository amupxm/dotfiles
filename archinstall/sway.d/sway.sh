#!/bin/bash

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export GTK_THEME=Adwaita:dark
export NVD_BACKEND=direct
# to enable wayland on firefox
# after ugprading nvidia-open-dkms firefox has issues with wayland.
export MOZ_ENABLE_WAYLAND=0

eval "$(gnome-keyring-daemon --start)"
export SSH_AUTH_SOCK

exec sway --unsupported-gpu
