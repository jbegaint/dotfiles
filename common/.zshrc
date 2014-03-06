#!/bin/zsh

# env
export EDITOR="vim"
export PS1=$'┌─[%n@%M][%~] $(__git_ps1 \"(%s)\")\n└─[\$] '
export PATH=~/bin:~/.gem/ruby/2.0.0/bin/:$PATH

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
    echo -ne '\a'
)

# git-prompt stuff
source /usr/share/git/completion/git-prompt.sh

# key bindings
bindkey -e
bindkey    "^[[3~"          delete-char

# extract function
extract() {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "\`$1': unrecognized file compression";;
      esac
  else
      echo "\`$1' is not a valid file"
  fi
}

# load terminal colors
 
BASE16_SCHEME="tomorrow"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# load virtual env stuff
source /usr/bin/virtualenvwrapper.sh 

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

