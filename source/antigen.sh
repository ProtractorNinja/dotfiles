# Turn off GRML's prompt configuration so that antigen can
# handle it later.
prompt off

# Load up antigen.
source $DOTFILES/vendor/antigen/antigen.zsh

# Enable use of oh-my-zsh! themes.
antigen use oh-my-zsh

# Eliminate redundancy with a HEREDOC.
antigen bundles << EOBUNDLES

  # Git & git extras helpers.
  git

  # Cabal completions.
  cabal

  # Syntax highlighting on the prompt.
  zsh-users/zsh-syntax-highlighting

  # Z is the new j, yo. It's a directory jumper.
  rupa/z

EOBUNDLES


# Set the theme. Glorious two-line prompt!
antigen theme $DOTFILES/conf/tjkirch-angry.zsh-theme

# Tell antigen we're done.
antigen apply
