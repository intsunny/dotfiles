HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

zstyle :compinstall filename '/home/sunny/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%F{red}%b%f)'

setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%  ${vcs_info_msg_0_}# '
eval "$(~/.local/bin/mise activate zsh)"

# Aliases

alias drawio='kde-open "http://localhost:8080" ; docker run -it --rm --name="draw" -p 8080:8080 -p 8443:8443 jgraph/drawio'
alias vi=nvim
alias vim=nvim
