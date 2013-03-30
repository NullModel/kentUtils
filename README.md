kentUtils
=========

UCSC genome browser 'kent' bioinformatic utilities

=========

System Requirements:

Linux/Unix/MacOSX system
'git' source code management: http://git-scm.com/downloads
gnu gcc - C code development system - http://www.gnu.org/software/gcc/
gnu make - http://www.gnu.org/software/make/

=========

1. Fetch the kentUtils git repository:
   git clone git://github.com/NullModel/kentUtils.git 

   Creates the directory ./kentUtils/

2. Build utilities:
   cd kentUtils
   make

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
