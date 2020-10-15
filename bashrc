if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

alias top='htop'
alias pip='pip3'
alias myip='wget -qO- ifconfig.co'
alias free='free -h'
export PS1="\033[0;33m\w$ \e[m"
