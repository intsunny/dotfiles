HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

zstyle :compinstall filename '/home/sunny/.zshrc'

autoload -Uz compinit
compinit

PROMPT="%F{green}%n@%m%f:%F{blue}%~%f%# "
