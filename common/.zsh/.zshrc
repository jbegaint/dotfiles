#!/bin/zsh
autoload -Uz compinit colors
colors

get_dir () {
	[[ "$PWD" != "$HOME" ]] && echo ' %~'
}

# env
export EDITOR="vim"
# export PS1=$'┌─[%n@%M][%~] $(__git_ps1 \"(%s)\")\n└─[\$] '
export PS1=$'
$(get_dir)%{$fg[red]%}$(__git_ps1 \" (%s)\")%{$fg_bold[blue]%} » %{$reset_color%}'
# export PS1=$'
#  %~%{$fg[red]%}$(__git_ps1 \" (%s)\")%{$fg_bold[blue]%} » %{$reset_color%}'
export PATH="$HOME/bin:$PATH"

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# zsh options
setopt AUTOCD
setopt PROMPT_SUBST

# completion
compinit
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

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
