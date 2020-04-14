## snap
sudo yum install epel-release -y
sudo yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
wait 20
sudo systemctl start snapd
sudo systemctl status snapd.socket

echo "------------------------"
echo "please log out and log in again"