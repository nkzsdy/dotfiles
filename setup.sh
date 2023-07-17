#!/bin/zsh

# modify key repeat settings
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

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
ln -s ~/dotfiles/zsh/.zshrc              ~/.zshrc
ln -s ~/dotfiles/zsh/.zlogin             ~/.zlogin
ln -s ~/dotfiles/zsh/.zlogout            ~/.zlogout
ln -s ~/dotfiles/zsh/.zpreztorc          ~/.zpreztorc
ln -s ~/dotfiles/zsh/.zprofile           ~/.zprofile
ln -s ~/dotfiles/zsh/.zshenv             ~/.zshenv
ln -s ~/dotfiles/.gitconfig              ~/.gitconfig
ln -s ~/dotfiles/.tigrc                  ~/.tigrc
ln -s ~/dotfiles/vim/.vimrc              ~/.vimrc
mkdir ~/.config/alacritty
ln -s ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/dotfiles/.tmux.conf              ~/.tmux.conf

# clone my shell commands
git clone https://github.com/nkzsdy/mylocalbin.git ~/bin

# tmux settings
# true color support
if !(type infocmp > /dev/null 2>&1); then
  echo "[ERROR] infocmp not found. Please install for tmux true color support."
  exit 1
fi
infocmp tmux-256color > ~/tmux-256color.info
tic -xe tmux-256color ~/tmux-256color.info
