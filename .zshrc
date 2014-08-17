# Aliases
alias ls='ls -FH --color=auto'
alias l='ls'
alias ll='l -l'
alias la='l -a'
alias lah='l -lah'
alias blankcd='cdrecord dev=/dev/cdrom blank=fast'
alias burncd='cdrecord dev=/dev/cdrom -overburn -v'
alias unzip_all='for f in *.zip; do dir="$f:r"; [ -d "$dir" ] || unzip -d "$dir" "$f"; done'
alias unrar_all='for f in *.rar; do dir="$f:r"; [ -d "$dir" ] || (mkdir "$dir"; cd "./$dir"; unrar x "../$f"; cd ..); done'
alias lock="i3lock -dc 000000"

if echo $LANG $LC_ALL $LC_CTYPE | egrep -q 'UTF-?8'; then
	alias man='LC_CTYPE=C man'
fi

# Variables
export LC_CTYPE="en_US.UTF-8"

export PS1="[%n@%m:%~] "
export EDITOR=vim
export VISUAL=$EDITOR
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.mkv=01;35:*.wmv=01;35:*.ogm=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

export PATH="$HOME/bin:$PATH:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/games:/opt/android-sdk/tools:/opt/android-sdk/platform-tools:/sbin:/usr/share/java/apache-ant/bin"

export MYSQL_HISTFILE=/dev/null
unset HISTFILE

export WINEARCH=win32

# Options
setopt AUTO_CD    \
       LIST_TYPES \
       MARK_DIRS  \
	   EXTENDED_GLOB

set -o vi

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

# Fix Debians broken line-or-history settings
[[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" up-line-or-history
[[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" down-line-or-history
[[ "$terminfo[kcuu1]" == ""* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" up-line-or-history
[[ "$terminfo[kcud1]" == ""* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" down-line-or-history
