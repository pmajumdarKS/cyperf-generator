#!/bin/bash

USER_ID=${LOCAL_UID:0}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m cyperf -p $(openssl passwd -1 cyperf)
export HOME=/home/cyperf
echo "export PYTHONPATH=/cyperf/cyperf/" >> /home/cyperf/.bashrc

usermod -aG sudo cyperf

cd /cyperf/cyperf
exec /usr/local/bin/gosu cyperf bash

