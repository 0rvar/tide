function fish_prompt --description 'Write out the prompt'
    set -l lastExitCode $status

    echo

    set_color $lean_prompt_connection_color
    printf "%.s$lean_prompt_connection" (seq (math $COLUMNS-1))
    set_color $fish_color_normal

    lean_load_right_prompt_modules
    set -l leanRightPromptStartLocation (math $COLUMNS-(string length (_lean_right_prompt_nocolor)))
    printf "\r\033["$leanRightPromptStartLocation"C"
    echo -n (lean_right_prompt)
    
    echo -e "\r"(lean_pwd)(lean_git_prompt)" "

    # Prompt character
    if test $lastExitCode -eq 0
        set_color $lean_color_green
    else
        set_color $fish_color_error
    end
    echo -n "❯ "
    set_color $fish_color_normal
end

function _lean_right_prompt_nocolor
    set -l leanRightPromptDecolored " "$leanTimer" "
    echo $leanRightPromptDecolored
end

