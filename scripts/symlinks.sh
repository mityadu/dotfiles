#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SYMLINKS_CONFIG_FILE="$DOTFILES_DIR/symlinks.conf"

. $DOTFILES_DIR/scripts/print_utils.sh

# check symlinks.conf exists
if [ ! -f "$SYMLINKS_CONFIG_FILE" ]; then
	echo "symlinks.conf does not exist: ${SYMLINKS_CONFIG_FILE}"
	exit 1
fi

link() {
	info "Linking symlinks.conf"

	while IFS=: read -r source target || [ -n "$source" ]; do
		# skip empty lines and comments
		[[ -z "$source" || "$source" =~ ^[[:space:]]*# ]] && continue

		source="${DOTFILES_DIR}/$source"
		target="${HOME}/$target"

		if [ ! -e "$source" ]; then
			error "Source file '$source' does not exists. Skipping linking '$target'."
			continue
		fi

		if [ -L "$target" ]; then
			warning "Already linked: '$target'"
		elif [ -f "$target" ]; then
			warning "Already exists: '$target'"
		else
			target_dir=$(dirname "$target")

			if [ ! -d "$target_dir" ]; then
				mkdir -p "$target_dir"
				info "Created dir: '$target_dir'"
			fi

			ln -sf "$source" "$target"
			success "Linked: '$target'"
		fi


	done <"$SYMLINKS_CONFIG_FILE"
}

delete_links() {
	info "Deleting symlinks"

	while IFS=: read -r _ target || [ -n "$target" ]; do

		# skip empty and invalid lines
		if [[ -z "$target" ]]; then
			continue
		fi

		target="${HOME}/$target"

		if [ -L "$target" ] || { [ "$including_files" == true ] && [ -f "$target" ]; }; then
			rm -rf "$target"
			success "Deleted: '$target'"
		else
			warning "Not found: '$target'"
		fi

	done <"$SYMLINKS_CONFIG_FILE"
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
	case "$1" in
		"--link")
			link
			;;
		"--unlink")
			if [ "$2" == "--including-files" ]; then
				including_files=true
			fi
			delete_links
			;;
		*)
			error "Unknown argument '$1'"
			exit 1
			;;
	esac
fi
