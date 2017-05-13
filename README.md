# BioCASe Provider Software
## Installation
Building and running the container is controlled by Makefile 
```
# enter the directory
cd biocase-docker

# build, run and configure BioCASe 
make 
```
* The BioCASe configuration script will suggest an Apache configuration, 
but you can ignore this as the configuration script will do this for you. 
* The BioCASe containter will automatically start
* So just visit the BioCASe interface (e.g. http://localhost/biocase)

## Stopping, restarting BioCASe
```
make stop
```
```
make start
```

## Uninstalling BioCASe
```
make clean
```