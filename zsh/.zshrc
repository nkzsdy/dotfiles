#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# tmux auto-attach (tmux がある & tmux の外にいるときだけ)
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default 2>/dev/null || tmux new-session -s default
fi

# Customize to your needs...

# zsh の補完を有効化
autoload -Uz compinit && compinit

# 補完候補を一覧表示にする
setopt auto_list

# TAB で順に補完候補を切り替える
setopt auto_menu

# 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1

# 補完候補の色づけ
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ヒストリを活用する
export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups

# コマンドがスペースで始まる場合、コマンド履歴に追加しない
# 例： <Space>echo hello と入力
setopt hist_ignore_space

# shadowenv
eval "$(shadowenv init zsh)"

# editor
export EDITOR='nvim'
export VISUAL='nvim'

# alias
alias e='nvim' # e is for editor
alias d='docker'
alias dc='docker compose'
alias g='git'
alias la='ls -la'
alias t='tig'

# golang
export GOBIN=$HOME/go/bin
export PATH=$GOBIN:$PATH

# Android Studio
export PATH="$PATH":"$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH":"$ANDROID_HOME/platform-tools"
export ANDROID_HOME="$HOME/Library/Android/sdk"

# PATH
export PATH="$PATH":"$HOME/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# functions

# cdr (Change Directory of Repository)
# ghq管理化のリポジトリから選択して移動
function cdr () {
  local selected_dir=$(ghq list -p | fzf --prompt="repositories > " --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N cdr
bindkey '^]' cdr

# histree-zsh configuration
export PATH="${HOME}/.histree-zsh/bin:${PATH}"
export HISTREE_DB="${HOME}/.histree.db"
export HISTREE_LIMIT=100
source "${HOME}/.histree-zsh/histree.zsh"

# mise
eval "$(mise activate zsh)"
