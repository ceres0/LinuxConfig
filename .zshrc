# 如果没有antigen则自动安装
INSTALL_DIR="/usr/share"
LOCAL_BIN_DIR="/usr/local/bin"
BIN_DIR="/usr/bin"
ANTIGEN="$HOME/.antigen.zsh"

if [ ! -f "$ANTIGEN" ]; then
	sudo curl -L git.io/antigen > "$ANTIGEN"
fi

source "$ANTIGEN"
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle agkozak/zsh-z
antigen bundle sudo
antigen bundle extract
antigen bundle rand-quote
antigen theme af-magic
antigen apply
# 启用彩色提示符
autoload -U colors && colors
# 每次刷新提示符
setopt prompt_subst
# 设置提示符
PROMPT='❰%{$fg[green]%}%n%{$reset_color%}|%{$fg[yellow]%}%1~%{$reset_color%}%{$fg[blue]%}$(git branch --show-current 2&> /dev/null | xargs -I branch echo "(branch)")%{$reset_color%}❱ '
# bindkey '^n' autosuggest-accept
# alias python='python3'

if [ ! -f "$LOCAL_BIN_DIR/pokemonsay" ]; then
	if [ ! -d "$INSTALL_DIR/cowsay" ]; then
	       sudo apt install cowsay
	fi
	git clone http://github.com/possatti/pokemonsay
	cd pokemonsay
	./install.sh
	cd	
	rm -rf pokemonsay
	sudo ln -s ~/bin/pokemon* $BIN_DIR 
fi
if [ ! -f "/usr/games/fortune" ]; then
       sudo apt install fortune
fi
if [ ! -f "$BIN_DIR/neofetch" ]; then
	sudo apt install neofetch
fi
neofetch
fortune | pokemonsay
