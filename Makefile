all:
	@sudo hostsed add 127.0.0.1 kdi-noce.42.fr && echo "successfully added kdi-noce.42.fr to /etc/hosts"
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
#	uncomment the following line to remove the images too
#	sudo docker system prune -a

fclean: clean
	@sudo hostsed rm 127.0.0.1 kdi-noce.42.fr && echo "successfully removed kdi-noce.42.fr to /etc/hosts"
	@if [ -d "/home/kdi-noce/data/wordpress" ]; then \
	sudo rm -rf /home/kdi-noce/data/wordpress/* && \
	echo "successfully removed all contents from /home/kdi-noce/data/wordpress/"; \
	fi;

	@if [ -d "/home/kdi-noce/data/mariadb" ]; then \
	sudo rm -rf /home/kdi-noce/data/mariadb/* && \
	echo "successfully removed all contents from /home/kdi-noce/data/mariadb/"; \
	fi;

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, clean, fclean, re, ls
