
samtabixDir = ${CURDIR}/samtabix
destDir = ${CURDIR}
binDir = /bin
extraCFlags =
pngLib = /usr/lib64/libpng.a
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
makeFlags = SAMTABIXDIR=${samtabixDir} USE_SAMTABIX=1 MACHTYPE=local \
	DESTDIR=${destDir} BINDIR=${binDir}

all: fetchSource libs utils

utils:
	mkdir -p ${CURDIR}/bin
	cd kent/src/utils/aveCols && ${MAKE} ${makeFlags} PNGLIB=${pngLib}

libs:
	cd samtabix && ${MAKE} ${makeFlags}
	cd kent/src/lib && ${MAKE} ${makeFlags} ${extraCFlags}
	cd kent/src/jkOwnLib && ${MAKE} ${makeFlags}

fetchSource:
	./scripts/fetchKentSource.sh

clean:
	cd kent/src/lib && ${MAKE} ${makeFlags} clean
