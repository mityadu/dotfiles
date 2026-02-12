#!/bin/bash

CUR_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. $CUR_SCRIPT_DIR/print_utils.sh

install_homebrew() {
	info "Installing Homebrew..."

	export HOMEBREW_CASK_OPTS="--appdir=/Applications/"
	if hash brew &>/dev/null; then
		info "Skipping: already installed"
	else
		sudo --validate
		NONINTERACTIVE-1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		success "Homebrew installed successfully"
	fi

}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
	install_homebrew
fi
