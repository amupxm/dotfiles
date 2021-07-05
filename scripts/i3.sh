#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : i3.sh
#
# [] Creation Date : 18-11-2020
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================

usage() {
	echo "i3 window manager for manajaro i3"
	# shellcheck disable=1004
	echo '
 _ _____
(_)___ /
| | |_ \
| |___) |
|_|____/
  '
}

main_brew() {
	return 1
}

main_apt() {
	return 1
}

main_pacman() {
	current_dir=${current_dir:?"current_dir must be set"}

	msg 'i3 with polybar'
	sudo pacman -Syu --noconfirm --needed i3-gaps i3-scrot matcha-gtk-theme

	configfile i3 "" i3

	msg 'x11/wayland image viewer'
	sudo pacman -Syu --noconfirm --needed imv

	msg 'pdf viewer'
	sudo pacman -Syu --noconfirm --needed mupdf

	msg 'jalali calender'
	yay -Syu --noconfirm --needed jcal-git

	msg 'picom'
	sudo pacman -Syu --noconfirm --needed picom
	sudo pacman -Syu --noconfirm --needed unclutter
	configrootfile picom picom.conf i3

	msg 'x11/wayland image viewer'
	sudo pacman -Syu --noconfirm --needed imv

	msg 'pdf viewer'
	sudo pacman -Syu --noconfirm --needed mupdf

	msg 'notification with dunst'
	sudo pacman -Syu --noconfirm --needed dunst libnotify
	configfile dunst "" i3

	msg 'backgrounds with feh'
	sudo pacman -Syu --noconfirm --needed feh
	msg 'setup a systemd timer to change background images each 5 minutes with nitrogen'
	configsystemd feh feh.timer i3
	configsystemd feh feh.service i3

	systemctl --user enable feh.timer
	systemctl --user start feh.timer

	msg 'configure the dmenu, default application luncher on manjaro i3'
	linker dmenu "$current_dir/i3/dmenurc" "$HOME/.dmenurc"
	chmod +x "$HOME/.dmenurc"

	msg 'configure rofi another application luncher'
	sudo pacman -Syu --noconfirm --needed rofi
	configfile rofi "" i3

	sudo pacman -Syu --noconfirm --needed matcha-gtk-theme
	linker gtk-2.0 "$current_dir/i3/gtk-2.0/gtkrc-2.0" "$HOME/.gtkrc-2.0"
	configfile gtk-3.0 settings.ini i3

	sudo pacman -Syu --noconfirm --needed perl-anyevent-i3

	msg 'gnome-keyring setup with ~/.profile'
	sudo pacman -Syu --noconfirm --needed gnome-keyring
	dotfile i3 profile
}
