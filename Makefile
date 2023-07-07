USER			= din
DATA_PATH 		= /home/$(USER)/data
DC			= cd srcs/ && sudo docker compose

all		:
			mkdir -p $(DATA_PATH)
			mkdir -p $(DATA_PATH)/wordpress
			mkdir -p $(DATA_PATH)/mariadb
			sudo chown -R $(USER):$(USER) $(DATA_PATH)/wordpress
			sudo chown -R $(USER):$(USER) $(DATA_PATH)/mariadb
			sudo chmod 777 /etc/hosts
			echo "127.0.0.1 $(USER).42.fr" >> /etc/hosts
			echo "127.0.0.1 www.$(USER).42.fr" >> /etc/hosts
			$(DC) up -d

up:
			${DC} up -d 

down	:
			$(DC) down

clean	:
			$(DC) down -v --rmi all --remove-orphans

fclean	:	clean
			docker system prune --volumes --all --force
			sudo rm -rf $(DATA_PATH)
			docker network prune --force
			
debug	:		
			$(DC) down -v
			sudo rm -rf ~/data/mariadb/* ~/data/wordpress/*
			$(DC) up --build
re		:	fclean all

.PHONY : all up down pause unpause clean fclean re
