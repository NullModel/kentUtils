#!/bin/bash

git clone http://genome-source.cse.ucsc.edu/samtabix.git samtabix
git archive --remote=git://genome-source.cse.ucsc.edu/kent.git \
--prefix=kent/ HEAD \
src/product \
src/dnaDust \
src/inc \
src/utils \
src/jkOwnLib \
src/lib | tar xf -
