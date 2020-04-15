#!/bin/bash
apt_install=(
    "dbeaver"
    "ftp"
    "gobuster"
    "vim-gui-common"
    "lftp"
    "ncat"
    "xclip"
)
git_repos=(
    "https://github.com/jpillora/chisel.git"  # TCP tunnel over HTTP
    "https://github.com/docker/docker-bench-security.git"  # Docker configuration auditor
    "https://github.com/EmpireProject/Empire"  # Windows post-exploitation
    "https://github.com/anshumanbh/git-all-secrets.git"  # Git repo scanner (passwords, keys, etc.)
    "https://github.com/rebootuser/LinEnum.git"  # Local Linux enumeration
    "https://github.com/GerbenJavado/LinkFinder.git"  # Finds links in JS files
    "https://github.com/diego-treitos/linux-smart-enumeration.git"  # Linux Smart Enumeration
    "https://github.com/DominicBreuker/pspy.git"  # Process Spy
    "https://github.com/epi052/recursive-gobuster.git"  # Recursive wrapper around gobuster
    "https://github.com/PowerShellMafia/PowerSploit.git"  # Powershell Scripts
    "https://github.com/danielmiessler/SecLists.git"  # Wordlists etc.
    "https://github.com/0x00-0x00/ShellPop.git"  # Shell generator
    "https://github.com/tmux-plugins/tmux-logging.git"  # tmux logging plugin
    "https://github.com/dxa4481/truffleHog.git"  # Git repo scanner (passwords, keys, etc.)
    "https://github.com/rasta-mouse/Watson"  # Missing KB enumeration
)

# Copy configs to required locations
cp .tmux.conf ~/ && tmux source-file ~/.tmux.conf
cp .vimrc ~/
# TODO: don't overwrite config file, but rather check if VMWare fix exists and add if not
# cp config ~/.ssh/config

if [ "$1" != "--configs-only" ]; then
    results="\nApt install results:\n"
    for package in ${apt_install[*]}; do
        if (sudo apt install $package); then
            results="${results} \033[0;32mSuccess\033[0m - $package\n"
        else
            results="${results} \033[0;31mFailure\033[0m - $package\n"
        fi
    done

    results="\n${results} \nGit clone results:\n"
    cd /usr/share
    for repo in ${git_repos[*]}; do
        dir="/usr/share/$(echo $repo | awk -F'/' '{print $5}' | awk -F'.' '{print $1}')"
        if [ -d "$dir" ]; then
            results="${results} \033[0;34mDirectory already exists\033[0m - $dir ($repo)\n"
        else
            if (sudo git clone $repo); then
                results="${results} \033[0;32mSuccess\033[0m - $dir ($repo)\n"
            else
                results="${results} \033[0;31mFailure\033[0m - $dir ($repo)\n"
            fi
        fi
    done
fi

echo -e $results
