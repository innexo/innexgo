#!/bin/sh

exec sudo java -jar -Dserver.port=80 ./build/libs/innexgo-0.0.1-SNAPSHOT.jar >> ~/logs.txt
