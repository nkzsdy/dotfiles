# homebrew
set -x PATH /usr/local/bin /usr/local/sbin $PATH

# golang
set -x GOPATH $HOME/dev/go
set -x PATH $GOPATH/bin $PATH

# alias
alias g='git'
alias t='tig'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias vs='vagrant ssh'
alias vu='vagrant up'
alias be='bundle exec'

function fish_user_key_bindings
  bind \c] peco_change_directory # Bind for peco change directory to ctrl+]
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nkzsdy/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/nkzsdy/google-cloud-sdk/path.fish.inc'; else; . '/Users/nkzsdy/google-cloud-sdk/path.fish.inc'; end; end

# anyenv
set -x PATH $HOME/.anyenv/bin $PATH

# ndenv
set -x NDENV_ROOT $HOME/.anyenv/envs/ndenv
set -x PATH $HOME/.anyenv/envs/ndenv/bin $PATH
set -x PATH $NDENV_ROOT/shims $PATH

# goenv
set -x GOENV_ROOT $HOME/.anyenv/envs/goenv
set -x PATH $HOME/.anyenv/envs/goenv/bin $PATH
set -gx PATH $GOENV_ROOT/shims $PATH
set -gx GOENV_SHELL fish

# pyenv
set -x PYENV_ROOT $HOME/.anyenv/envs/pyenv
set -x PATH $HOME/.anyenv/envs/pyenv/bin $PATH
set -gx PATH $PYENV_ROOT/shims $PATH
set -gx PYENV_SHELL fish
