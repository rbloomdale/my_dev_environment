#todo
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

curDir=$(getCurrentBashDir)
ln -s $curDir/AndroidStudio/Rainbow.icls ~/Library/Preferences/AndroidStudio2.3/colors/Rainbow.icls

brew install git-flow
brew install git-lfs
brew cask install sourcetree
brew cask install google-chrome
brew cask install android-studio