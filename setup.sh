#!/bin/sh
# Copy configs to required locations
cp .tmux.conf ~/ && tmux source-file ~/.tmux.conf
cp .vimrc ~/

if [ "$1" != "--configs-only" ]; then
    # Clone repos which aren't included in Kali
    cd /usr/share
    if (git clone https://github.com/danielmiessler/SecLists.git); then seclists=true; else seclists=false; fi  # Wordlists etc.

    cd /opt
    if (git clone https://github.com/jpillora/chisel.git); then chisel=true; else chisel=false; fi  # TCP tunnel over HTTP
    if (git clone https://github.com/SecureAuthCorp/impacket.git); then impacket=true; else impacket=false; fi  # Python network scripts
    if (git clone https://github.com/rebootuser/LinEnum.git); then linenum=true; else linenum=false; fi  # Local Linux enumeration

    # Apt install non-standard packages
    if (apt install gobuster); then gobuster=true; else gobuster=false; fi

    # Print git clone results
    echo "\nGit clone results:"
    if $seclists; then echo "\033[0;32mSecLists - Success\033[0m"; else echo "\033[0;31mSecLists - Failure\033[0m"; fi
    if $chisel; then echo "\033[0;32mChisel - Success\033[0m"; else echo "\033[0;31mChisel - Failure\033[0m"; fi
    if $impacket; then echo "\033[0;32mImpacket - Success\033[0m"; else echo "\033[0;31mImpacket - Failure\033[0m"; fi
    if $linenum; then echo "\033[0;32mLinEnum - Success\033[0m"; else echo "\033[0;31mLinEnum - Failure\033[0m"; fi

    # Print apt install results
    echo "\nApt install results:"
    if $gobuster; then echo "\033[0;32mGobuster - Success\033[0m"; else echo "\033[0;31mGobuster - Failure\033[0m"; fi
fi

