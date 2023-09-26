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
fi