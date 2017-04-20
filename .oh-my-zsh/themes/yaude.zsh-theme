# Oh-my-Zsh prompt created by gianu
#
# github.com/gianu
# sgianazza@gmail.com

#PROMPT='%{$fg_bold[green]%}(%{$reset_color%}%{$fg_bold[blue]%}%n%{$reset_color%}%{$fg_bold[green]%}@%{$fg_bold[cyan]%}%m%{$reset_color%}%{$fg_bold[green]%})%{$reset_color%} %{$fg_bold[white]%}%c%{$reset_color%}%{$reset_color%}%{$fg_bold[blue]%} λ %{$reset_color%}'
PROMPT='%{$fg_bold[green]%}(%{$reset_color%}%{$fg_bold[blue]%}%n%{$reset_color%}%{$fg_bold[green]%}@%{$fg_bold[cyan]%}%m%{$reset_color%}%{$fg_bold[green]%})%{$reset_color%} %{$fg_bold[white]%}%c%{$reset_color%}%{$reset_color%}%{$fg_bold[blue]%} » %{$reset_color%}'

# Git branch on the right
RPROMPT='%(?.%{$fg_bold[grey]%}.%{$fg_bold[red]%})$(date +"[%H:%M]")%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[grey]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
