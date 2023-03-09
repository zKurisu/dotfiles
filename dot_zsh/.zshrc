# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.zsh
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#####
########## My Script ##########
#####
source /home/jie/scripts/data_files/vpn_select

#####
########## Alias ##########
#####
# alias ls='ls --color=auto'
alias ls='exa'
alias l='ls -al'
alias rg=ranger
alias c=clear
alias gdb='gdb -q'
alias s=neofetch
alias lg='lazygit'
# alias vpn='expressvpn'
alias vi='nvim'
alias qq='/opt/apps/com.qq.im.deepin/files/run.sh'
alias python3='python3 -q'
alias wt='curl wttr.in/~chengdu'
alias wechat='/opt/apps/com.qq.weixin.deepin/files/run.sh'
alias asmman='cgasm'
alias shot='flameshot gui -p /home/jie/Blog/source/img/'
alias lzd='lazydocker'
alias lzn='lazynpm'
alias dcip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias top='glances'
alias nc='netcat'
alias tmpdc='docker run -it --name normal_ubuntu_cn -h ubuntu -p 10001 ubuntu:cnsoft /bin/bash'
alias wireshark='sudo /usr/bin/wireshark-gtk'
alias blue='bluetoothctl'
alias bright='brightnessctl set'
alias bc='bc -q'
alias nw='next_wallpaper.pl'
alias pg='ps aux|grep '
alias mykey='xbindkeys -n'
# alias mail='mw -Y; neomutt'
alias rmail='mw -Y'
alias m='neomutt'
alias MC='minecraft-launcher'
alias f='nvim $(fzf)'
alias bk='ranger ~/Disk/books/'
alias tk='task'
alias ntk='task -Ani -Movie'
alias how='tldr'
alias cat='bat'
# alias wc='cloc'
alias diff='icdiff'
# alias du='dust'
alias df='duf'
alias z='zoxide'
alias ch='cheat'
alias h='cd ~/Blog; hexo g ; pat ; hexo d; hexo s'
# alias dot='chezmoi'
alias tzh='trans :zh --shell'
alias t='trans --shell'
alias hi='hello'
alias connect='iwctl station wlan0 connect UESTC-WiFi'
alias visudo='EDITOR=nvim visudo'
alias mysql='mycli'
alias chess='gnome-chess'
alias lv='nvim -u /home/jie/.config/lvim/init.lua'
# alias lv='nvim -u /home/jie/Disk/Gitrepo/Neovim-from-scratch/init.lua'
alias vm='virt-manager'
alias baidu='/usr/lib/baidunetdisk/baidunetdisk'
alias clash='/home/jie/Disk/Gitrepo/Clash\ for\ Windows-0.20.9-x64-linux/cfw'
alias haisi='/home/jie/.wine/drive_c/Program\ Files/Huawei/DevEco\ Studio\ 2.1.0.501/bin/devecostudio64.exe'
alias music='ncmpcpp'
alias mssh='ssh $(cat /home/jie/scripts/data_files/ssh_server |fzf)'
alias cnw='iwctl station wlan0 connect $(iwctl station wlan0 get-networks |perl -ne "s/\x{001B}.*//g; print if $. > 4" |fzf)'
alias emed='/home/jie/.wine/drive_c/users/jie/AppData/Local/Programs/EmEditor/EmEditor.exe'
alias vp='nvim /home/jie/scripts/perl/test/' 
alias ask='/home/jie/scripts/perl/chatgpt.pl'
alias psh='perl /home/jie/scripts/perl/test/repl.pl'
alias check='perl /home/jie/scripts/perl/checklist.pl'
alias vch='vi /home/jie/scripts/perl/checklist.pl'
alias ryzom='/home/jie/Disk/Game/Ryzom/ryztart/ryztart'
alias mini='cpanm --mirror ~/Disk/MiniCPAN --mirror-only'
alias d2p='libreoffice --headless --convert-to pdf '
alias src='source ~/.zshrc'
alias new='/home/jie/scripts/perl/new.pl'
alias armsim='mono /home/jie/Disk/Gitrepo/armsim/armsim/ARMSim.exe'
alias dm='perl /home/jie/scripts/perl/My/Dotfile.pm'   


#####
########## Intresting Command ##########
#####
# figlet, ASCII pic
# cowsay, charac with cow
# cmatrix, screen saver
# fanyi


#####
########## Variable ##########
#####
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Anaconda
zstyle :compinstall filename '/home/jie/.zshrc'


#####
########## functions ##########
#####


#####
########## bindkey ##########
#####
bindkey -v


