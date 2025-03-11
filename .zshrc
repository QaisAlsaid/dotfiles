# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#add powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

#add syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
#add auto-completions
zinit light zsh-users/zsh-completions
#add autosuggestions
zinit light zsh-users/zsh-autosuggestions
#add fzf-tab
zinit light Aloxaf/fzf-tab

#load zsh-comletions 
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#zstyle

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

#aliases
alias ls="eza --icons"
alias ll="ls -l"
alias find="fd"

eval "$(fzf --zsh)"

#alias cd=z
