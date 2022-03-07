# dmenu version
VERSION = 5.1

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2
# OpenBSD (uncomment)
#FREETYPEINC = $(X11INC)/freetype2

# includes and libs
INCS = -I$(X11INC) -I$(FREETYPEINC)
LIBS = -L$(X11LIB) -lX11 $(XINERAMALIBS) $(FREETYPELIBS)

# flags
CPPFLAGS = -D_GLIBCXX_ASSERTIONS -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"$(VERSION)\" $(XINERAMAFLAGS)
CFLAGS   = -std=c99 -pedantic -Wall -march=native -O2 -pipe -D_FORTIFY_SOURCE=2 -fstack-clash-protection -fexceptions -fstack-protector-strong -fcf-protection -fpie -fpic -ftree-vectorize -fomit-frame-pointer $(INCS) $(CPPFLAGS)
LDFLAGS  = $(LIBS)

# compiler and linker
CC = cc

# additionnal options
MAKEOPTS="-j4"

