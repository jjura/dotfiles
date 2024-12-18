# Check if in interactive mode:
case $- in
    *i*) ;;
      *) return;;
esac

# Colors:
COLOR_DEFAULT="\e[0m"
COLOR_BLUE="\e[34m"
COLOR_GRAY="\e[90m"
COLOR_GREEN="\e[32m"
COLOR_RED="\e[31m"

# Set prompt:
PROMPT_HOSTNAME="\[$COLOR_RED\]\h\[$COLOR_GRAY\]"
PROMPT_USER="\[$COLOR_GREEN\]\u\[$COLOR_GRAY\]"
PROMPT_CWD="\[$COLOR_BLUE\]\w\[$COLOR_GRAY\]"
PROMPT_STATUS="\[$COLOR_GRAY\]■\[$COLOR_DEFAULT\]"

if [ -f "/etc/debian_chroot" ]
then
    PROMPT_HOSTNAME="\[$COLOR_RED\]$(cat "/etc/debian_chroot")\[$COLOR_GRAY\]"
fi

# Prompt:
PS1="\[$COLOR_GRAY\]┌─[$PROMPT_HOSTNAME][$PROMPT_USER][$PROMPT_CWD]\n\[$COLOR_GRAY\]└─$PROMPT_STATUS "

# Enable colors:
if [ -x "/usr/bin/dircolors" ]
then
    eval "$(dircolors -b)"

    alias ls="ls --color=auto"
    alias grep="grep --color=auto"
fi
