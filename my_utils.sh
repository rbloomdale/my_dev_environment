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
  proxyAddress=http://$(myip):8888
  echo "launching $1 on proxy $proxyAddress"
  /Users/rbloomdale/Library/Android/sdk/tools/emulator -netdelay none -netspeed full -avd $1 -http-proxy $proxyAddress
}

function countUnique {
  curl -s $1 | grep Optional | sed "$2" | sed "$3" | sort | uniq -c
}