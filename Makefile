DATA_PATH 		= /Users/kdi-noce/data
DC				= cd srcs/ && docker-compose

all		:
			mkdir -p $(DATA_PATH)
			mkdir -p $(DATA_PATH)/wordpress
			mkdir -p $(DATA_PATH)/mariadb
#			chmod 777 /etc/hosts
#			echo "127.0.0.1 kdi-noce.42.fr" >> /etc/hosts
#			echo "127.0.0.1 www.kdi-noce.42.fr" >> /etc/hosts
			$(DC) up -d

up:
			${DC} up -d 

down	:
			$(DC) down

clean	:
			$(DC) down -v --rmi all --remove-orphans

fclean	:	clean
			docker system prune --volumes --all --force
			rm -rf $(DATA_PATH)
			docker network prune --force

re		:	fclean all

.PHONY : all up down pause unpause clean fclean re
