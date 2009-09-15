
ifeq "$(PREFIX)" ""
	PREFIX=$(HOME)
endif

ifeq "$(BINDIR)" ""
	BINDIR=$(PREFIX)/bin
endif

ALL_SCRIPTS = $(BASE_SCRIPTS) \
			  $(EXTRA_SCRIPTS)

BASE_SCRIPTS = dtree \
			   ansicolortable

EXTRA_SCRIPTS = jpegrescan \
				mlarc2mbox \
				pause-pulseaudio

.PHONY  = all $(ALL_SCRIPTS)

all: $(ALL_SCRIPTS)
base: $(BASE_SCRIPTS)
extra: $(EXTRA_SCRIPTS)

$(ALL_SCRIPTS):: $(BINDIR)
	install -m755 $@ $(BINDIR)/

$(BINDIR):
	mkdir -p $(BINDIR)

