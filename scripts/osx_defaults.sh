SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. $SCRIPT_DIR/print_utils.sh


apply_osx_system_defaults() {
	# key repeats
	defaults write -g ApplePressAndHoldEnabled -bool false

	# Finder
	# show path bar
	defaults write com.apple.finder ShowPathbar -bool true
	# show status bar
	defaults write com.apple.finder "ShowStatusBar" -bool true
	# ---

	# Set Dock autohide
	defaults write com.apple.dock autohide -bool true
	defaults write com.apple.dock largesize -float 128
	defaults write com.apple.dock "minimize-to-application" -bool true
	defaults write com.apple.dock tilesize -float 32

	success "OSX System defaults configured successfully"
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
	apply_osx_system_defaults
fi
