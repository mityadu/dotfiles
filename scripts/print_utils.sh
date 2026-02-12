#!/bin/bash

COLOR_DEFAULT=$(tput sgr 0)
COLOR_RED="$(tput setaf 1)"
COLOR_YELLOW="$(tput setaf 3)"
COLOR_GREEN="$(tput setaf 2)"
COLOR_BLUE="$(tput setaf 4)"

info() {
	printf "%s==> %s%s\n" "$COLOR_BLUE" "$1" "$COLOR_DEFAULT"
}

success() {
	printf "%s==> %s%s\n" "$COLOR_GREEN" "$1" "$COLOR_DEFAULT"
}

error() {
	printf "%s==> %s%s\n" "$COLOR_RED" "$1" "$COLOR_DEFAULT"
}

warning() {
	printf "%s==> %s%s\n" "$COLOR_YELLOW" "$1" "$COLOR_DEFAULT"
}
