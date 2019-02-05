#!/bin/sh
# Copy configs to required locations
cp .tmux.conf ~/ && tmux source-file ~/.tmux.conf
cp .vimrc ~/

# Clone repos which aren't included in Kali
if [ "$1" != "--configs-only" ]; then
    cd /usr/share
    if (git clone https://github.com/danielmiessler/SecLists.git); then seclists=true; else seclists=false; fi  # Wordlists etc.

    cd /opt
    if (git clone https://github.com/jpillora/chisel.git); then chisel=true; else chisel=false; fi  # TCP tunnel over HTTP
    if (git clone https://github.com/SecureAuthCorp/impacket.git); then impacket=true; else impacket=false; fi  # Python network scripts
    if (git clone https://github.com/rebootuser/LinEnum.git); then linenum=true; else linenum=false; fi  # Local Linux enumeration

    # Print clone results
    if $seclists; then echo "\033[0;32mSecLists - Success\033[0m"; else echo "\033[0;31mSecLists - Failure\033[0m"; fi
    if $chisel; then echo "\033[0;32mChisel - Success\033[0m"; else echo "\033[0;31mChisel - Failure\033[0m"; fi
    if $impacket; then echo "\033[0;32mImpacket - Success\033[0m"; else echo "\033[0;31mImpacket - Failure\033[0m"; fi
    if $linenum; then echo "\033[0;32mLinEnum - Success\033[0m"; else echo "\033[0;31mLinEnum - Failure\033[0m"; fi
fi

