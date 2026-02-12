#!/usr/bin/env bash

. scripts/print_utils.sh
. scripts/prerequisites.sh
. scripts/osx_defaults.sh

info "Installing prerequisites..."
install_homebrew

info "Configuring OSX System defaults"
apply_osx_system_defaults

chmod +x ./scripts/symlinks.sh
./scripts/symlinks.sh --link
