
#########################333
# Steps
## Steps
+ copy **docker** folder into source code.
after copy, the data folder looks like:
```
|- linux_libnfc-nci
   |+ src
   |+ .libs
   |+ docker
   | ...
   
```
+ do commandline
```
cd docker
sudo ./build.sh   	\\ build docker image
sudo ./run_docker.sh	\\ map native device to container and then run docker container
```
if configuration is correctly, the consonle of docker instance should be the same with local app'consonle


# Explanation

## Commandline ``` ./build.sh ``` 
This commadline build docker image (chmod if needed). It will do:
+ copy all files (include exe and libs) froms "./libs" folder into "docker/app" folder to prepare for building container image
+ build a docker image with **Dockerfile**

### Explain about how to build docker image (dockerfile)

```
FROM nvcr.io/nvidia/l4t-base:r32.4.3    \\ create a docker image inherited from *l4t-base* image of nvdia
COPY ./app/ /							\\ copy app to docker image
CMD ["/nfcDemoApp","poll"]				\\ execute a commandline: nfcDemoApp poll
```

## How docker start

To run docker image, exe the command line following:
```
sudo docker run --rm -v /sys:/sys -v /proc:/proc --device /dev/gpiochip0:/dev/gpiochip0 --device /dev/gpiochip1:/dev/gpiochip1 --device /dev/i2c-0:/dev/i2c-0 --device /dev/i2c-1:/dev/i2c-1 -it --privileged jetson-test
```

This commadline will map device/folder from native to docker container following:
```
device
	/dev/gpiochip0 -> /dev/gpiochip0
	/dev/gpiochip1 -> /dev/gpiochip1
	/dev/i2c-0	->	/dev/i2c-0
	/dev/i2c-1	-> /dev/i2c-1

folder:
	/sys  -> /sys
	/proc -> /proc
```























#############################################
# key 
```sh
docker login nvcr.io

Username: $oauthtoken
Password: ZHVwMDI5YTVkMWptbmtidTJ2YXJpM3AzZWM6ZTBkYmU3NzAtMGExMS00Yjc1LThhNWMtM2I5M2E3NzVmMmVh
