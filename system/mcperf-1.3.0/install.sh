#!/bin/sh

tar -xzvf mcperf-0.1.1.tar.gz
cd mcperf-0.1.1

./configure
make

cd ~

echo "#!/bin/sh
cd ~/mcperf-0.1.1
./src/mcperf \$@ > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status

kill -9 \$MEMCACHED_PID
sleep 3" > mcperf

chmod +x mcperf
