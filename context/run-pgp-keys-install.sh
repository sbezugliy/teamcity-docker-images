#!/bin/bash -e

RVM_PGP_KEYS='409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB'

$(gpg --keyserver hkp://pool.sks-keyservers.net \
  --recv-keys ${RVM_PGP_KEYS})||\
$(gpg --keyserver hkp://ipv4.pool.sks-keyservers.net \
  --recv-keys ${RVM_PGP_KEYS})||\
$(gpg --keyserver hkp://pgp.mit.edu \
  --recv-keys ${RVM_PGP_KEYS})||\
$(gpg --keyserver hkp://keyserver.pgp.com \
  --recv-keys ${RVM_PGP_KEYS})
