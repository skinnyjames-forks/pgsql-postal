
MODULE_big = postal
OBJS = postal.o
EXTENSION = postal
DATA = postal--1.0.sql
REGRESS = postal
EXTRA_CLEAN =

PG_CONFIG = pg_config

PG_CPPFLAGS := -I$(POSTAL_INCLUDE)
LIBS += -L$(POSTAL_LIBS) -lpostal
SHLIB_LINK := $(LIBS)

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
