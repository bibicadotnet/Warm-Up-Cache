#!/bin/bash
locale-gen en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

sudo apt update && sudo apt upgrade -y
sudo apt install zip -y
sudo apt install unzip -y
sudo apt install htop -y
sudo apt install screen -y

sudo apt remove iptables-persistent -y && sudo ufw disable && sudo iptables -F

timedatectl set-timezone Asia/Ho_Chi_Minh

sudo fallocate -l 10G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile && echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $(whoami)
sudo systemctl start docker
sudo systemctl enable docker
apt install docker-compose -y

sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/Warm-Up-Cache/main/warmup1.sh -O /usr/local/bin/warmup1.sh
sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/Warm-Up-Cache/main/warmup2.sh -O /usr/local/bin/warmup2.sh
sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/Warm-Up-Cache/main/warmup3.sh -O /usr/local/bin/warmup3.sh

chmod +x /usr/local/bin/warmup1.sh
chmod +x /usr/local/bin/warmup2.sh
chmod +x /usr/local/bin/warmup3.sh

nohup /usr/local/bin/warmup1.sh >> ./out 2>&1 <&- &
nohup /usr/local/bin/warmup2.sh >> ./out 2>&1 <&- &
nohup /usr/local/bin/warmup3.sh >> ./out 2>&1 <&- &

crontab -l > warmup
echo "@reboot nohup /usr/local/bin/warmup1.sh >> ./out 2>&1 <&- &" >> warmup
echo "@reboot nohup /usr/local/bin/warmup2.sh >> ./out 2>&1 <&- &" >> warmup
echo "@reboot nohup /usr/local/bin/warmup3.sh >> ./out 2>&1 <&- &" >> warmup
crontab warmup
