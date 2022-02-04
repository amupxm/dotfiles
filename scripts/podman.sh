#!/bin/bash
# In The Name Of God
# ========================================
# [] File Name : podman.sh
#
# [] Creation Date : 27-01-2022
#
# [] Created By : Parham Alvani (parham.alvani@gmail.com)
# =======================================

usage() {
	echo "install podman useable at snapp"

	# shellcheck disable=1004,2016
	echo '
                 _
 _ __   ___   __| |_ __ ___   __ _ _ __
| |_ \ / _ \ / _` | |_ ` _ \ / _` | |_ \
| |_) | (_) | (_| | | | | | | (_| | | | |
| .__/ \___/ \__,_|_| |_| |_|\__,_|_| |_|
|_|
  '
}

main_apt() {
	return 1
}

main_brew() {
	return 1
}

main_pacman() {
	msg "install podman-compose / podman with pacman"
	sudo pacman -Syu --noconfirm --needed podman podman-docker podman-compose docker-compose slirp4netns podman-dnsname

	msg "install hadolint/hadolint with yay"
	yay -Syu --needed --noconfirm hadolint-bin

	msg "install dive with yay"
	yay -Syu --needed --noconfirm dive-bin

	msg "install lazydocker with yay"
	yay -Syu --needed --noconfirm lazydocker-bin

	msg "enable podman with snapp"
	configfile dive "" podman
	configfile containers "" podman

	msg "rootless podman"
	sudo touch /etc/subuid
	sudo touch /etc/subgid
	sudo usermod --add-subuids 200000-210000 --add-subgids 200000-210000 parham

	msg 'podman service with systemd-user'
	systemctl --user enable --now podman.service
	systemctl --user enable --now podman.socket

	msg 'remember arch has cgroup 2 by default'

	msg 'check /etc/hosts to contain the localhost'
	cat <<EOF
127.0.0.1 localhost
::1 localhost
EOF
}

main() {
	msg "$(docker version)"
	msg "$(hadolint --version)"
}