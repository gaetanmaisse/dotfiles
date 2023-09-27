#!/bin/sh

# Load the .zshrc file
source ~/.zshrc

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

# update homebrew recipes
echo "Updating homebrew..."
brew update

# install all our dependencies with bundle (See Brewfile)
echo "Installing packages..."
brew bundle install --file=~/Brewfile

# if Oh my zsh is not installed then install it
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh my zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
