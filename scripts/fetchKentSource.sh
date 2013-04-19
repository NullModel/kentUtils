#!/bin/bash

echo "fetch samtabix" 1>&2
git clone http://genome-source.cse.ucsc.edu/samtabix.git samtabix

export ofN="of 4"

rm -f part1Src.zip part2Src.zip part3Src.zip part4Src.zip

echo "fetch kent source part 1 ${ofN}" 1>&2
git archive --format=zip -9 --remote=git://genome-source.cse.ucsc.edu/kent.git \
--prefix=kent/ HEAD \
src/ameme \
src/aladdin \
src/blat \
src/cdnaAli \
src/dnaDust \
src/fuse \
src/getgene \
src/gfClient \
src/gfServer \
src/idbQuery \
src/index \
src/makefile \
src/meta \
src/primeMate \
src/product \
src/protDust \
src/reformat \
src/scanIntrons \
src/tracks \
src/weblet \
src/wormAli \
src/xenoAli \
src/inc \
src/utils \
src/jkOwnLib \
src/lib \
src/hg/affyTransciptome \
src/hg/agpAllToFaFile \
src/hg/agpCloneCheck \
src/hg/agpCloneList \
src/hg/agpToFa \
src/hg/agpToGl \
src/hg/altSplice \
src/hg/autoDtd \
src/hg/autoSql \
src/hg/autoXml \
src/hg/bedIntersect \
src/hg/bedItemOverlapCount \
src/hg/bedOrBlocks \
src/hg/bedSort \
src/hg/bedSplitOnChrom \
src/hg/bedToGenePred \
src/hg/blastToPsl \
src/hg/borfBig \
src/hg/checkCoverageGaps \
src/hg/checkHgFindSpec \
src/hg/checkTableCoords \
src/hg/ctgFaToFa \
src/hg/ctgToChromFa \
src/hg/dbTrash \
src/hg/embossToPsl \
src/hg/estOrient \
src/hg/encode/validateFiles \
src/hg/fakeFinContigs \
src/hg/fakeOut \
src/hg/featureBits \
src/hg/ffaToFa \
src/hg/fishClones  > part1Src.zip

echo "fetch kent source part 2 ${ofN}" 1>&2
git archive --format=zip -9 --remote=git://genome-source.cse.ucsc.edu/kent.git \
--prefix=kent/ HEAD \
src/hg/fqToQa \
src/hg/fqToQac \
src/hg/fragPart \
src/hg/gbGetEntries \
src/hg/gbOneAcc \
src/hg/gbToFaRa \
src/hg/geneBounds \
src/hg/genePredHisto \
src/hg/genePredSingleCover \
src/hg/genePredToBed \
src/hg/genePredToFakePsl \
src/hg/genePredToGtf \
src/hg/genePredToMafFrames \
src/hg/getFeatDna \
src/hg/getRna \
src/hg/getRnaPred \
src/hg/gpStats \
src/hg/gpToGtf \
src/hg/gpcrParser \
src/hg/gsBig \
src/hg/hgChroms \
src/hg/hgGetAnn \
src/hg/hgKnownGeneList \
src/hg/hgSelect \
src/hg/hgSpeciesRna \
src/hg/hgTablesTest \
src/hg/hgsql \
src/hg/hgsqlLocal \
src/hg/hgsqlSwapTables \
src/hg/hgsqlTableDate \
src/hg/hgsqladmin \
src/hg/hgsqldump \
src/hg/hgsqldumpLocal \
src/hg/hgsqlimport \
src/hg/inc \
src/hg/intronEnds \
src/hg/lib \
src/hg/lfsOverlap \
src/hg/liftAcross \
src/hg/liftAgp \
src/hg/liftFrags \
src/hg/liftUp \
src/hg/liftOver \
src/hg/makefile \
src/hg/makeDb/hgLoadWiggle \
src/hg/makeDb/hgGcPercent \
src/hg/utils > part2Src.zip

echo "fetch kent source part 3 ${ofN}" 1>&2
git archive --format=zip -9 --remote=git://genome-source.cse.ucsc.edu/kent.git \
--prefix=kent/ HEAD \
src/hg/maskOutFa \
src/hg/mdToNcbiLift \
src/hg/mrnaToGene \
src/hg/orthoMap \
src/hg/patCount \
src/hg/perf \
src/hg/pslCat \
src/hg/pslCheck \
src/hg/pslCoverage \
src/hg/pslCDnaFilter \
src/hg/pslPretty \
src/hg/pslReps \
src/hg/pslSort \
src/hg/pslDropOverlap \
src/hg/pslFilter \
src/hg/pslFilterPrimers \
src/hg/pslGlue \
src/hg/pslHisto \
src/hg/pslHitPercent \
src/hg/pslIntronsOnly \
src/hg/pslPairs \
src/hg/pslPartition \
src/hg/pslQuickFilter \
src/hg/pslRecalcMatch \
src/hg/pslSelect \
src/hg/pslSimp \
src/hg/pslSortAcc \
src/hg/pslSplitOnTarget \
src/hg/pslStats \
src/hg/pslSwap \
src/hg/pslToBed \
src/hg/pslUnpile \
src/hg/pslxToFa \
src/hg/qa \
src/hg/qaToQac \
src/hg/qacAgpLift \
src/hg/qacToQa \
src/hg/qacToWig \
src/hg/ratStuff/mafsInRegion \
src/hg/ratStuff/mafSpeciesSubset \
src/hg/recycleDb \
src/hg/relPairs \
src/hg/reviewSanity \
src/hg/rnaStructure \
src/hg/scanRa \
src/hg/semiNorm \
src/hg/sim4big \
src/hg/snp \
src/hg/snpException \
src/hg/spideyToPsl > part3Src.zip

echo "fetch kent source part 4 ${ofN}" 1>&2
git archive --format=zip -9 --remote=git://genome-source.cse.ucsc.edu/kent.git \
--prefix=kent/ HEAD \
src/hg/encode3 \
src/hg/splitFa \
src/hg/splitFaIntoContigs \
src/hg/sqlEnvTest.sh \
src/hg/sqlToXml \
src/hg/test \
src/hg/trfBig \
src/hg/txCds \
src/hg/txGene \
src/hg/txGraph \
src/hg/uniqSize \
src/hg/updateStsInfo \
src/hg/xmlCat \
src/hg/xmlToSql \
src/hg/hgTables \
src/hg/near \
src/hg/pslDiff \
src/hg/sage \
src/hg/gigAssembler/checkAgpAndFa \
src/hg/genePredCheck > part4Src.zip

unzip -q part1Src.zip
unzip -q part2Src.zip
unzip -q part3Src.zip
unzip -q part4Src.zip
