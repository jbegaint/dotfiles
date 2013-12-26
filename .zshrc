# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

EDITOR="vim"

setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jean/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

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
setopt PROMPT_SUBST
source /usr/share/git/completion/git-prompt.sh

PS1=$'┌─[%n@%M][%~] $(__git_ps1 \"(%s)\")\n└─[\$] '

# key bindings
bindkey    "^[[3~"          delete-char

# Extract Function
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
          *)           echo "\`$1': unrecognized file compression" 
;;
      esac
  else
      echo "\`$1' is not a valid file"
  fi
}

# add monkey scripts and gems path...
PATH=~/bin:~/.gem/ruby/2.0.0/bin/$PATH

# load terminal colors
bash ~/.colors.sh
