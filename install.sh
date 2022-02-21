#!/bin/bash  
 
value=$(tr '\n' ' ' < apt-dependencies.txt)
echo "$value"  
sudo apt-get -y update
echo "Start Installation"
# echo "sudo apt-get install $value"
sudo apt-get -y install $value

echo "Installing yq"

sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
sudo chmod a+x /usr/local/bin/yq
yq --version

# Creating SSH Folder in Documents Directory

login_user=$(whoami);
doc_path="/home/${login_user}/Documents/SSH-Manager";
mkdir $doc_path;
mkdir "${doc_path}/pem-list"
mkdir "${doc_path}/ssh-list"

echo '${title}:
  username : ${username}
  ipaddr : ${ipaddr}
  ssh_key : ${ssh_key}
' > ${doc_path}/template.yml