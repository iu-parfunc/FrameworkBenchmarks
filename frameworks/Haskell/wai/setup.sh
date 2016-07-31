#!/bin/bash

fw_depends stack

`dirname $0`/../setup_sc_ghc.sh

cd bench

${IROOT}/stack --allow-different-user build --system-ghc --no-install-ghc

${IROOT}/stack --allow-different-user exec bench -- ${MAX_THREADS} ${DBHOST} +RTS -A32m -N${MAX_THREADS} &
