#!/bin/sh

export ZDOTDIR=$HOME/.config/zsh

HISTFILE=~/.zsh_history
setopt appendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
zstyle ':completion:*' menu select
# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist

# Include hidden files.
_comp_options+=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
[[ -f $HOME/.job_specific.zsh ]] && source $HOME/.job_specific.zsh
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"
zsh_add_file "zsh-tools"
#
# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"
zsh_add_plugin "jeffreytse/zsh-vi-mode"
# zsh_add_plugin "qoomon/zsh-lazyload"

# lazyload pyenv -- '
#   export PYENV_ROOT="$HOME/.pyenv"
#   export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init -)"
#   eval "$(pyenv virtualenv-init -)"
#     '

# History search keybindings for vi mode
bindkey -M vicmd '^[[A' up-line-or-beginning-search
bindkey -M viins '^[[A' up-line-or-beginning-search
bindkey -M vicmd '^p' up-line-or-beginning-search

bindkey -M vicmd '^[[B' down-line-or-beginning-search
bindkey -M viins '^[[B' down-line-or-beginning-search
bindkey -M vicmd '^n' down-line-or-beginning-search


# zsh-vi-mode overrides keybindigs othervise
zvm_after_init_commands+=("bindkey -M viins '^n' down-line-or-beginning-search")
zvm_after_init_commands+=("bindkey -M viins '^p' up-line-or-beginning-search")

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_HIGHLIGHT_FOREGROUND=#d3c6aa
ZVM_VI_HIGHLIGHT_BACKGROUND=#3a4248

zvm_after_init_commands+=("source <(fzf --zsh)")

compinit
