#!/bin/bash
apt_install=(
    "dbeaver"
    "ftp"
    "gobuster"
    "lftp"
    "ncat"
)
git_repos_opt=(
    "https://github.com/jpillora/chisel.git"  # TCP tunnel over HTTP
    "https://github.com/anshumanbh/git-all-secrets.git"  # Git repo scanner (passwords, keys, etc.)
    "https://github.com/rebootuser/LinEnum.git"  # Local Linux enumeration
    "https://github.com/GerbenJavado/LinkFinder.git"  # Finds links in JS files
    "https://github.com/epi052/recursive-gobuster.git"  # Recursive wrapper around gobuster
    "https://github.com/dxa4481/truffleHog.git"  # Git repo scanner (passwords, keys, etc.)
)
git_repos_usr_share=(
    "https://github.com/danielmiessler/SecLists.git"  # Wordlists etc.
    "https://github.com/PowerShellMafia/PowerSploit.git"  # Powershell Scripts
)

# Copy configs to required locations
cp .tmux.conf ~/ && tmux source-file ~/.tmux.conf
cp .vimrc ~/
cp config ~/.ssh/config

if [ "$1" != "--configs-only" ]; then
    results="\nApt install results:\n"
    for package in ${apt_install[*]}; do
        if (apt install $package); then
            results="${results} \033[0;32mSuccess\033[0m - $package\n"
        else
            results="${results} \033[0;31mFailure\033[0m - $package\n"
        fi
    done

    results="${results}\nGit clone results:\n"
    cd /opt
    for repo in ${git_repos_opt[*]}; do
        dir="/opt/$(echo $repo | awk -F'/' '{print $5}' | awk -F'.' '{print $1}')"
        if [ -d "$dir" ]; then
            results="${results} \033[0;34mDirectory already exists\033[0m - $dir ($repo)\n"
        else
            if (git clone $repo); then
                results="${results} \033[0;32mSuccess\033[0m - $dir ($repo)\n"
            else
                results="${results} \033[0;31mFailure\033[0m - $dir ($repo)\n"
            fi
        fi
    done

    cd /usr/share
    for repo in ${git_repos_usr_share[*]}; do
        dir="/usr/share/$(echo $repo | awk -F'/' '{print $5}' | awk -F'.' '{print $1}')"
        if [ -d "$dir" ]; then
            results="${results} \033[0;34mDirectory already exists\033[0m - $dir ($repo)\n"
        else
            if (git clone $repo); then
                results="${results} \033[0;32mSuccess\033[0m - $dir ($repo)\n"
            else
                results="${results} \033[0;31mFailure\033[0m - $dir ($repo)\n"
            fi
        fi
    done
fi

echo -e $results
