function git-remote-set-url-fetch
    if test (count $argv) -ne 2
	echo "Usage: git-remote-set-url-fetch <remote-name> <fetch-url>"
	return 1
    end

    set -l remote_name $argv[1]
    set -l fetch_url $argv[2]
    set -l push_url (git config remote.$remote_name.url)

    if test -z $push_url
	echo "Error: Remote '$remote_name' does not exist"
	return 1
    end

    git remote set-url $remote_name $fetch_url
    git remote set-url --push $remote_name $push_url

    git remote -v
end
