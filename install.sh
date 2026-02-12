#!/usr/bin/env bash

. scripts/print_utils.sh
. scripts/prerequisites.sh

# Prerequisites
info "Installing prerequisites..."
install_homebrew

# ---

chmod +x ./scripts/symlinks.sh
./scripts/symlinks.sh --link
