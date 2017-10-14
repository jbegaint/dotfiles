# vim: ts=4:sw=4:ft=zsh:

include() {
	[[ -f $1 ]] && {source $1; return 0} || {printf 'Error: file "%s" not found.\n' $1; return 1}
}

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
include /usr/share/git/completion/git-prompt.sh && GIT_PS1_SHOWDIRTYSTATE=true

# Simple prompt
PROMPT=$'\n%{$fg_bold[magenta]%} » %{$fg_bold[cyan]%}%~%{$reset_color%}%{$fg_bold[yellow]%}$(__git_ps1 \" (%s)\") %{$reset_color%}'
RPROMPT=''

# env
export EDITOR="nvim"
export BROWSER="chromium"
PATH="/usr/lib/ccache/bin/:$HOME/bin:$PATH"
PATH="$HOME/.node_modules/bin:$PATH"

# history
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000

# load aliases
include ~/.zsh/.zshrc_aliases

# key bindings
bindkey -e
bindkey    "^[[3~"          delete-char

# color scheme
#include ~/.config/base16-shell/scripts/base16-tomorrow-night.sh
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# fuzzy completion
include /usr/share/fzf/completion.zsh
include /usr/share/fzf/key-bindings.zsh

# z
. ~/.zsh/z.sh
function precmd () {
	z --add "$(pwd -P)"
	# enable alert
	echo -ne '\a'
}

export npm_config_prefix=~/.node_modules

# virtualenv
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh
