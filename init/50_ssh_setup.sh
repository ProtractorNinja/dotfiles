if [[ -a ~/.ssh/id_rsa.pub ]]; then
  e_header "Skipping ssh-keygen; you already have a key!"
else
  e_header "Running ssh-keygen."
  ssh-keygen -q
fi

e_header "Copying to access and palmetto; stand by for login..."
ssh-copy-id ama2@access.cs.clemson.edu
ssh-copy-id ama2@user.palmetto.clemson.edu

cat ~/.ssh/id_rsa.pub | xclip -selection c
e_header "Copied new public key to clipboard!"
