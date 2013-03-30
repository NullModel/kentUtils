#!/bin/bash

echo "fetch samtabix" 1>&2
git clone http://genome-source.cse.ucsc.edu/samtabix.git samtabix

echo "fetch kent source" 1>&2
git archive --remote=git://genome-source.cse.ucsc.edu/kent.git \
--prefix=kent/ HEAD \
src/ameme \
src/blat \
src/cdnaAli \
src/index \
src/product \
src/dnaDust \
src/inc \
src/utils \
src/jkOwnLib \
src/lib \
src/hg/utils \
src/hg/inc \
src/hg/lib | tar xf -
