#!/bin/bash

echo "fetch samtabix" 1>&2
git clone http://genome-source.cse.ucsc.edu/samtabix.git samtabix

echo "fetch kent source" 1>&2
git archive --remote=git://genome-source.cse.ucsc.edu/kent.git \
--prefix=kent/ HEAD \
src/ameme \
src/blat \
src/cdnaAli \
src/gfClient \
src/gfServer \
src/index \
src/product \
src/reformat \
src/dnaDust \
src/inc \
src/utils \
src/jkOwnLib \
src/lib \
src/hg/bedItemOverlapCount \
src/hg/bedSort \
src/hg/encode/validateFiles \
src/hg/featureBits \
src/hg/genePredToGtf \
src/hg/hgsql \
src/hg/inc \
src/hg/lib \
src/hg/liftUp \
src/hg/liftOver \
src/hg/makeDb/hgLoadWiggle \
src/hg/makeDb/hgGcPercent \
src/hg/pslCDnaFilter \
src/hg/pslPretty \
src/hg/pslReps \
src/hg/pslSort \
src/hg/ratStuff/mafsInRegion \
src/hg/ratStuff/mafSpeciesSubset \
src/hg/utils | tar xf -
