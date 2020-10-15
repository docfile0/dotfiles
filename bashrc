# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# When changing or adding values run 'bash exec' afterwards
alias top='htop'
alias pip='pip3'
alias myip='wget -qO- ifconfig.co'
alias free='free -h'
export PS1="\033[0;33m\w$ \e[m"
