export MYUID=$(shell id -u)
export SUPPORTED_FEDORA_RELEASE=23
export FEDORA_RELEASE=$(shell rpm -E %fedora)

isFedora:
	@if [ -a /etc/fedora-release ]; then echo "We have fedora linux!"; else  echo "Wrong distribution!";exit 1;fi;
ifeq ($(FEDORA_RELEASE),$(SUPPORTED_FEDORA_RELEASE))
	@echo "Running on supported Fedora $(FEDORA_RELEASE)..."
else
	@echo "Running on unsupported Fedora $(FEDORA_RELEASE)! We need the Fedora $(SUPPORTED_FEDORA_RELEASE)"
	@exit 1
endif


isRoot: isFedora
ifeq ($(MYUID),0)
	@echo "Running as root..."
else
	@echo "Running as ordinary user! Please, change to root!"
	@exit 1
endif

isNotRoot: isFedora
ifneq ($(MYUID),0)
	@echo "Running as ordinary user..."
else
	@echo "Running as root! Please, change to ordinary user!"
	@exit 1
endif


clean: isRoot
	@echo "Remove junky programs i hate..."
	dnf -y4 remove clipit asunder gnomebaker lxmusic gnumeric osmo pidgin xpad

clear: clean

rpmfusion: isRoot
	@echo "Install rpm fussion repos..."
	dnf -y4 install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(FEDORA_RELEASE).noarch.rpm 
	dnf -y4 install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(FEDORA_RELEASE).noarch.rpm

upgrade: isRoot
	@echo "Upgrading system!..."
	dnf clean all
	dnf -y4 upgrade

console: upgrade
	@echo "Installing console tools..."
	dnf -y4 install screen mc sshfs gnupg gnupg2 acpi git dnf-plugins-core make wget curl
	systemctl enable sshd
	systemctl start sshd

gui: console
	@echo "Installing desktop applications..."
	dnf -y4 install rednotebook swift firefox system-config-users sqliteman libpng12 liferea keepassx seahorse scrot system-config-firewall setroubleshoot

music: console rpmfusion
	@echo "Installing music related applications..."
	dnf -y4 install mpd lame ncmpc

video: gui rpmfusion
	@echo "Installing video related tools..."
	dnf -y4 install smplayer camorama
	
redis: console
	@echo "Installing redis database..."
	dnf -y4 install redis
	systemctl start redis
	systemctl enable redis

exposeRedis: redis
	@echo "Making redis listen on 0.0.0.0:6379"

mongo: console
	@echo "Installing mongo database..."
	dnf -y4 install mongodb mongodb-server
	systemctl start mongod
	systemctl enable mongod

exposeMongo: mongo
	@echo "Making mongo database listen on 0.0.0.0:27017..."
	
mariadb: console
	@echo "Installing MariaDB database..."
	dnf -y4 install mariadb
	mv /etc/my.cnf /etc/my.cnf.backup
	mv contrib/my.cnf /etc/my.cnf
	chown root:root /etc/my.cnf
	systemctl start mariadb
	systemctl enable mariadb

exposeMariadb: mariadb
	@echo "Making MariaDB database listen on 0.0.0.0:3306"

golang: console
	@echo "Installing golang toolchain"
	dnf -y4 install golang golang-godoc

golangEnv: isNotRoot
	@echo "Setting Golang environment for current user"
	@echo "# Setting Golang environment" >> $(HOME)/.bash_profile
	@echo "export GOROOT=/usr/lib/golang" >> $(HOME)/.bash_profile
	@echo "export GOPATH=\$$HOME/go" >> $(HOME)/.bash_profile
	@echo "export PATH=\$$PATH:\$$HOME/go/bin" >> $(HOME)/.bash_profile
	@mkdir $(HOME)/go

nodejs: console
	@echo "Install nodejs of actual version and tools required"
	dnf -y install gcc-c++ krb5-libs krb5-devel
	dnf -y copr enable nibbler/nodejs
	dnf -y install nodejs nodejs-devel npm

tor: console
	@echo "Install and start Tor"
	dnf -y4 install tor
	systemctl enable tor
	systemctl start tor

foto: gui
	@echo "Install foto editing tools"
	dnf -y install shotwell rawstudio gimp

syncthing: console
	@echo "Installing Syncthing application"
	dnf -y copr enable decathorpe/syncthing
	dnf -y install syncthing

aws: console
	dnf -y4 install awscli

heroku: console
	@echo "Installing Heroku toolchain"
	dnf -y4 install ruby
	rm -rf /usr/local/heroku
	mkdir -p /usr/local/heroku
	mkdir -p /tmp/heroku/heroku-client
	curl https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz >> /tmp/heroku-client.tgz
	tar -zxvf /tmp/heroku-client.tgz --directory /tmp/heroku/
	mv /tmp/heroku/heroku-client /usr/local/heroku
	rm -rf /tmp/heroku
	rm -f /tmp/heroku-client.tgz
	ln -s /usr/local/heroku/bin/heroku /usr/bin/heroku

hipchat: gui
	@echo "Installing hipchat"
	rm -f /etc/yum.repos.d/atlassian-hipchat.repo
	@echo "[atlassian-hipchat]" >> /etc/yum.repos.d/atlassian-hipchat.repo
	@echo "name=Atlassian Hipchat" >> /etc/yum.repos.d/atlassian-hipchat.repo
	@echo "baseurl=http://downloads.hipchat.com/linux/yum" >> /etc/yum.repos.d/atlassian-hipchat.repo
	@echo "enabled=1" >> /etc/yum.repos.d/atlassian-hipchat.repo
	@echo "gpgcheck=1" >> /etc/yum.repos.d/atlassian-hipchat.repo
	@echo "gpgkey=https://www.hipchat.com/keys/hipchat-linux.key" >> /etc/yum.repos.d/atlassian-hipchat.repo
	dnf -y install hipchat

steam: rpmfusion gui
	@echo "Installing steam"
	dnf -y install steam

flux: gui
	@echo "Installing flux..."
	mkdir -p /tmp/xflux
	curl  https://justgetflux.com/linux/xflux64.tgz >> /tmp/xflux/xflux64.tgz
	tar -zxvf /tmp/xflux/xflux64.tgz --directory /tmp/xflux/
	mv /tmp/xflux/xflux /usr/bin/xflux
	chown root:root /usr/bin/xflux
	rm -rf /tmp/xflux

flux_enable: isNotRoot
	@echo "Enable xflux for current user..."
	@echo "# Enabling xflux" >> $(HOME)/.bash_profile

#todo
#if [ "$(pidof xflux)" ]
#then
# process was found
#  echo 'xflux is running!'
#else
# process not found
#  xflux -l 55 -g 37
#fi
#


docker: console
	@echo "Installing docker"
	dnf -y install docker
	systemctl start docker
	systemctl enable docker

nginx: console
	@echo "Installing nginx"
	dnf -y install nginx

viber: gui
	curl http://download.cdn.viber.com/desktop/Linux/viber.rpm >> /tmp/viber.rpm
	dnf -y install /tmp/viber.rpm
	rm -f /tmp/viber.rpm

skype: gui
	curl https://get.skype.com/go/getskype-linux-beta-fc10 >> /tmp/skype.rpm
	dnf -y install /tmp/skype.rpm
	rm -f /tmp/skype.rpm

