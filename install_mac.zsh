#!/usr/bin/env zsh

if [[ ! -d "$HOME/.oh-my-zsh/" ]]; then
    echo "Installing OhMyZSH"
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

if test ! $(which brew); then 
    echo "Installing homebrew package manager"
    xcode-select --install &> /dev/null
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing/updating packages with homebrew"
brew update &> /dev/null
brew tap homebrew/bundle
brew bundle --file ./homebrew/Brewfile

echo "Linking config files"
rm -rf $HOME/.zshrc
stow -t ~ zsh
mkdir -p ~/.config/nvim &> /dev/null
stow -t ~/.config/nvim nvim

