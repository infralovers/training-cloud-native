## microk8s

sudo snap install microk8s --channel=1.17/stable --classic
sudo usermod -a -G microk8s centos
sudo snap alias microk8s.kubectl kubectl

echo "------------------------"
echo "please log out and log in again"