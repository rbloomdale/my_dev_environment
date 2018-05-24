##################
#     Memory     #
##################
function meminfo() {
  field=$1
  if [[ -n $field ]]; then
    cat /proc/meminfo | grep -i $field | awk '{print $2}'
  else
    cat /proc/meminfo
  fi
}

function swapused() {
  echo $(( $(meminfo swaptotal) - $(meminfo swapfree) ))
}

function myip {
  ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
}

###################
#     Android     #
###################
function emulatorProxy {
  proxyAddress=http://$(myip | head -n 1):8888
  echo "launching $1 on proxy $proxyAddress"
  /Users/rbloomdale/Library/Android/sdk/tools/emulator -netdelay none -netspeed full -avd $1 -http-proxy "$proxyAddress"
}

###################
#     General     #
###################
function countUnique {
  curl -s $1 | grep Optional | sed "$2" | sed "$3" | sort | uniq -c
}

function log {
  echo "***********"
  echo $1
  echo "***********"
}

function repeatCommand {
  echo -ne "\033[22t"
  outputLogName=repeatcommand.log
  for run in $(seq 1 $1)
    do
    log "start iteration $run"
    echo -en "\033]0; on iteration $run \a"
    $2 | tee $outputLogName && success=${PIPESTATUS[0]}
    echo "command exit status - "$success
    if [ ! $success = 0 ]
    then
      log "command failed on iteration $run"
      break
    else
      log "finish iteration $run"
    fi
  done
  echo -ne "\033[23t"
}

contains() {
  [[ $1 =~ (^|[[:space:]])$2($|[[:space:]]) ]] && exit 0 || exit 1
}


###################
#       Git       #
###################

function gitDeleteMergedBranches {
  doDelete=$(grep -n $(echo $@) "-f")
  echo "will delete - $doDelete"
  
  git fetch
  if [ ! $(git status --porcelain -uno) = "" ]
  then
    echo "Please stash or clear your changes"
    return 1
  fi
  
  git checkout develop
  if [ ! $? = 0 ]
  then
    echo "Failed to checkout develop"
    return 2
  fi
  
  list="$(git branch --no-color --merged)"
  echo "$list"
  for branch in $list
  do
    if [ $doDelete ]
    then
      echo "will delete $branch"
    else
      echo "deleting $branch" 
      git branch -D $branch
    fi
  done
}
