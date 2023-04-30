# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.zsh
export EDITOR="nvim"

# For eslint_d
export ESLINT_D_LOCAL_ESLINT_ONLY=1

path+=("$HOME/.local/bin/")
path+=("/usr/local/opt/libpq/bin")
export PATH

ZSH_THEME="powerlevel10k/powerlevel10k"
PROJECTS="$HOME/Projects"

# zsh-vi-mode config
function zvm_config(){
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLOCK
}

zstyle ':omz:update' frequency 30

plugins=(git rails bundler asdf fzf tmux autojump sudo zsh-vi-mode zsh-interactive-cd zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
