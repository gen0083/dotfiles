setopt prompt_subst

precmd () {
  # 直前のコマンド結果
  if [ $? -eq 0 ];then
    return_previous_result="%F{green}[%?]%f"
  else
    return_previous_result="%F{red}[%?]%f"
  fi
  # gitチェック
  if [ -n "$(git status --short 2>/dev/null)" ];then
    GIT_HAS_DIFF="✗"
    GIT_NON_DIFF=""
  else
    GIT_HAS_DIFF=""
    GIT_NON_DIFF="✔"
  fi
  # git管理されているか確認
  git status --porcelain >/dev/null 2>&1
  if [ $? -ne 0 ];then
    NOT_GIT_REPOSITORY="1"
  else
    NOT_GIT_REPOSITORY="0"
    BRANCH_NAME=$(git branch --show-current 2>/dev/null)
  fi
  # RPROMPTに出力
  if [ "$NOT_GIT_REPOSITORY" = "1" ];then
    RPROMPT="${return_previous_result}"
  elif [ "$GIT_HAS_DIFF" != "" ];then
    RPROMPT="%f%F{red}${BRANCH_NAME}${GIT_HAS_DIFF}%f ${return_previous_result}"
  else
    RPROMPT="%f%F{green}${BRANCH_NAME}${GIT_NON_DIFF}%f ${return_previous_result}"
  fi
}

PROMPT='[%f%F{green}%~%f] [@%f%F{cyan}%n%f] [%D / %*]
 %# '

