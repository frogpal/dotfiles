# Autostart tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  # Attempt to attach to any existing session
  if tmux ls &> /dev/null; then
    tmux attach-session
  else
    # If no session exists, create a new one
    tmux new-session
  fi
fi

# History settings
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=1000
HISTDUP=erase
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_verify
autoload -U colors && colors

# Key bindings for command history navigation
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# bindkey '^H' backward-kill-word

# delete characters using the "delete" key
bindkey "^[[3~" delete-char

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Aliases
alias get-music="yt-dlp -x -f bestaudio --audio-format mp3 --embed-thumbnail"
alias music="cd $HOME/Folders/Personal/Music"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

fpath=($HOME/.config/zsh/plugins/zsh-completions/src/ $fpath)
autoload -Uz compinit && compinit

# Lazy-load plugins to improve startup speed
zsh_autosuggestions="$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
zsh_syntax_highlighting="$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
colored_man_pages="$HOME/.config/zsh/plugins/colored-man-pages.plugin.zsh"

[[ -r $zsh_autosuggestions ]] && source $zsh_autosuggestions
[[ -r $zsh_syntax_highlighting ]] && source $zsh_syntax_highlighting
[[ -r $colored_man_pages ]] && source $colored_man_pages

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"
export PATH=$PATH:$HOME/.local/bin
