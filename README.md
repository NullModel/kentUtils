kentUtils
=========

UCSC genome browser 'kent' bioinformatic utilities

=========

System Requirements:    (see notes below about installing packages)

Linux/Unix/MacOSX system
'git' source code management: http://git-scm.com/downloads
gnu gcc - C code development system - http://www.gnu.org/software/gcc/
gnu make - http://www.gnu.org/software/make/
MySQL development system and libraries
libpng
libssl

=========

1. Fetch the kentUtils git repository:
   git clone git://github.com/NullModel/kentUtils.git 

   Creates the directory ./kentUtils/

2. Build utilities:
   cd kentUtils
   make

   This build fetches (with git) approximately 60 Mb of kent source code,
   and constructs command binaries of approximately 120 Mb.

3. Install utilities
   The binaries are built into kentUtils/bin/
   To install them in a global bin/ directory, copy them
   to desired location:
      sudo rsync -a -P bin/ /usr/local/bin/kentUtils/

   The destination bin/kentUtils/ should be its own unique directory
   to avoid overwriting same-named binaries in a standard bin/ directory.

   Users add '/usr/local/bin/kentUtils' to their shell PATH
   to access the commands.

=========

Installing required packages:

On a MacOS system, you will need the XCode system installed:
   https://developer.apple.com/xcode/
And the Mac Ports install system:
   http://www.macports.org/
With the mac ports and XCode systems installed, you can install
the additional packages required (and helpful):
  sudo port install git-core gnutls rsync libpng mysql55 openssl curl wget

On a typical Linux system, for example Ubuntu, use the apt-get command
to install additional packages:
   sudo apt-get install git libssl-dev openssl mysql-client-5.1 \
      mysql-client-core-5.1

Or appropriate system management install software (e.g. 'yum' on CentOS)

See also:
	https://help.ubuntu.com/8.04/serverguide/apt-get.html
	http://www.centos.org/docs/5/html/yum/

=========
