###
# Modified by Abhinav Ajgaonkar <abhinav316@gmail.com>
#
# #theme    vibrantink
#
# #author   Ben Demaree
# #purpose  Flexible, fully-featured theme for the working coder
# #colors   Vibrant Ink
# 
# #org      crunchdev
# #contact  ben@crunchdev.com
#
# #credits  Based on the gnzh theme at its core
#               https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/gnzh.zsh-theme
#           Influences from Steve Losh
#               http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
#           Help from compendium of zsh themes
#               https://github.com/robbyrussell/oh-my-zsh/tree/master/themes
###

# Load some modules
autoload -U colors zsh/terminfo
colors
setopt prompt_subst

# Colors from Jo Vermeulen's Vibrant Ink adaptation for vim
# Therefore the colors are attributable to Justin Palmer
#
# http://www.vim.org/scripts/script.php?script_id=1794
eval sunset_orange='$FG[202]'   # keyword, define, statement
eval candy_purple='$FG[098]'    # comment
eval light_yellow='$FG[228]'    # constant
eval golden_yellow='$FG[220]'   # function, include
eval electric_green='$FG[082]'  # string
eval dark_grey='$FG[242]'       # cursorline
eval ruby_red='$FG[124]'        # guess what language this is for?

# Standard 16 terminal color definitions
for color in red green yellow blue magenta cyan white; do
    eval $color='%{$fg[${color}]%}'; done

# Preferences for your convenience
local string_local='local'
local remote_session_prefix='✈ '
local local_session_postfix=''
local first_line_prefix=''
local second_line_prefix='↳'
local return_line_prefix='↵'
local env_prefix='('
local env_suffix=')'
eval vcs_dirty='$ruby_red✘'
local vcs_separator='/'
local git='±'
local mercurial='☿'
local venv='» '
local rvm='♦'


# Dem effects
local reset=$FX[reset]
local bold=$FX[bold]
local italic=$FX[italic]
local uline=$FX[underline]

# Check the UID to determine the user level
if [[ $UID -ge 100 ]]; then
    eval user='$sunset_orange%n$reset'
elif [[ $UID -eq 0 ]]; then
    eval user='$red%n$reset'
else
    eval user='$white%n$reset'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    eval host='$bold$candy_purple$remote_session_prefix%m$reset'     # aye, SSH
else
    eval host='$bold$candy_purple$string_local$reset'      # nay, local
fi

#Variables...assemble!
local pre_prompt_upper='$bold$first_line_prefix$reset'
local pre_prompt_lower='$bold$cyan $second_line_prefix$reset'
local return_code='%(?..%{$red%}%? $return_line_prefix$reset)'
local user_host='$host'
local current_dir='$bold$dark_grey${PWD/#$HOME/~}$reset'
local git_branch='$(git_prompt_info)$reset'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" $vcs_dirty$sunset_orange"
ZSH_THEME_GIT_PROMPT_SUFFIX="$env_suffix$reset"

add-zsh-hook precmd build_prompt
build_prompt () {
    # This is a great place to put variables that may change based on working dir
    # or environment changes
    
    # Oh yeah, we got Python
    [ $VIRTUAL_ENV ] && {
        venv_name=$(basename "$VIRTUAL_ENV")
        local venv_status='$candy_purple$env_prefix$venv$venv_name$env_suffix$reset '
    }

    # Grab the name of the current git repository, if we're in one
    [ $(git status &>/dev/null) $? -eq "0" ] && {
        git_name=$(git rev-parse --show-toplevel)
        git_repo=$(basename ${git_name})$vcs_separator
        local git_status="$sunset_orange$env_prefix$git$git_repo$git_branch"
    }

    # Actual prompt construction
    PROMPT="${venv_status} ${user_host} ${current_dir} ${git_status}
${pre_prompt_lower} "
    RPS1="${return_code}"
}