#####
########## Autoload ##########
#####
autoload -Uz compinit
compinit
autoload -U colors && colors
autoload -U promptinit
promptinit


#####
########## Setopt ##########
#####
setopt prompt_subst
setopt INTERACTIVE_COMMENTS



#####
########## Plugins ##########
#####
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#####
########## zmodule ##########
#####
# zmodule duration-info


##### 
########## Prompt ##########
#####
# setopt nopromptbang prompt{cr,percent,sp,subst}
#
# zstyle ':zim:duration-info' threshold 0.5
# zstyle ':zim:duration-info' format '%.4d s'
#
# autoload -Uz add-zsh-hook
# add-zsh-hook preexec duration-info-preexec
# add-zsh-hook precmd duration-info-precmd
#
# RPS1='${duration_info}%'
PROMPT='❰%{$fg[green]%}%n%{$reset_color%} %{$fg[yellow]%}%1~%{$reset_color%}%{$fg[blue]%}$(git branch --show-current 2&> /dev/null | xargs -I branch echo "(branch)")%{$reset_color%}❱ '


#####
########## fzf ##########
#####
export FZF_DEFAULT_COMMAND='fd'
export FZF_COMPLETION_TRIGGER='\'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'


#####
########## VPN ##########
#####
# Original in /etc/profile

# Set our umask
umask 022

# Append "$1" to $PATH when not already in.
# This function API is accessible to scripts in /etc/profile.d
append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

# Append our default paths
append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'

# Force PATH to be environment
export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Unload our profile API functions
unset -f append_path

# Source global bash config, when interactive but not posix or sh mode
if test "$BASH" &&\
   test "$PS1" &&\
   test -z "$POSIXLY_CORRECT" &&\
   test "${0#-}" != sh &&\
   test -r /etc/bash.bashrc
then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

# Clash
# export http_proxy="http://127.0.0.1:7890"
# export https_proxy="http://127.0.0.1:7890"

# ZeroTier
# TencentCloud
# export http_proxy="http://10.147.20.208:3128"
# export https_proxy="http://10.147.20.208:3128"

# HuaweiCloud
# export http_proxy="http://10.147.20.62:3128"
# export https_proxy="http://10.147.20.62:3128"


#####
########## Add colors to manpage ##########
#####
export LESS_TERMCAP_mb=$'\E[1m\E[32m'
export LESS_TERMCAP_mh=$'\E[2m'
export LESS_TERMCAP_mr=$'\E[7m'
export LESS_TERMCAP_md=$'\E[1m\E[36m'
export LESS_TERMCAP_ZW=""
export LESS_TERMCAP_us=$'\E[4m\E[1m\E[37m'
export LESS_TERMCAP_me=$'\E(B\E[m'
export LESS_TERMCAP_ue=$'\E[24m\E(B\E[m'
export LESS_TERMCAP_ZO=""
export LESS_TERMCAP_ZN=""
export LESS_TERMCAP_se=$'\E[27m\E(B\E[m'
export LESS_TERMCAP_ZV=""
export LESS_TERMCAP_so=$'\E[1m\E[33m\E[44m'



eval $(thefuck --alias)


#####
########## powerlevel10k ##########
#####
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@" >/dev/null
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@[-1]}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query -i -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin unalias z &>/dev/null || \builtin true
function z() {
    __zoxide_z "$@"
}

\builtin unalias zi &>/dev/null || \builtin true
function zi() {
    __zoxide_zi "$@"
}

if [[ -o zle ]]; then
    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return

        if [[ "${#words[@]}" -eq 2 ]]; then
            _files -/
        elif [[ "${words[-1]}" == '' ]]; then
            \builtin local result
            # shellcheck disable=SC2086,SC2312
            if result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -i -- ${words[2,-1]})"; then
                __zoxide_result="${result}"
            else
                __zoxide_result=''
            fi
            \builtin printf '\e[5n'
        fi
    }

    function __zoxide_z_complete_helper() {
        \builtin local result="${__zoxide_z_prefix}${__zoxide_result}"
        # shellcheck disable=SC2296
        [[ -n "${__zoxide_result}" ]] && LBUFFER="${LBUFFER}${(q-)result}"
        \builtin zle reset-prompt
    }

    \builtin zle -N __zoxide_z_complete_helper
    \builtin bindkey "\e[0n" __zoxide_z_complete_helper
    if [[ "${+functions[compdef]}" -ne 0 ]]; then
        \compdef -d z
        \compdef -d zi
        \compdef __zoxide_z_complete z
    fi
fi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
# eval "$(zoxide init zsh)"

source /home/jie/.config/broot/launcher/bash/br

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
#         . "/opt/anaconda/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/anaconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

