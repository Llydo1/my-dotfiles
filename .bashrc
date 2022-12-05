#
# ~/.bashrc
#
startLogo=" ░█████╗░██╗░░░██╗██████╗░███████╗██████╗░██████╗░██╗░░░██╗███╗░░██╗██╗░░██╗  ██████╗░░█████╗░███████╗███████╗
██╔══██╗╚██╗░██╔╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██║░░░██║████╗░██║██║░██╔╝  ╚════██╗██╔══██╗╚════██║╚════██║
██║░░╚═╝░╚████╔╝░██████╦╝█████╗░░██████╔╝██████╔╝██║░░░██║██╔██╗██║█████═╝░  ░░███╔═╝██║░░██║░░░░██╔╝░░░░██╔╝
██║░░██╗░░╚██╔╝░░██╔══██╗██╔══╝░░██╔══██╗██╔═══╝░██║░░░██║██║╚████║██╔═██╗░  ██╔══╝░░██║░░██║░░░██╔╝░░░░██╔╝░
╚█████╔╝░░░██║░░░██████╦╝███████╗██║░░██║██║░░░░░╚██████╔╝██║░╚███║██║░╚██╗  ███████╗╚█████╔╝░░██╔╝░░░░██╔╝░░
░╚════╝░░░░╚═╝░░░╚═════╝░╚══════╝╚═╝░░╚═╝╚═╝░░░░░░╚═════╝░╚═╝░░╚══╝╚═╝░░╚═╝  ╚══════╝░╚════╝░░░╚═╝░░░░░╚═╝░░░"

export TERM="xterm-256color"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'


### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

### SETTING OTHER ENVIRONMENT VARIABLES
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi
export XMONAD_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/xmonad" # xmonad.hs is expected to stay here
export XMONAD_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/xmonad"
export XMONAD_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/xmonad"


## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
################################################################################


#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

. "$HOME/.cargo/env"

export PATH="$PATH:/home/llydo1/.foundry/bin"

term=$(ps -p $(ps -p $$ -o ppid=) -o args=)
printTerm(){
	echo $term
}
case $term in
	*terminology*)
		##-----------------------------------------------------
		## synth-shell-prompt.sh
		if [ -f /home/llydo1/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
			source /home/llydo1/.config/synth-shell/synth-shell-prompt.sh
		fi

		##-----------------------------------------------------
		## better-ls
		if [ -f /home/llydo1/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
			source /home/llydo1/.config/synth-shell/better-ls.sh
		fi

		##-----------------------------------------------------
		## alias
		if [ -f /home/llydo1/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
			source /home/llydo1/.config/synth-shell/alias.sh
		fi

		##-----------------------------------------------------
		## better-history
		if [ -f /home/llydo1/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
			source /home/llydo1/.config/synth-shell/better-history.sh
		fi
		neofetch
	;;
	*konsole*)
                ##-----------------------------------------------------
                ## synth-shell-greeter.sh
                if [ -f /home/llydo1/.config/synth-shell/synth-shell-greeter.sh ] && [ -n "$( echo $- | grep i )" ]; then
                        source /home/llydo1/.config/synth-shell/synth-shell-greeter.sh
                fi

                ##-----------------------------------------------------
                ## synth-shell-prompt.sh
                if [ -f /home/llydo1/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
                        source /home/llydo1/.config/synth-shell/synth-shell-prompt.sh
                fi

                ##-----------------------------------------------------
                ## better-ls
                if [ -f /home/llydo1/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
                        source /home/llydo1/.config/synth-shell/better-ls.sh
                fi

                ##-----------------------------------------------------
                ## alias
                if [ -f /home/llydo1/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
                        source /home/llydo1/.config/synth-shell/alias.sh
                fi

                ##-----------------------------------------------------
                ## better-history
                if [ -f /home/llydo1/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
                        source /home/llydo1/.config/synth-shell/better-history.sh
                fi
		echo $startLogo
	;;
esac

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Changing "cat" to "bat"
alias cat='bat --paging=never'

# Ruby path
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
