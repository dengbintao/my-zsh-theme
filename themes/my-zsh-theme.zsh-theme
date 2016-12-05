# vim:ft=zsh ts=2 sw=2 sts=2

# rvm
rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

### virtualenv
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg_bold[blue]%}ⓔ "
ZSH_THEME_VIRTUALENV_SUFFIX=" | %{$reset_color%}"

### NVM

ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg_bold[green]%}⬡ "
ZSH_THEME_NVM_PROMPT_SUFFIX=" |%{$reset_color%}"

### return code status
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

PROMPT='
$(nvm_prompt_info) $(virtualenv_prompt_info)%{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
${ret_status} %{$reset_color%}'

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RPROMPT='%{$fg_bold[red]%}‹$(rvm_current)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
  fi
fi
