# Turn off GRML's prompt configuration so that antigen can
# handle it later.
prompt off

# Load up antigen.
source $DOTFILES/vendor/antigen/antigen.zsh

# Enable use of oh-my-zsh! themes.
antigen use oh-my-zsh

# Git & git extras helpers.
antigen bundle git

# Cabal completions.
antigen bundle cabal

# Syntax highlighting on the prompt.
antigen bundle zsh-users/zsh-syntax-highlighting

# Set the theme. Glorious two-line prompt!
antigen theme $DOTFILES/conf/tjkirch-angry.zsh-theme

# Tell antigen we're done.
antigen apply
