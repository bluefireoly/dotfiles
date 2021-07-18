# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jakob/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# completion menu
zstyle ':completion:*' menu select

# show hidden files
_comp_options+=(globdots)

# do not freeze due to ctrl + s
stty stop undef 

# colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# enable colors
autoload -U colors && colors 

# colored less pages (e.g. man)
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

# navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word # delete previous word with ctrl+backspace
bindkey '^[[Z' undo # shift + tab undo last action

zmodload zsh/terminfo

# navigate in substring history using the arrow keys
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# aliases
alias ll="exa -l -h --git --icons"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias randomstring="tr -dc A-Za-z0-9 </dev/urandom | head -c 20 ; echo ''"
alias wtr="curl v2d.wttr.in"
alias minesweep="docker run --rm -it cpcloud86/minesweep:latest"

# default programs
export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL="$TERM"

# completion features
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# load syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ${ZDOTDIR:-$HOME}/.zshrc

# source broot (directory overview)
source /home/jakob/.config/broot/launcher/bash/br

# starship (prompt)
eval "$(starship init zsh)"

