[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

[ -f "$HOME/.env" ] && source "$HOME/.env"

export NVIM_COLOR_SCHEME="nord"
export STARSHIP_COLOR_SCHEME="nord"
export WEZTERM_COLOR_SCHEME="nord"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$HOME/.local/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"

export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
