#!/usr/bin/env bash
# shellcheck disable=2034,2154

# Theme custom glyphs
SCM_GIT_CHAR_GITLAB=${SPAZZY757_GITLAB_CHAR:='  '}
SCM_GIT_CHAR_BITBUCKET=${SPAZZY757_BITBUCKET_CHAR:='  '}
SCM_GIT_CHAR_GITHUB=${SPAZZY757_GITHUB_CHAR:='  '}
SCM_GIT_CHAR_DEFAULT=${SPAZZY757_GIT_DEFAULT_CHAR:='  '}
SCM_GIT_CHAR_ICON_BRANCH=${SPAZZY757_GIT_BRANCH_ICON:=''}
SCM_HG_CHAR=${SPAZZY757_HG_CHAR:='☿ '}
SCM_SVN_CHAR=${SPAZZY757_SVN_CHAR:='⑆ '}
EXIT_CODE_ICON=${SPAZZY757_EXIT_CODE_ICON:=' '}

# Ssh user and hostname display
SSH_INFO=${SPAZZY757_SSH_INFO:=true}
HOST_INFO=${SPAZZY757_HOST_INFO:=long}

# Bash-it default glyphs customization
SCM_NONE_CHAR=
SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX="|"
SCM_THEME_PROMPT_SUFFIX="${green}| "
SCM_GIT_BEHIND_CHAR="${bold_red}↓${normal}"
SCM_GIT_AHEAD_CHAR="${bold_green}↑${normal}"
SCM_GIT_UNTRACKED_CHAR="⌀"
SCM_GIT_UNSTAGED_CHAR="${bold_yellow}•${normal}"
SCM_GIT_STAGED_CHAR="${bold_green}+${normal}"
GIT_THEME_PROMPT_DIRTY=" ${bold_red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX="${cyan}"${yellow}
GIT_THEME_PROMPT_SUFFIX="${cyan}"
SCM_THEME_BRANCH_TRACK_PREFIX="${normal} ⤏  ${cyan}"
SCM_THEME_CURRENT_USER_PREFFIX='  '
SCM_GIT_SHOW_CURRENT_USER=false

# Kubernetes
KUBE_BINARY=${KUBE_BINARY_LOCATION:='/usr/local/bin/kubectl'}
KUBE_SYMBOL="" 

function _git_upstream_remote_logo {
    [[ "$(_git-upstream)" == "" ]] && SCM_GIT_CHAR="$SCM_GIT_CHAR_DEFAULT"

    local remote remote_domain
    remote=$(_git-upstream-remote)
    remote_domain=$(git config --get remote."$remote".url | awk -F'[@:.]' '{print $2}')

    # remove // suffix for https:// url
    remote_domain=${remote_domain//\//}

    case $remote_domain in
        github ) SCM_GIT_CHAR="$SCM_GIT_CHAR_GITHUB";;
        gitlab ) SCM_GIT_CHAR="$SCM_GIT_CHAR_GITLAB";;
        bitbucket ) SCM_GIT_CHAR="$SCM_GIT_CHAR_BITBUCKET";;
        * ) SCM_GIT_CHAR="$SCM_GIT_CHAR_DEFAULT";;
    esac
}

function git_prompt_info {
    git_prompt_vars
    echo -e " on $SCM_GIT_CHAR_ICON_BRANCH $SCM_PREFIX$SCM_BRANCH$SCM_STATE$SCM_GIT_AHEAD$SCM_GIT_BEHIND$SCM_GIT_STASH$SCM_SUFFIX"
}

function _exit-code {
    if [[ "$1" -ne 0 ]]; then
        exit_code=" ${purple}${EXIT_CODE_ICON}${yellow}${exit_code}${bold_orange}"
    else
        exit_code="${bold_green}"
    fi
}

# Function to check if binary is installed
function _binary_check {
        command -v $1 >/dev/null
}

function _kube_info {
    # Check kubectl is working
    if _binary_check "${KUBE_BINARY}"; then
        # Get the Current Kubernetes Context
        # supress error if no current context
        kube_context=$(kubectl config current-context 2> /dev/null)
        if [ "${kube_context}" ]; then
            kube_info="${KUBE_SYMBOL}${red}${kube_context}"
        fi
        # Get the current namespace if set
        # supress error if no current namespace
        kube_namespace="$(kubectl config view --minify --output 'jsonpath={..namespace}' 2> /dev/null)"
        if [ "${kube_namespace}" ]; then
            kube_info="${kube_info}:${yellow}${kube_namespace}${purple}"
        fi
    fi
}

# get Current Disk Space
function get_disk_use_percent {
    # Might Only Work on MAC need to check
    disk=$(df -k | grep /dev/ | awk '{sub("%","", $5); sum +=$5;} END{print sum}')

    if [ "$disk" -le 76 ]; then
        disk_color=$green
    elif [ "$disk" -ge 75 ]; then
        disk_color=$bold_yellow
    elif [ "$disk" -ge 85 ]; then
        disk_color=$bold_red
    fi
    disk_usage="${disk_color}D:${disk}%"
}

# Get current memory in percent
function _get_mem_use_percent {
    mem=$(ps -A -o %mem | awk '{ mem += $1} END {print  mem}')
    if [ "$disk" -le 76 ]; then
        mem_color=$green
    elif [ "$disk" -ge 75 ]; then
        mem_color=$bold_yellow
    elif [ "$disk" -ge 85 ]; then
        mem_color=$bold_red
    fi
    mem_usage="${mem_color}M:${mem}%"
}

# Get current cpu in percent
function get_cpu_use_percent {
    cpu=$(ps -A -o %cpu | awk '{ cpu += $1} END {print  cpu}')
    if [ "$disk" -le 76 ]; then
        cpu_color=$green
    elif [ "$disk" -ge 75 ]; then
        cpu_color=$bold_yellow
    elif [ "$disk" -ge 85 ]; then
        cpu_color=$bold_red
    fi
    cpu_usage="${cpu_color}C:${cpu}%"
}

# For really long directories, shorten them
function __check_path_length {
    length=${PWD//[!\/]}
    if [ ${#length} -ge 7 ]; then
        work_dir="\\W"
    fi
    if [ ${#length} -le 6 ]; then
        work_dir="\\w"
    fi
}

function _prompt {
    local exit_code="$?" wrap_char=' ' dir_color=$green ssh_info='' host

    _exit-code exit_code
    _kube_info kube_info
    _git_upstream_remote_logo
    __check_path_length work_dir

    history -a

    # Detect root shell
    if [ "$(whoami)" = root ]; then
        dir_color=$red
    fi

    # Detect ssh
    if [[ -n "${SSH_CONNECTION}" ]] && [ "$SSH_INFO" = true ]; then
        if [ "$HOST_INFO" = long ]; then
            host="\H"
        else
            host="\h"
        fi
        ssh_info="${bold_blue}\u${bold_orange}@${cyan}$host ${bold_orange}in"
    fi

    PS1="\n${ssh_info} ${kube_info} ${purple}$(scm_char)${dir_color}${work_dir}${normal}$(scm_prompt_info)${exit_code}"

    [[ ${#PS1} -gt $((COLUMNS*3)) ]] && wrap_char="\n"
    PS1="${PS1}${wrap_char}❯${normal} "
}

safe_append_prompt_command _prompt
