# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Always vertical list for ls
alias ls='ls -l --color=auto'
alias lsa='ls -la --color=auto'

# cd and ls
cd(){
    builtin cd "$@" && ls -l --color=auto
}

# Custom bash prompt
PS1='\u.\h [\W] \[\e[35m\]❯\[\e[0m\] '
