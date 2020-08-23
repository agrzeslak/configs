#!/bin/bash
apt_install=(
    "dbeaver"
    "ftp"
    "gobuster"
    "vim-gui-common"
    "lftp"
    "ncat"
    "snapd"
    "powercat"
    "python3"
    "python3-pip"
    "python3-venv"
    "seclists"
    "xclip"
)
git_repos=(
    "https://github.com/jpillora/chisel.git"                        # TCP tunnel over HTTP
    "https://github.com/docker/docker-bench-security.git"           # Docker configuration auditor
    "https://github.com/EmpireProject/Empire"                       # Windows post-exploitation
    "https://github.com/anshumanbh/git-all-secrets.git"             # Git repo scanner (passwords, keys, etc.)
    "https://github.com/rebootuser/LinEnum.git"                     # Local Linux enumeration
    "https://github.com/GerbenJavado/LinkFinder.git"                # Finds links in JS files
    "https://github.com/diego-treitos/linux-smart-enumeration.git"  # Linux Smart Enumeration
    "https://github.com/DominicBreuker/pspy.git"                    # Process Spy
    "https://github.com/swisskyrepo/PayloadsAllTheThings.git"       # Payloads
    "https://github.com/PowerShellMafia/PowerSploit.git"            # Powershell Scripts
    "https://github.com/0x00-0x00/ShellPop.git"                     # Shell generator
    "https://github.com/tmux-plugins/tmux-logging.git"              # tmux logging plugin
    "https://github.com/dxa4481/truffleHog.git"                     # Git repo scanner (passwords, keys, etc.)
    "https://github.com/rasta-mouse/Watson"                         # Missing KB enumeration
)

# Copy configs to required locations
cp .tmux.conf ~/ && tmux source-file ~/.tmux.conf
cp .vimrc ~/
cp restart-vm-tools.sh ~/Desktop/restart-vm-tools.sh
cp mount-shared-folders.sh ~/Desktop/mount-shared-folders.sh
# TODO: don't overwrite config file, but rather check if VMWare fix exists and add if not
# cp config ~/.ssh/config

if [ "$1" != "--configs-only" ]; then
    # Apt install
    results="\nApt install results:\n"
    for package in ${apt_install[*]}; do
        if (sudo apt install -y $package); then
            results="${results} \033[0;32mSuccess\033[0m - $package\n"
        else
            results="${results} \033[0;31mFailure\033[0m - $package\n"
        fi
    done

    # GitHub clone
    results="\n${results} \nGit clone results:\n"
    cd /opt
    for repo in ${git_repos[*]}; do
        dir="/opt/$(echo $repo | awk -F'/' '{print $5}' | awk -F'.' '{print $1}')"
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

    # evil-winrm
    gem install evil-winrm

    # AutoRecon + pipx
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath

    # Add htb alias in .bashrc if doesn't exist already
    if ! grep -q 'alias htb=' ~/.bashrc
    then
        echo '# HTB' >> ~/.bashrc;
        echo 'alias htb="cd ~/htb; tmux new -d \"sudo openvpn agrzeslak.ovpn; read\" \; attach"' >> ~/.bashrc;
    fi

    # p3x-onenote
    sudo systemctl enable --now apparmor.service
    sudo systemctl enable --now snapd.socket
    sleep 20  # wait for socket to become available
    sudo snap install p3x-onenote
    sudo systemctl enable apparmor

fi

echo -e $results
echo 'Restart terminal and run "pipx install git+https://github.com/Tib3rius/AutoRecon.git" to complete AutoRecon installation'
