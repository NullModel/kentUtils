
samtabixDir = ${CURDIR}/samtabix
destDir = ${CURDIR}
binDir = /bin
extraCFlags =
mysqlInc =
mysqlLibs =
pngLib =

ifeq ($(wildcard /opt/local/include/png.h),)
   extraCFlags =
else
   extraCFlags = CFLAGS="-I/opt/local/include"
endif
ifeq ($(wildcard /opt/local/lib/libpng.a),)
  pngLib = /usr/lib64/libpng.a
else
  pngLib = /opt/local/lib/libpng.a
endif
ifeq ($(wildcard /usr/local/mysql/lib/libmysqlclient.a),)
  mysqlLibs = /usr/lib64/mysql/libmysqlclient.a -lz
else
  mysqlLibs = /usr/local/mysql/lib/libmysqlclient.a -lz -lssl -lcrypto
endif
ifeq ($(wildcard /usr/local/mysql/include/mysql.h),)
  mysqlInc = /usr/include/mysql
else
  mysqlInc = /usr/local/mysql/include
endif

makeFlags = SAMTABIXDIR=${samtabixDir} USE_SAMTABIX=1 MACHTYPE=local \
	DESTDIR=${destDir} BINDIR=${binDir} MYSQLINC=${mysqlInc} \
	MYSQLLIBS=${mysqlLibs}

all: fetchSource libs utils

utils:
	mkdir -p ${CURDIR}/bin
	cd kent/src/utils/aveCols && ${MAKE} ${makeFlags} PNGLIB=${pngLib}
	cd kent/src/hg/utils/gapToLift && ${MAKE} ${makeFlags} PNGLIB=${pngLib}

libs:
	cd samtabix && ${MAKE} ${makeFlags}
	cd kent/src/lib && ${MAKE} ${makeFlags} ${extraCFlags}
	cd kent/src/jkOwnLib && ${MAKE} ${makeFlags}
	cd kent/src/hg/lib && ${MAKE} ${makeFlags} ${extraCFlags}

fetchSource:
	./scripts/fetchKentSource.sh

clean:
	cd kent/src/lib && ${MAKE} ${makeFlags} clean
