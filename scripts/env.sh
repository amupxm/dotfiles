#!/bin/bash
# In The Name Of God
# ========================================
# [] File Name : env.sh
#
# [] Creation Date : 07-01-2017
#
# [] Created By : Parham Alvani (parham.alvani@gmail.com)
# =======================================
if [[ $EUID -ne 0 ]]; then
	echo "[env] This script must be run as root"
	exit 1
fi


if [ "$OSTYPE" == "darwin"* ]; then
	brew install zsh ctags vim tmux
else
	apt-get install zsh ctags vim tmux
fi

