#!/bin/sh

# if we're not on a Mac, don't continue
if [ "$(uname)" != "Darwin" ]; then
  echo "Not on a Mac, exiting..."
  exit 0
fi

# if `brew` is not installed then install it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # add homebrew's bin directory to the system path
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# if Oh my zsh is not installed then install it
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh my zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# update homebrew recipes
echo "Updating homebrew..."
brew update

# CLI tools
brew install 'wget'
brew install 'autojump'
brew install 'watch'
brew install 'docker'

# Applications
brew install --cask 'docker'
brew install --cask 'google-chrome'
brew install --cask 'brave-browser'
brew install --cask 'slack'
brew install --cask 'gpg-suite'
brew install --cask 'keka'
brew install --cask 'postman'
brew install --cask 'warp'
brew install --cask 'jetbrains-toolbox'
brew install --cask 'rectangle'
brew install --cask 'evernote'