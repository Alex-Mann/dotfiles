#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all


# Install other useful binaries.
brew install git
brew install ssh-copy-id
brew install tree
brew install caskroom/cask/brew-cask
brew install node
brew install mongodb

# Install Apps
brew cask install google-chrome
brew cask install dropbox
brew cask install xtrafinder
brew cask install google-drive
brew cask install atom

# Install npm modules
npm install -g grunt-cli
npm install -g yo
npm install -g bower


# Remove outdated versions from the cellar.
brew cleanup
