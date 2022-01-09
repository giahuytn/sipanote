#! /bin/sh
rm -r app
cp -avr ../.libs/ ./app/
docker build --tag jetson-test .
