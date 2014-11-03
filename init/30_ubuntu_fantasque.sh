#!/bin/bash
# Automatically grabs and installs the latest version of fantasque sans mono.

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

e_header "Installing Fantasque Sans."
START=http://openfontlibrary.org/assets/downloads/fantasque-sans-mono/

# Figure out the location of the latest version.
wget -q -O tmp.html $START?C=M;O=A
RELEASE_URL=`cat tmp.html | grep -o -E "[a-f0-9]{32}" | tail -1`
rm tmp.html

# Download that font.
wget -q $START/$RELEASE_URL/fantasque-sans-mono.zip

# Slam that font into life.
mkdir -p $DOTFILES/link/.fonts/fantasque-sans
unzip -q fantasque-sans-mono.zip *.ttf -d $DOTFILES/link/.fonts/fantasque-sans
rm fantasque-sans-mono.zip

# Update the font cache.
sudo fc-cache -f
