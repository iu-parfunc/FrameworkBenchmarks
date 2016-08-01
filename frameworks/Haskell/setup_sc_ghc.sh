#!/bin/bash

set -xe

DIR=`pwd`

cd /tmp/
if ! [ -d /opt/ghc ]; then 
  wget -q http://cs.indiana.edu/~rrnewton/temp/ghc-sc-v0.4-opt.tgz
  tar xf ghc-sc-v0.4-opt.tgz
  sudo cp -a ghc-sc-v0.4-opt /opt/ghc
fi
export PATH=/opt/ghc/bin:$PATH
sudo ln -s -f /opt/ghc/bin/* /usr/bin/
echo "Custom SC-GHC set up."

which -a ghc
ghc --version

cd "$DIR"
