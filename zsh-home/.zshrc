# XDG data directories config
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"

# Select theme
fpath+=($XDG_CONFIG_HOME/zsh/agnoster)
autoload -U promptinit; promptinit
prompt agnoster
export DEFAULT_USER=`whoami`

# Support prefix matching history with up/down arrow (https://unix.stackexchange.com/a/97844)
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Support all completions by default
fpath+=($XDG_CONFIG_HOME/zsh/completions)

# Enabling fzf for ctrl-R
[ -f "$XDG_CONFIG_HOME/zsh/.fzf.zsh" ] && source "$XDG_CONFIG_HOME/zsh/.fzf.zsh"

# Set up git completions (which were downloaded from https://github.com/git/git/blob/master/contrib/completion/)
zstyle ':completion:*:*:git:*' script ~/.zsh/completions/git-completions.bash

# Set up Homebrew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Hook direnv
eval "$(direnv hook zsh)"

# Configure pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Set up Poetry
export PATH="/Users/christopher/.local/bin:$PATH"
poetry completions zsh > ~/.zfunc/_poetry
