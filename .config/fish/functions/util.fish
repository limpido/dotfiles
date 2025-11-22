function fish-reload -d "reload fish config"
    source ~/.config/fish/config.fish
end

function mkcd -d "mkdir && cd" -a dir
    if [ (count $argv) -ne 1 ];
        echo "Usage: mkcd <dir>"
        return
    else
        mkdir $dir && cd $dir
    end
end

function hgrep
    history | grep $argv
end

function vi
    nvim $argv
end

function chrome
    google-chrome --gtk-version=4
end

function l
    eza --long --group --octal-permissions --total-size $argv
end

function la
    l -a $argv
end

function lt -d "list files sorted by modification date (oldest first)"
    l -s modified
end

function tree -d "display a tree of files, three levels deep"
    eza --tree -L 3 $argv
end

function rclone-pull
    argparse d/dry-run -- $argv

    if set -q _flag_dry_run
	rclone sync remote:cs-books . --dry-run
    else
	rclone sync remote:cs-books .
    end
end

function rclone-push
    argparse d/dry-run -- $argv

    if set -q _flag_dry_run
	rclone sync . remote:cs-books --dry-run
    else
	rclone sync . remote:cs-books
    end
end

function line -d "print nth line"
    head -n $argv | tail -n 1
end

function prettypath -d "pretty print $PATH"
    echo "$PATH" | sed 's/:/\
/g'
end
