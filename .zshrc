# Aliases
alias ls='ls -FH --color=auto'
alias l='ls'
alias ll='l -l'
alias la='l -a'
alias lh='l -lh'
alias lah='l -lah'
alias grepr='grep --color=always -Rin'
alias lessc='less -R'
alias rg='rg -LSn --color=always --no-heading'
alias history='fc -il 1'

# Environment
export LC_CTYPE='en_US.UTF-8'
export PROMPT='%K{18} %n@%m %~ %# %k '
export RPROMPT='%(?..%K{18}[%?]%k)'
export EDITOR='vim'
export VISUAL="$EDITOR"
export BROWSER='qutebrowser'
export PATH="$HOME/.bin:$PATH:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/games"

eval $(dircolors --sh)

# Functions
function cdg {
	[ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = "true" ] && cd -- "$(git rev-parse --show-toplevel)"
}

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"

HISTSIZE=11000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# Options
bindkey -v
set -o vi

setopt AUTO_CD \
	LIST_TYPES \
	MARK_DIRS \
	EXTENDED_GLOB

# Completion
autoload -U compinit
compinit -u

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%BNo match:%b %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s/:/)LS_COLORS}
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:*:kill*:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:kill*:*' menu yes select
zstyle ':completion:*:processes-names' command  'ps c -u ${USER} -o command | uniq'

compdef pkill=killall
compdef skill=killall

# ssh-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
	ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-thing)
fi

# Plugins
source ~/.zplug/init.zsh
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zplug/zplug', hook-build: 'zplug --self-manage'
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi
zplug load

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Colours
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Local
[ -r "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
