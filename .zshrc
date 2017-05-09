export EDITOR="atom"
export VISUAL='atom'
export LANG="ru_RU.UTF-8"
export LC_PAPER="ru_RU.UTF-8"
export LC_MEASUREMENT="ru_RU.UTF-8"
export LC_TIME="ru_RU.UTF-8"
export LC_ALL="ru_RU.UTF-8"

# Base16 Shell
BASE16_SHELL="$HOME/.colors/base-16-shell/base16-tomorrow-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
setopt sharehistory
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt nobeep
setopt extended_glob
setopt nonomatch
setopt extended_history
setopt inc_append_history
setopt notify
setopt correctall
setopt noflowcontrol
setopt nohup
setopt checkjobs
setopt autocd
setopt longlistjobs
setopt hash_list_all
setopt completeinword
typeset -U path cdpath fpath manpath
setopt IGNORE_EOF

[ ! -s ~/.config/mpd/pid ] && mpd

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'
zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

setopt AUTO_CD
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=»
prompt pure

name() {
    name=$1
    vared -c -p 'rename to: ' name
    command mv $1 $name
}

###############################################

ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

pk () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2       ;;
 tar)      tar cpvf $2.tar  $2       ;;
 bz2)    bzip $2 ;;
 gz)        gzip -c -9 -n $2 > $2.gz ;;
 zip)       zip -r $2.zip $2   ;;
 7z)        7z a $2.7z $2    ;;
 *)         echo "'$1' cannot be packed via pk()" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

##############ex/pk#################################

alias inctmp='sudo mount -o remount,size=2G /tmp'


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
