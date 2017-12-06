# homebrew
set -x PATH /usr/local/bin /usr/local/sbin $PATH

# golang
set -x GOROOT /usr/local/Cellar/go/1.9/libexec
set -x GOPATH $HOME/dev/go
set -x PATH $GOPATH/bin $PATH

# alias

## for vagrant
alias vh="vagrant halt"
alias vp="vagrant provision"
alias vs="vagrant ssh"
alias vu="vagrant up"

## for git
alias ga='git add'
alias gb='git branch'
alias gd='git diff'
alias gl='git log'
alias glg='git log --graph'
alias glo='git log --oneline'
alias glog='git log --oneline --graph'
alias gs='git status'

## for rails
alias bi='bundle install'
alias rs='rails server'
alias rc='rails console'
alias rg='rails generate'
alias rr='rails runner'
alias rdb='rails dbconsole'

# vi mode
fish_vi_key_bindings
