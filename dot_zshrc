# Performance optimization: Skip global compinit for faster startup
skip_global_compinit=1

# History settings
HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_find_no_dups

autoload -U colors && colors
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{cyan}%d%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

# Make word movement behave like text editors
autoload -U select-word-style
select-word-style bash

# Key bindings for command history navigation
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char # delete characters using the "delete" key
bindkey "^C" autosuggest-clear

# Environment variables
export EDITOR=nvim
export PAGER=less
export BROWSER=firefox
export LYNX_CFG=$HOME/.config/lynx/lynx.cfg

# PATH management
typeset -U PATH  # Remove duplicates from PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# Aliases
alias get-music="yt-dlp -x -f bestaudio --audio-format mp3 --embed-thumbnail"
alias music="cd $HOME/Folders/Personal/Music"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Plugin management with better error handling
ZSH_PLUGINS_DIR="$HOME/.config/zsh/plugins"

# Add completions to fpath
if [[ -d "$ZSH_PLUGINS_DIR/zsh-completions/src" ]]; then
    fpath=("$ZSH_PLUGINS_DIR/zsh-completions/src" $fpath)
fi

# Initialize completions
autoload -Uz compinit
# Only run compinit once per day for better performance
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

plugins=(
    "zsh-autosuggestions/zsh-autosuggestions.zsh"
    "zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    "colored-man-pages.plugin.zsh"
)

for plugin in "${plugins[@]}"; do
    plugin_path="$ZSH_PLUGINS_DIR/$plugin"
    [[ -r "$plugin_path" ]] && source "$plugin_path"
done

# fzf integration (if available)
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

if command -v starship &> /dev/null; then
    export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
    eval "$(starship init zsh)"
fi

# Local customizations (load last)
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
