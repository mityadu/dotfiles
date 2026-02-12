#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. scripts/print_utils.sh
. scripts/prerequisites.sh
. scripts/osx_defaults.sh

read -p "Overwrite existing dotfiles? [y/n]" overwrite_dotfiles

info "Installing prerequisites..."
install_homebrew

info "Configuring OSX System defaults"
apply_osx_system_defaults

info "Installing apps..."
# TODO

chmod +x ./scripts/symlinks.sh
if [[ "$overwrite_dotfiles" == "y" ]]; then
	warning "Deleting existing dotfiles..."
	./scripts/symlinks.sh --unlink --including-files
fi
./scripts/symlinks.sh --link

success "GREAT SUCCESS"
