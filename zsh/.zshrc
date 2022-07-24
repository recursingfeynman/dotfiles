# Lines configured by zsh-newuser-install
#
source ~/.config/zsh/.zprofile #.zshenv stuff

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=1000

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/amadeus/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export EDITOR=nvim
export TERMINAL='kitty'
export BROWSER='google-chrome-stable'
export VISUAL=nvim

export PATH=$PATH:/home/amadeus/.local/bin

# export PATH="/home/amadeus/miniconda3/bin:$PATH"

declare -a PROMPTS
PROMPTS=(
    "Σ"
    "Λ"
    "Ξ"
    "Ω"
    "Ψ"
    "Θ"
    "σ"
    "ω"
    "Μ"
)

RANDOM=$$$(date +%s)
ignition=${PROMPTS[$RANDOM % ${#RANDOM[*]}+1]}
PROMPT='%F{yellow}%1~%f %F{green}$ignition%f '

## Git Settings
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git



alias v='nvim'
alias f='ranger'
alias t='btop'
alias tty='tty-clock -C1 -c'
alias ls='lsd -A'
alias ll='lsd -lA'
# Unimatrix aliases
alias unimatrixr='unimatrix -s 70 -c red'
alias unimatrixy='unimatrix -s 70 -c yellow'
alias unimatrixm='unimatrix -s 70 -c magenta'
## Snippets
alias ddate='date +"%R - %a, %B %d, %Y" | xclip -select clipboard && date +"%R - %a, %B %d, %Y"' 
alias dday='date +"%Y.%m.%d - " | xclip -select clipboard ; date +"%Y.%m.%d"'

alias whordp2vnc='sudo lsof -i -P -n | grep ESTAB | grep vnc'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/amadeus/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/amadeus/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/amadeus/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/amadeus/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> Start XORG with 10 seconds delay <<<
/home/amadeus/.config/zsh/xstartx
# >>> Startx XORG with 10 seconds delay <<<

