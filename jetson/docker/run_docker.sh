#! /bin/sh
sudo docker run --rm -v /sys:/sys -v /proc:/proc --device /dev/gpiochip0:/dev/gpiochip0 --device /dev/gpiochip1:/dev/gpiochip1 --device /dev/i2c-0:/dev/i2c-0 --device /dev/i2c-1:/dev/i2c-1 -it --privileged jetson-test
