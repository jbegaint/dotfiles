#!/bin/zsh
autoload -Uz colors && colors

PROMPT=$'%~%{$fg[red]%}$(__git_ps1 \" (%s)\")%{$fg_bold[blue]%} » %{$reset_color%}'

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
if [ -f ~/.ssh/keys ]; then
	keys=$(cat ~/.ssh/keys)
	eval $(keychain --eval --agents ssh --nogui -q $keys)
fi

# color scheme (check for interactive mode before sourcing)
[[ $- == *i* ]] && . ~/.config/base16-shell/base16-tomorrow.dark.sh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
