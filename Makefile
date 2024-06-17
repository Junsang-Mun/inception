.PHONY: all re down clean

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build --progress=plain --no-cache

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa);
	docker rm $$(docker ps -qa);
	docker rmi -f $$(docker images -qa);
	docker volume rm $$(docker volume ls -q);

fclean: clean
	sudo rm -rf /home/junmoon/data/mysql/*
	sudo rm -rf /home/junmoon/data/wordpress/*