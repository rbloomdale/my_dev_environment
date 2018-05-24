#todo
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

source ~/my_dev_environment/my_profile.sh

if [ ! -f ~/.bash_profile ]; then
  cp default.bash_profile ~/.bash_profile_test
else
  echo ".bash_profile already exists"
fi

brew install git-flow
brew install git-lfs
brew install the_silver_searcher
brew cask install sourcetree
brew cask install google-chrome
brew cask install android-studio
brew cask install Caskroom/cask/provisioning
brew cask install pandora
brew cask install charles
brew cask install intellij-idea
brew cask install itsycal

gem install rubydns

ln -s AndroidStudio/Rainbow.icls ~/Library/Preferences/AndroidStudio3.0/colors/Rainbow.icls
