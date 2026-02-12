setopt HIST_IGNORE_ALL_DUPS

[ -f "$HOME/.config/zsh/git_aliases.zsh" ] && source "$HOME/.config/zsh/git_aliases.zsh"
[ -f "$HOME/.config/zsh/more_customizations.zsh" ] && source "$HOME/.config/zsh/more_customizations.zsh"

[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
