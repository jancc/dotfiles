function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # User
    set_color $fish_color_user
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (prompt_hostname)
    set_color normal

    echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (basename (pwd))
    set_color normal

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    fish_git_prompt " @%s"

    echo
    echo -n '$ '
    set_color normal
end

# Git
if not set -q __fish_git_prompt_show_informative_status
    set -g __fish_git_prompt_show_informative_status 1
end
if not set -q __fish_git_prompt_color_branch
    set -g __fish_git_prompt_color_branch brmagenta
end
if not set -q __fish_git_prompt_showupstream
    set -g __fish_git_prompt_showupstream "informative"
end
if not set -q __fish_git_prompt_showdirtystate
    set -g __fish_git_prompt_showdirtystate "yes"
end
if not set -q __fish_git_prompt_color_stagedstate
    set -g __fish_git_prompt_color_stagedstate yellow
end
if not set -q __fish_git_prompt_color_invalidstate
    set -g __fish_git_prompt_color_invalidstate red
end
if not set -q __fish_git_prompt_color_cleanstate
    set -g __fish_git_prompt_color_cleanstate brgreen
end
if not set -q __fish_git_prompt_char_stateseparator
    set -g __fish_git_prompt_char_stateseparator ' '
end

set -g __fish_git_prompt_char_cleanstate ' '
set -g __fish_git_prompt_char_dirtystate '*'
set -g __fish_git_prompt_char_invalidstate 'x'
set -g __fish_git_prompt_char_stagedstate '+'
set -g __fish_git_prompt_char_stashstate '$'
set -g __fish_git_prompt_char_untrackedfiles '%'
set -g __fish_git_prompt_char_upstream_ahead '>'
set -g __fish_git_prompt_char_upstream_behind '<'
set -g __fish_git_prompt_char_upstream_diverged '<>'
set -g __fish_git_prompt_char_upstream_equal '='
