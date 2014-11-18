# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# Install APT packages.
packages=(
  i3
  tmux
  zsh
  build-essential
  fortune
  git-core
  htop
  clang
  exuberant-ctags
  libssl-dev
  mercurial
  nmap
  sl
  telnet
  tree
  texlive-full
  latexmk
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi

# Change my shell to zsh
sudo chsh -s /bin/zsh $USER

# Install Git Extras
#if [[ ! "$(type -P git-extras)" ]]; then
  #e_header "Installing Git Extras"
  #(
    #cd $DOTFILES/vendor/git-extras &&
    #sudo make install
  #)
#fi
