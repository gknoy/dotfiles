#! /bin/bash
#
# iterm2-badge.sh
#
# Send escape sequences so that iterm2 can set the badge to arbitrary text
#
# https://www.iterm2.com/documentation-badges.html
#

# function iterm2_print_user_vars() {
#   iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep --color=never \* | cut -c3-)
# }

# e.g. i2-badge "fix the thing"
function i2-badge {
    # Set badge to show arbitrary text
    printf "\e]1337;SetBadgeFormat=%s\a" \
           $(echo -n "$1" | base64)
}

alias ib='i2-badge'

#
# Tab colors
#

#
# iterm2 colors
#
function tab-color {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

function tab-reset {
    echo -ne "\033]6;1;bg;*;default\a"
}

function auto-tab-color {
    hex=$(pwd | md5sum)
    r=$(printf "%d" 0x${hex:0:2})
    g=$(printf "%d" 0x${hex:2:2})
    b=$(printf "%d" 0x${hex:4:2})

    current=$(pwd)
    # echo "$current"
    # echo tab-color $r $g $b

    # TODO: define custom path -> rgb mappings elsewhere
    case "$current" in
       '/Users/gknoy/git/wet_arms')
           # tab-color 40 110 240 # blue
           tab-color 99 39 249 # bluish
           ;;
       '/Users/gknoy/git/website')
           tab-color 210 110 70 # orange
           ;;
       '/Users/gknoy/git/lims_validation_tests')
           tab-color 150 40 150 # purple
           ;;
       '/Users/gknoy/git')
           tab-color 200 200 40 # yellow
           ;;
       '/Users/gknoy/git/lims_prod_requests')
           tab-color 150 40 40 # dark red
           ;;
       *)
           # tab-reset
           tab-color $r $g $b
           ;;
    esac
}
