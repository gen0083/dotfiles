autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd(){ vcs_info }

PROMPT='[%f%F{green}%d%f] [%f%F{cyan}%n%f] [ %D / %* ]
 %# '
RPROMPT='${vcs_info_msg_0_}'"$p_color return:[%?]%{${reset_color}%}"

