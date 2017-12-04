######
#
# Note that
# certain installations require the following changes:
#
# atscc -> patscc
# atsopt -> patsopt
# ATSHOME -> PATSHOME
#
######
#
ATSHOMEQ=/usr/local
#
######
#
ATSCC=$(ATSHOMEQ)/bin/patscc
ATSOPT=$(ATSHOMEQ)/bin/patsopt
#
######
#
#
# HX: Please uncomment the one you want, or skip it entirely
#
ATSCCFLAGS=
# ATSCCFLAGS=-O2
#
# '-flto' enables link-time optimization such as inlining lib functions
#
# ATSCCFLAGS=-O2 -flto
#
#
######
#
subdirs := $(wildcard */)
sources := $(wildcard $(addsuffix *.dats,$(subdirs)))
# sources := $(wildcard $(addsuffix *.sats,$(subdirs)))
obj := $(sources:%.dats=%_dats.o)
bin := $(sources:%.dats=%)
#
all: $(bin)
#
#
# Please uncomment the following three lines and replace the name [foo]
# with the name of the file you want to compile
#
%: %_dats.o ; \
   $(ATSCC) $(ATSCCFLAGS) -o $@ $< || echo $@ ": ERROR!!!"
#
######
#
# You may find these rules useful
#
%_sats.o: %.sats ; $(ATSCC) $(ATSCCFLAGS) -cleanaft -o $@ -c $< || echo $@ ": ERROR!!!"
%_dats.o: %.dats ; $(ATSCC) $(ATSCCFLAGS) -cleanaft -o $@ -c $< || echo $@ ": ERROR!!!"
#
######
#
RMF=rm -f
#
######
#
clean:
	$(RMF) $(bin) $(obj)
#
###### end of [Makefile] ######
