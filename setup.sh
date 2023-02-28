#!/bin/zsh

# modify key repeat settings
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# setup prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# setup homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/nkzsdy/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew upgrade
brew update

# install command line tools & applications
brew bundle

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2

# link dotfiles
ln -sf ~/dotfiles/zsh/.zshrc     ~/.zshrc
ln -sf ~/dotfiles/zsh/.zlogin    ~/.zlogin
ln -sf ~/dotfiles/zsh/.zlogout   ~/.zlogout
ln -sf ~/dotfiles/zsh/.zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/zsh/.zprofile  ~/.zprofile
ln -sf ~/dotfiles/zsh/.zshenv    ~/.zshenv
ln -sf ~/dotfiles/.gitconfig     ~/.gitconfig
ln -sf ~/dotfiles/.tigrc         ~/.tigrc
ln -sf ~/dotfiles/vim/.vimrc     ~/.vimrc
