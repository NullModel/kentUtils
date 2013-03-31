#  Makefile for kentUtils project
#  performs the operations of fetching selected directories from
#  the kent source tree using 'git' and then building the utilities
#  in the kent source tree.

samtabixDir = ${CURDIR}/samtabix
DESTDIR = ${CURDIR}
BINDIR = /bin
extraCFlags =
mysqlInc =
mysqlLibs =
pngLib =

# WARNING: these 'ifeq' statements are currently backwards.
#          the 'else' clause is taken when the file under test exists
#          instead of the more logical meaning of:
#          if (file exists)
#             use this file
#          else
#             use different file
#          endif
#
#  The correct syntax needs to be worked out to straighten these out so
#      they can be read without confusion.
#

ifeq ($(wildcard /opt/local/include/png.h),)
   extraCFlags =
else
   extraCFlags = CFLAGS="-I/opt/local/include"
endif
ifeq ($(wildcard /opt/local/lib/libpng.a),)
  ifeq ($(wildcard /usr/lib64/libpng.a),)
    pngLib = -lpng
  else
    pngLib = /usr/lib64/libpng.a
  endif
else
  pngLib = /opt/local/lib/libpng.a
endif
ifeq ($(wildcard /usr/local/mysql/lib/libmysqlclient.a),)
  ifeq ($(wildcard /usr/lib64/mysql/libmysqlclient.so),)
    ifeq ($(wildcard /usr/lib/libmysqlclient.a),)
      ifeq ($(wildcard /usr/lib64/mysql/libmysqlclient.a),)
        mysqlLibs = -lmysqlclient -lz
      else
        mysqlLibs = /usr/lib64/mysql/libmysqlclient.a -lz
      endif
    else
      mysqlLibs = /usr/lib/libmysqlclient.a -lz
    endif
  else
    mysqlLibs = /usr/lib64/mysql/libmysqlclient.so -lz
  endif
else
  mysqlLibs = /usr/local/mysql/lib/libmysqlclient.a -lz -lssl -lcrypto
endif
ifeq ($(wildcard /usr/local/mysql/include/mysql.h),)
  mysqlInc = /usr/include/mysql
else
  mysqlInc = /usr/local/mysql/include
endif

makeFlags = SAMTABIXDIR=${samtabixDir} USE_SAMTABIX=1 MACHTYPE=local \
	DESTDIR=${DESTDIR} BINDIR=${BINDIR} MYSQLINC=${mysqlInc} \
	MYSQLLIBS=${mysqlLibs}

UTILS_APPLIST = aveCols ave aNotB cCp bestThreshold bedRemoveOverlap faCat \
	bedClip bedGraphToBigWig bedToBigBed \
	bigBedInfo bigBedSummary bigBedToBed bigWigAverageOverBed  \
	bigWigInfo bigWigSummary bigWigToBedGraph bigWigToWig\
	faCount faFrag faOneRecord faPolyASizes faRandomize faSize \
	faSomeRecords faToNib \
	faToTwoBit htmlCheck nibFrag paraFetch paraSync sizeof stringify \
	textHistogram twoBitDup twoBitInfo twoBitToFa userApps \
	wigCorrelate wigToBigWig

HG_APPLIST = bedSort liftUp liftOver bedItemOverlapCount encode/validateFiles \
	featureBits hgsql ratStuff/mafsInRegion ratStuff/mafSpeciesSubset \
	pslCDnaFilter genePredToGtf pslPretty pslReps pslSort

HG_UTILS_APPLIST = bedExtendRanges gapToLift gff3ToGenePred gtfToGenePred \
        hubCheck oligoMatch overlapSelect makeTableList pslMap

SRC_DIRS_DONE = ameme blat cdnaAli index reformat xenoAli

all: fetchSource libs utils

#
#  after the makefiles are completely fixed up in the kent source, the
#  kent/src/makefile can be used with its 'utils' target.  Until then,
#  these individual loops are done for the directories and programs that
#  have had their makefiles fixed.
#

utils:
	mkdir -p ${CURDIR}/bin
	@for P in ${SRC_DIRS_DONE}; do \
	    ( cd kent/src/$${P} && echo kent/src/$${P} && ${MAKE} ${makeFlags} PNGLIB=${pngLib}) ; \
	done
	@for P in ${UTILS_APPLIST}; do \
	    ( cd kent/src/utils/$${P} && echo kent/src/utils/$${P} && ${MAKE} ${makeFlags} PNGLIB=${pngLib}) ; \
	done
	cd kent/src/hg/utils && ${MAKE} utils DIRS="${HG_UTILS_APPLIST}" ${makeFlags} PNGLIB=${pngLib}
	@for P in ${HG_APPLIST}; do \
	    ( cd kent/src/hg/$${P} && echo kent/src/hg/$${P} && ${MAKE} ${makeFlags} PNGLIB=${pngLib} ) ; \
	done
	@echo "size of built kent source tree and binaries:"
	@du -hsc kent bin

libs:
	cd samtabix && ${MAKE} ${makeFlags}
	cd kent/src/lib && ${MAKE} ${makeFlags} ${extraCFlags}
	cd kent/src/jkOwnLib && ${MAKE} ${makeFlags}
	cd kent/src/hg/lib && ${MAKE} ${makeFlags} ${extraCFlags}

fetchSource:
	./scripts/fetchKentSource.sh
	@echo "size of fetched kent source tree:"
	@du -hs kent

clean:
	cd kent/src/lib && ${MAKE} ${makeFlags} clean
	cd kent/src/jkOwnLib && ${MAKE} ${makeFlags} clean
	cd kent/src/hg/lib && ${MAKE} ${makeFlags} clean
