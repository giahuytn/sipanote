
#########################333
# Steps
## 1. copy this folder into source code.
after copy, the data folder looks like:
```
|- linux_libnfc-nci
   |+ src
   |+ .libs
   |+ docker
   | ...
   
```
## 2. go to docker folder and run ``` ./build.sh ``` to build docker image (chmod if needed)

### Notice
This commadline will copy all files (include exe and libs) froms "./libs" folder into "docker/app" folder to prepare for building container image

### Explain about how to build docker image (dockerfile)

```
FROM nvcr.io/nvidia/l4t-base:r32.4.3    \\ create a docker image inherited from *l4t-base* image of nvdia
COPY ./app/ /							\\ copy app to docker image
CMD ["/nfcDemoApp","poll"]				\\ execute a commandline: nfcDemoApp poll
```

## 3. to start docker, run
```
sudo run_docker.sh
```
or 
```
sudo docker run --rm -v /sys:/sys -v /proc:/proc --device /dev/gpiochip0:/dev/gpiochip0 --device /dev/gpiochip1:/dev/gpiochip1 --device /dev/i2c-0:/dev/i2c-0 --device /dev/i2c-1:/dev/i2c-1 -it --privileged jetson-test
```

### Notice
As Dinesh said, the app use i2c Port + gpio for the interface, therefore we need to map device from native to docker container
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

# key 
```sh
docker login nvcr.io

Username: $oauthtoken
Password: ZHVwMDI5YTVkMWptbmtidTJ2YXJpM3AzZWM6ZTBkYmU3NzAtMGExMS00Yjc1LThhNWMtM2I5M2E3NzVmMmVh
```