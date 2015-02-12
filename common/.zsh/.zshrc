#!/bin/zsh
autoload -Uz colors && colors

get_dir () {
	[[ "$PWD" != "$HOME" ]] && echo ' %~'
}

PROMPT=$'
$(get_dir)%{$fg[red]%}$(__git_ps1 \" (%s)\")%{$fg_bold[blue]%} » %{$reset_color%}'

# vi mode
function zle-line-init zle-keymap-select {
	RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/ }"
	RPS2=$RPS1
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# env
export EDITOR="vim"
export GOPATH="$HOME/.go"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.dynamic-colors/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.1.0/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# history
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000

# zsh options
setopt AUTOCD
setopt PROMPT_SUBST

# completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

source $HOME/.dynamic-colors/completions/dynamic-colors.zsh

# load aliases
ALIASFILE=~/.zsh/.zshrc_aliases
if [ -f $ALIASFILE ]; then
    source $ALIASFILE
else
    print "404: $ALIASFILE not found."
fi

# enable alert
precmd () (
    echo -ne '\a'
)

# git-prompt stuff
source /usr/share/git/completion/git-prompt.sh

# key bindings
bindkey -e
bindkey    "^[[3~"          delete-char

# keychain
keys=$(cat ~/.ssh/keys)
eval $(keychain --eval --agents ssh --nogui -q $keys)

# color scheme
source ~/.config/base16-shell/base16-tomorrow.dark.sh
