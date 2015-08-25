#!/bin/bash


if [ $(uname -r) != '3.17.0-031700-generic' ]

#HOTFIX
then
    echo "INSTALL KERNEL FOR DOCKER"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.17-utopic/linux-headers-3.17.0-031700-generic_3.17.0-031700.201410060605_amd64.deb
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.17-utopic/linux-headers-3.17.0-031700_3.17.0-031700.201410060605_all.deb
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.17-utopic/linux-image-3.17.0-031700-generic_3.17.0-031700.201410060605_amd64.deb
    sudo dpkg -i linux-headers-3.17.0-*.deb linux-image-3.17.0-*.deb

    echo "NOW VM will reboot. PLEASE RESTART VAGRANT WITH PROVISION.  HOPE, fix it faster"
    sudo reboot
    exit 0
fi


sudo apt-get -q -y --force-yes install python-software-properties software-properties-common git build-essential curl

#install docker and docker-compose
curl -sSL https://get.docker.com/ubuntu/ | sudo sh; sudo service docker stop;sudo cp -f /home/vagrant/app/runner/vagrant/files/docker_daemon_conf /etc/default/docker; sudo chmod 777 /etc/default/docker;sudo service docker start;

command -v docker-compose >/dev/null 2>&1 || { curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose; chmod +x /usr/local/bin/docker-compose; }


echo "VAGRANT PROVISION - DONE!!!"
echo "Goodluck"
