#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias skype='xhost +local: && su skype -c skype'
alias temp='cat /proc/acpi/ibm/thermal'

extract() {
 local e=0 i c
 for i; do
   if [ -f $i && -r $i ]; then
       c=
       case $i in
         *.tar.bz2) c='tar xjf'    ;;
         *.tar.gz)  c='tar xzf'    ;;
         *.bz2)     c='bunzip2'    ;;
         *.gz)      c='gunzip'     ;;
         *.tar)     c='tar xf'     ;;
         *.tbz2)    c='tar xjf'    ;;
         *.tgz)     c='tar xzf'    ;;
         *.7z)      c='7z x'       ;;
         *.Z)       c='uncompress' ;;
         *.exe)     c='cabextract' ;;
         *.rar)     c='unrar x'    ;;
         *.xz)      c='unxz'       ;;
         *.zip)     c='unzip'      ;;
         *)     echo "$0: cannot extract \`$i': Unrecognized file 
extension" >&2; e=1 ;;
       esac
       [ $c ] && command $c "$i"
   else
       echo "$0: cannot extract \`$i': File is unreadable" >&2; e=2
   fi
 done
 return $e
}

