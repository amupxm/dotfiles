#!/bin/bash
usage() {
	echo "The NATS Command Line Interface"

	# shellcheck disable=1004,2016
	echo '
             _
 _ __   __ _| |_ ___
| |_ \ / _` | __/ __|
| | | | (_| | |_\__ \
|_| |_|\__,_|\__|___/
  '
}

main_pacman() {
	require_aur natscli
}

main_apt() {
	return 1
}

main_brew() {
	return 1
}

main() {
	return 0
}

main_parham() {
	return 0
}