#!/bin/bash

set -x

sed -i 's|host=".*"|host="'"${DBHOST}"'"|g' bench/cfg/db.cfg

fw_depends stack

DIR=`pwd`

cd /tmp/
wget http://cs.indiana.edu/~rrnewton/temp/ghc-sc-v0.4-opt.tgz
tar xf ghc-sc-v0.4-opt.tgz
mv ghc-sc-v0.4-opt /opt/ghc
export PATH=/opt/ghc/bin:$PATH
echo "Custom SC-GHC set up."

cd $DIR/bench

${IROOT}/stack --allow-different-user build --system-ghc --no-install-ghc

${IROOT}/stack --allow-different-user exec snap-bench -- +RTS -A4M -N -qg2 -I0 -G2 &
