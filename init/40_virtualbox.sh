e_header "Fixing synced folder permissions and linking to ~/sync..."
sudo usermod -aG vboxsf $USER
sudo ln -s /media/sf_sync ~/sync
