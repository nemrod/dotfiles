ln -s $HOME/.dotfiles/.zshrc $HOME
ln -s $HOME/.dotfiles/.vimrc $HOME
ln -s $HOME/.dotfiles/.tmux.conf $HOME
ln -s $HOME/.dotfiles/.xinitrc $HOME
ln -s $HOME/.dotfiles/.Xresources $HOME
ln -s $HOME/.dotfiles/.i3blocks.conf $HOME
ln -s $HOME/.dotfiles/.bin $HOME
mkdir -p $HOME/.i3
ln -s $HOME/.dotfiles/.i3/config.base $HOME/.i3
mkdir -p $HOME/.config/dunst
ln -s $HOME/.dotfiles/.config/dunst/dunstrc $HOME/.config/dunst
mkdir -p $HOME/.config/qutebrowser
ln -s $HOME/.dotfiles/.config/qutebrowser/config.py $HOME/.config/qutebrowser
mkdir -p $HOME/.config/termite
ln -s $HOME/.dotfiles/.config/termite/config $HOME/.config/termite
