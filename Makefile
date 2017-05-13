ME=$(USER)
TAG=dina/biocase
CONTAINER=biocase-docker
PORT=80

all: build start config

clean: stop rm rmi

build:
	@echo "(Re-)building BioCASe image..."
	docker build -t="$(TAG)" ./

config:
	@echo "Configuring BioCASe..."
	docker exec -it $(CONTAINER) config-biocase
	docker restart $(CONTAINER) 
	
start:
	@echo "Starting BioCASe..."
	docker run -d -p$(PORT):80 --name=$(CONTAINER) --hostname=$(CONTAINER) "$(TAG)"

stop:
	@echo "Stopping BioCASe..."
	docker stop $(CONTAINER)

rm:
	@echo "Removing BioCASe container..."
	docker rm $(CONTAINER) 

rmi:
	@echo "Removing BioCASe image..."
	docker rmi $(TAG)
