alias ShowHiddenFiles="defaults write com.apple.finder AppleShowAllFiles -boolean true"
alias HideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles -boolean false"

export MainGitBranchName="develop"

###############
#     iOS     #
###############

################
#     brew     #
################
alias cask="brew cask"

#################
#    Android    #
#################
alias restartADB="~/Library/Android/sdk/platform-tools/adb kill-server; ~/Library/Android/sdk/platform-tools/adb start-server"

################
#    Utils     #
################
#alias deleteEmptyDirs = "for folder in $(find -type d ! -path *.svn*); do   if [ "`find $folder ! -path *.svn* ! -path $folder | wc -l`" -eq 0 ]; then    echo $folder; rm -r $folder;   fi; done"