#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : protoc.sh
#
# [] Creation Date : 11-04-2020
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================

usage() {
	echo "protocol buffer from google"
}

main_brew() {
	msg "installing protobuf from brew with go bindings"
	brew install protobuf
	brew install protoc-gen-go
}

main_apt() {
	return 1
}

main_pacman() {
	msg "installing protobuf from yay and pacman with go bindings"

	sudo pacman -Syu --needed --noconfirm protobuf
	yay -Syu --needed --noconfirm protoc-gen-go
}
