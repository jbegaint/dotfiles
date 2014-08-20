#!/bin/zsh

# env
export EDITOR="vim"
export PS1=$'┌─[%n@%M][%~] $(__git_ps1 \"(%s)\")\n└─[\$] '
export PATH=~/bin:~/.gem/ruby/2.0.0/bin/:$PATH
export PATH="$HOME/.dynamic-colors/bin:$PATH"

# history 
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# zsh options
setopt AUTOCD
setopt PROMPT_SUBST

# completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true


# load aliases
if [ -f ~/.zshrc_aliases ]; then
    source ~/.zshrc_aliases
else
    print "404: ~/.zshrc_aliases not found."
fi

# enable alert
precmd () (
	# print -Pn "\e]2;[%1~]\a"
    echo -ne '\a'
)

# git-prompt stuff
source /usr/share/git/completion/git-prompt.sh

# key bindings
bindkey -e
bindkey    "^[[3~"          delete-char

# load terminal colors
BASE16_SCHEME="tomorrow"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# load virtual env stuff
source /usr/bin/virtualenvwrapper.sh 

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
# source ~/.fzf.zsh
