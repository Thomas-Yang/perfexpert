#
# Copyright (c) 2011-2016  University of Texas at Austin. All rights reserved.
#
# $COPYRIGHT$
#
# Additional copyrights may follow
#
# This file is part of PerfExpert.
#
# PerfExpert is free software: you can redistribute it and/or modify it under
# the terms of the The University of Texas at Austin Research License
#
# PerfExpert is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.
#
# Authors: Antonio Gomez-Iglesias, Leonardo Fialho and Ashay Rane
#
# $HEADER$
#

lib_LTLIBRARIES = libperfexpert_module_lcpi.la
libperfexpert_module_lcpi_la_CPPFLAGS = -I$(srcdir)/../.. -fopenmp
libperfexpert_module_lcpi_la_LDFLAGS = -lpapi -lmatheval -lm -lsqlite3 -fopenmp -module
	-version-info 1:0:0 -export-symbols $(srcdir)/lcpi_module.sym
libperfexpert_module_lcpi_la_SOURCES = lcpi_module.c \
	lcpi_database.c \
	lcpi_logic.c \
	lcpi_options.c \
	lcpi_output.c \
	lcpi_sort.c \
	lcpi_metrics_papi.c \
	lcpi_metrics_jaketown.c \
	lcpi_metrics_haswell.c \
	lcpi_metrics_knl.c \
	lcpi_metrics_skl.c \
	lcpi_metrics_mic.c

# Install lcpi module database
install-exec-local:
	$(MKDIR_P) $(DESTDIR)$(sysconfdir)
	$(INSTALL) -m 644 $(top_srcdir)/modules/lcpi/lcpi_module.sql \
		$(DESTDIR)$(sysconfdir)/

# EOF
