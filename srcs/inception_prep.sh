#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade

# install:
# - make
# - curl: download files and navigate into the web pages using http protocole.
# - lsb-release: package that let you display information of the linux distribution, the name or the version.
# - ca-certification: package giving the certificate of the certification authority (CA) for establish secure connection.
# - apt-transport-https: Package enabling the HTTPS protocol to be used for APT repositories.
# - software-propreties-common: Package containing tools for managing software properties, such as repository configuration and package installation.
# - hostsed: Package used to manage the /etc/hosts file to specify the IP addresses of local hosts.

sudo apt-get -y install make curl lsb-release ca-certificates apt-transport-https software-propreties-common hostsed

# - "-fsSL": Is used for specified the option of curl, -f (--fail) display an error message if the download fail, -s (--silent) mask the output, -SL (--location) is for follow the redirection.
# - |: to redirect the output of the first command to the input of the second command.
# - gpg: decrypt the previously downloaded gpg file and convert it into a usable format.
# - "--dearmor": is used for decrypting the file.
# - "-o": is used for specified the output file "/usr/share/keyrings/docker-archive-keyring.gpg"

sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# - "dpkg --print-architecture": Indicate the system architecture, and the GPG key for verifying the authenticity of packages. The Docker repository is defined for the "stable" version and the system architecture.
# - tee write an character string (the docker repo entry) to the file /etc/apt/sources.list.d/docker.list. If the file does not exist, it's created.

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get -y install docker-ce
sudo apt-get update
sudo apt-get -y install docker-compose docker-compose-plugin
sudo apt-get update
sudo rm -rf /var/lib/apt/lists

if [ -d "/home/$USER/data" ]; then \
	echo "/home/$USER/data already exists"; else \
	mkdir /home/$USER/data; \
	echo "data directory created successfully"; \
fi

if [ -d "/home/$USER/data/wordpress" ]; then \
	echo "/home/$USER/data/wordpress already exists"; else \
	mkdir /home/$USER/data/wordpress; \
	echo "wordpress directory created successfully"; \
fi

if [ -d "/home/$USER/data/mariadb" ]; then \
	echo "/home/$USER/data/mariadb already exists"; else \
	mkdir /home/$USER/data/mariadb; \
	echo "mariadb directory created successfully"; \
fi
