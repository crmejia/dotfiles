
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

#Bash completion and kubectl completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
source <(kubectl completion bash)

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/crismarmejia/google-cloud-sdk/path.bash.inc' ]; then source '/Users/crismarmejia/google-cloud-sdk/path.bash.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/crismarmejia/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/crismarmejia/google-cloud-sdk/completion.bash.inc'; fi

#Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

########################
#GNU coreutils neeeded for k8s devel
# see https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/

#If you really need to use these commands with their normal names, you can add a "gnubin" directory to your PATH from your bashrc like:
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

#Additionally, you can access their man pages with normal names if you add the "gnuman" directory to your MANPATH from your bashrc as well:
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

#ALIASES
colorflag="--color=auto"

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Make nvim the default editor.
export EDITOR='nvim';
alias vim="nvim"
alias vi="nvim"

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

####PATHS
export PATH=$(brew --prefix openvpn)/sbin:$PATH