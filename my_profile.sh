#!/bin/bash

function getCurrentBashDir {
  dirname $BASH_SOURCE
}

dir=$(getCurrentBashDir)

source $dir/my_path_vars.sh
source $dir/my_utils.sh
source $dir/my_aliases.sh
source $dir/my_prompt.sh