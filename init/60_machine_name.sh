# Who am I?
e_header "Choose you a machine name!"
read machine_name
sudo sh -c "echo $machine_name > /etc/hostname"
