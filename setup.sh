#!/bin/bash
apt_install=(
    "gobuster"
)
git_repos_opt=(
    "https://github.com/jpillora/chisel.git"  # TCP tunnel over HTTP
    "https://github.com/anshumanbh/git-all-secrets.git"  # Git repo scanner (passwords, keys, etc.)
    "https://github.com/SecureAuthCorp/impacket.git"  # Python network scripts
    "https://github.com/rebootuser/LinEnum.git"  # Local Linux enumeration
    "https://github.com/GerbenJavado/LinkFinder.git"  # Finds links in JS files
    "https://github.com/dxa4481/truffleHog.git"  # Git repo scanner (passwords, keys, etc.)
)
git_repos_usr_share=(
    "https://github.com/danielmiessler/SecLists.git"  # Wordlists etc.
)

# Copy configs to required locations
cp .tmux.conf ~/ && tmux source-file ~/.tmux.conf
cp .vimrc ~/

if [ "$1" != "--configs-only" ]; then
    results="\nApt install results:\n"
    for package in ${apt_install[*]}; do
        if (apt install $package); then
            results="${results} \033[0;32m$package - Success\033[0m\n"
        else
            results="${results} \033[0;31m$package - Failure\033[0m\n"
        fi
    done

    results="${results}\nGit clone results:\n"
    cd /opt
    for repo in ${git_repos_opt[*]}; do
        dir="/opt/$(echo $repo | awk -F'/' '{print $5}' | awk -F'.' '{print $1}')"
        if [ -d "$dir" ]; then
                results="${results} \033[0;34m$dir - Directory already exists\033[0m\n"
        else
            if (git clone $repo); then
                results="${results} \033[0;32m$dir - Success\033[0m\n"
            else
                results="${results} \033[0;31m$dir - Failure\033[0m\n"
            fi
        fi
    done

    cd /usr/share
    for repo in ${git_repos_usr_share[*]}; do
        dir="/usr/share/$(echo $repo | awk -F'/' '{print $5}' | awk -F'.' '{print $1}')"
        if [ -d "$dir" ]; then
                results="${results} \033[0;34m$dir - Directory already exists\033[0m\n"
        else
            if (git clone $repo); then
                results="${results} \033[0;32m$dir - Success\033[0m\n"
            else
                results="${results} \033[0;31m$dir - Failure\033[0m\n"
            fi
        fi
    done
fi

echo -e $results