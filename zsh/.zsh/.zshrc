#!/bin/zsh
# vim: ts=4:sw=4:ft=zsh:

# zsh options
setopt AUTOCD
setopt PROMPT_SUBST

# completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# enable colors
autoload -Uz colors && colors

# git-prompt
source /usr/share/git/completion/git-prompt.sh

# Simple prompt
PROMPT=$'\n%{$fg_bold[magenta]%}➜ %{$fg_bold[cyan]%}%~%{$fg_bold[yellow]%}$(__git_ps1 \" (%s)\") %{$reset_color%}'
RPROMPT=''

# env
export EDITOR="vim"
export GOPATH="$HOME/.go"
export RUBYPATH="$(ruby -e 'print Gem.user_dir')"
export PATH="$HOME/bin:$RUBYPATH/bin:$GOPATH/bin:$PATH"

# history
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000

# load aliases
ALIASFILE=~/.zsh/.zshrc_aliases
if [ -f $ALIASFILE ]; then
	source $ALIASFILE
else
	print "404: $ALIASFILE not found."
fi

# enable alert
precmd () {
    echo -ne '\a'
}

# key bindings
bindkey -e
bindkey    "^[[3~"          delete-char

# check for interactive mode
if [[ $- == *i* ]]; then
	# color scheme
	. ~/.config/base16-shell/base16-tomorrow.dark.sh

	# fuzzy completion
	[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

	# z
	. ~/bin/z/z.sh

	# dircolors
	eval $(dircolors ~/.dircolors)
fi
