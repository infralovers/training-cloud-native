## microk8s

sudo snap install microk8s --channel=1.18/stable --classic
# add the current user
sudo usermod -a -G microk8s $USER
sudo snap alias microk8s.kubectl kubectl
sudo iptables --policy FORWARD ACCEPT

echo "------------------------"
echo "please log out and log in again"
echo "don't forget to enable needed features"
echo " e.g. microk8s.enable dns storage"