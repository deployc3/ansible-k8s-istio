sudo hostnamectl set-hostname deployc3
bash
sudo bash -c "cat <<EOF >> /etc/hosts

192.168.0.20 deployc3
192.168.0.181 k8s181
192.168.0.182 k8s182
192.168.0.183 k8s183
EOF
"
exit
ssh-keygen -t rsa -b 2048

ssh-copy-id biro@k8s181
ssh-copy-id biro@k8s182
ssh-copy-id biro@k8s183

sudo su

echo "biro ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/biro
exit
sudo bash -c "cat <<EOF >> /etc/hosts

192.168.0.20 deployc3
192.168.0.181 k8s181
192.168.0.182 k8s182
192.168.0.183 k8s183
EOF
"
sudo chmod u+s /sbin/shutdown
exit
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

sudo nano /etc/ansible/hosts

[all]
k8s181 ansible_user=biro
k8s182 ansible_user=biro
k8s183 ansible_user=biro

ansible all -m ping

git clone https://github.com/r3musketeers/kube-istio-cluster
git clone https://github.com/iaasweek/ansible.git