#########################
#        Prompt         #
#########################
curDir=$(getCurrentBashDir)
source $curDir/colors.bash

function prompt {
  echo -n -e "\033]0;Russell@IXL\007"
  export PS1="$DATECOLOR\@ on \d $NOCOLOR| $REDORANGE\w\n${RED}Kundalini ${ORANGE}Svadhisthana ${YELLOW}Manipura ${GREEN}Anahata ${BLUE}Visuddha ${INDIGO}Ajna ${PURPLE}Sahasrara$(promptHelper)\nIt's dangerous to go alone! Take this. \n${BLUE}--|${NOCOLOR}=====>"
}

function promptHelper {
  result="\nproject: "$currentRepo" | git branch: "
  local gitBranch=$(__git_ps1 "%s")
  if [[ $gitBranch == master  || $gitBranch == trunk || $gitBranch == $MainGitBranchName ]]
    then
      result=$REDBG$result
    else
      gitBranch=$GREEN$gitBranch
  fi
  result=$NOCOLOR$result$gitBranch$NOCOLOR
  echo $result
}

# set up git tab completion
source $curDir/git-completion.bash
source $curDir/git-prompt.sh
complete -o default -o nospace -F _git g

#ENDSTRING=$prompt2

#doesn't work
#PROMPT_COMMAND=echo __git_ps1 "\@ on \d | \w\n" $ENDSTRING "git branch: %s\n"

PROMPT_COMMAND=prompt

##################
#     Memory     #
##################
function meminfo()
  {
  field=$1
  if [[ -n $field ]]; then
    cat /proc/meminfo | grep -i $field | awk '{print $2}'
  else
    cat /proc/meminfo
  fi
  }

function swapused()
  {
  echo $(( $(meminfo swaptotal) - $(meminfo swapfree) ))
  }