ME=$(USER)
all: build up

clean: stop rm

cleandb:
	docker-compose stop db
	docker-compose rm -vf db
	sudo chown -R $(ME):$(ME) ./mysql-datadir
	sudo rm -rf mysql-datadir

access:
	@echo "Accessing shell on biocase"
	docker exec -it dwbiocase_biocase_1 bash

initdb:
	@echo "If you just ran make cleandb, this will load latest db dump placed in mysql-autoload"
	docker-compose up -d db
	@echo "Run docker-compose logs db for seeing progress"

build:
	@echo "Rebuilding images"
	docker-compose build

up:
	docker-compose up -d

stop:
	docker-compose stop

rm:
	docker-compose rm -vf
