#!/bin/bash

set -x

sed -i 's|host=".*"|host="'"${DBHOST}"'"|g' bench/cfg/db.cfg

fw_depends stack

`dirname $0`/../setup_sc_ghc.sh
cd ./bench

${IROOT}/stack --allow-different-user build --system-ghc --no-install-ghc

${IROOT}/stack --allow-different-user exec snap-bench -- +RTS -A4M -N -qg2 -I0 -G2 &
