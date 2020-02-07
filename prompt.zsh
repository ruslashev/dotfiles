function load_colors() {
	if is437; then
		BLUE="%F{blue}"
		RED="%F{red}"
		GREEN="%F{green}"
		CYAN="%F{cyan}"
		MAGENTA="%F{magenta}"
		YELLOW="%F{yellow}"
		WHITE="%F{white}"
		NO_COLOR="%f"
	elif zrcautoload colors && colors 2>/dev/null ; then
		BLUE="%{${fg[blue]}%}"
		RED="%{${fg_bold[red]}%}"
		GREEN="%{${fg[green]}%}"
		CYAN="%{${fg[cyan]}%}"
		MAGENTA="%{${fg[magenta]}%}"
		YELLOW="%{${fg[yellow]}%}"
		WHITE="%{${fg[white]}%}"
		NO_COLOR="%{${reset_color}%}"
	else
		BLUE=$'%{\e[1;34m%}'
		RED=$'%{\e[1;31m%}'
		GREEN=$'%{\e[1;32m%}'
		CYAN=$'%{\e[1;36m%}'
		WHITE=$'%{\e[1;37m%}'
		MAGENTA=$'%{\e[1;35m%}'
		YELLOW=$'%{\e[1;33m%}'
		NO_COLOR=$'%{\e[0m%}'
	fi
}

function unload_colors() {
	builtin unset -v BLUE RED GREEN CYAN YELLOW MAGENTA WHITE NO_COLOR
}

load_colors

prompt off

local user_color="$GREEN"
[ $UID -eq 0 ] && user_color="$RED"
local username="$user_color%n$NO_COLOR"
local dir="$BLUE%1~$NO_COLOR"
local symbol="$user_color%(!.#.$)$NO_COLOR"

export PROMPT="$username $dir $symbol "

function git_get_branch() {
	git symbolic-ref HEAD 2> /dev/null | sed 's|refs/heads/||'
}

function git_prompt_status() {
	local ZSH_THEME_GIT_PROMPT_ADDED="$GREEN+"
	local ZSH_THEME_GIT_PROMPT_MODIFIED="$BLUE*"
	local ZSH_THEME_GIT_PROMPT_DELETED="$RED-"
	local ZSH_THEME_GIT_PROMPT_STASHED="$YELLOW#"
	local ZSH_THEME_GIT_PROMPT_RENAMED="${MAGENTA}R"
	local ZSH_THEME_GIT_PROMPT_UNTRACKED="$CYAN?"
	local INDEX=$(command git status --porcelain -b 2> /dev/null)
	local STATUS=""

	if $(echo "$INDEX" | grep -E '^\?\? ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^A ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
	elif $(echo "$INDEX" | grep '^M ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
	elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
	elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^R ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
	elif $(echo "$INDEX" | grep '^D ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
	elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
	fi
	if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
		STATUS="$ZSH_THEME_GIT_PROMPT_STASHED$STATUS"
	fi

	echo "$STATUS"
}

function precmd {
	load_colors

	local return_code="$RED%(?..%? ↵)$NO_COLOR "

	local fromvim=""
	[[ $FROMVIM -eq 1 ]] && fromvim="${GREEN}Vim$NO_COLOR "

	local gitness=""
	[[ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = "true" ]] &&
		gitness="$(git_get_branch)$(git_prompt_status)$NO_COLOR"

	export RPROMPT="$return_code$fromvim$gitness"

	unload_colors
}

unload_colors

