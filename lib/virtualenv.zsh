# get the virtuanenv prompt
function virtualenv_prompt_info() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    virtualenv_prompt=`basename ${virtualenv_path}`
  fi 
  echo "${ZSH_THEME_VIRTUALENV_PROMPT_PREFIX}${virtualenv_prompt}${ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX}"
}
