function  __fish_fossil_prompt --description "Prompt function for Fossil"
    set -l separator "|"
    set -l info ""
    set -l merge_info ""
    set -l branch (command fossil branch ls 2>/dev/null | awk '/\* /{print $2}')

    if test -n "$branch"
        set -l stash (command fossil stash list 2>/dev/null)
        set -l changes (command fossil changes 2>/dev/null | awk '{print $1}')
        set -l info_command (command fossil info 2>/dev/null | awk '/child: /{print $2}')
        set -l extra (count (command fossil extra 2>/dev/null))
        
        if test "$stash" != 'empty stash'
            set separator "\$"
        end

        if test -n "$changes"
            if contains 'MERGED_WITH' $changes
                set merge_info $separator"MERGING!"
                set extra 0
            end
            set col magenta
        else
            set col green
        end

        if test $extra -ne 0
            set info "$separator+$extra"
        end

        # if contains "child" $info_command
        #     set branch "not on latest commit on $branch"
        # end

        if test "$info_command" != ''
            set info_command (string sub -s 1 -l 5 $info_command)
            set branch "$info_command | $branch"
        end
        
        set_color normal; echo -n " on "; set_color $col; echo -n "$branch$info"; set_color red; echo -n "$merge_info"; set_color normal;
    end
end