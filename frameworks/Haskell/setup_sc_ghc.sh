#!/bin/bash

set -xe

DIR=`pwd`

cd /tmp/
wget http://cs.indiana.edu/~rrnewton/temp/ghc-sc-v0.4-opt.tgz
tar xf ghc-sc-v0.4-opt.tgz
sudo mv ghc-sc-v0.4-opt /opt/ghc
export PATH=/opt/ghc/bin:$PATH
echo "Custom SC-GHC set up."

cd "$DIR"
