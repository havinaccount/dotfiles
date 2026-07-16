HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz compinit
compinit

. "$HOME/.local/bin/env"
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.config/shell/aliases

source /etc/zsh_command_not_found
