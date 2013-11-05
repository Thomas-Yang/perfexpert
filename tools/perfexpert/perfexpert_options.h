/*
 * Copyright (c) 2011-2013  University of Texas at Austin. All rights reserved.
 *
 * $COPYRIGHT$
 *
 * Additional copyrights may follow
 *
 * This file is part of PerfExpert.
 *
 * PerfExpert is free software: you can redistribute it and/or modify it under
 * the terms of the The University of Texas at Austin Research License
 *
 * PerfExpert is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.
 *
 * Authors: Leonardo Fialho and Ashay Rane
 *
 * $HEADER$
 */

#ifndef PERFEXPERT_OPTIONS_H_
#define PERFEXPERT_OPTIONS_H_

#ifdef __cplusplus
extern "C" {
#endif

#ifndef _ARGP_H
#include <argp.h>
#endif

/* Modules headers */
#include "modules/perfexpert_module_base.h"

/* PerfExpert common headers */
#include "config.h"

/* Basic package info */
const char *argp_program_version = PACKAGE_STRING;
const char *argp_program_bug_address = PACKAGE_BUGREPORT;

/* Structure to handle command line arguments */
static struct argp_option options[] = {
    #if HAVE_CODE_TRANSFORMATION
    { 0, 0, 0, 0, "Automatic optimization options:", 1 },
    { "target", 'm', "TARGET", 0, "Use GNU standard 'make' command to compile"
        " the code (it will run in the current directory)" },
    { "source", 's', "FILE", 0, "Set the source code file (does not work with"
        " multiple files, choose -m option instead)" },
    {0, 0, 0, 0,
        "Use CC, CFLAGS, CPPFLAGS and LDFLAGS to set compiler/linker options" },
    #endif

    { 0, 0, 0, 0, "Target program execution options:", 2 },
    { "inputfile", 'i', "FILE", 0, "Shortcut for --module-option=hpctoolkit,"
        "inputfile=FILE. See HPCToolkit module help for details" },
    { "after", 'a', "COMMAND", 0, "Shortcut for --module-option=hpctoolkit,"
        "after=COMMAND. See HPCToolkit module help for details" },
    { "before", 'b', "COMMAND", 0, "Shortcut for --module-option=hpctoolkit,"
        "before=COMMAND. See HPCToolkit module help for details" },
    { "prefix", 'p', "PREFIX", 0, "Shortcut for --module-option=hpctoolkit,"
        "prefix=PREFIX. See HPCToolkit module help for details" },

    { 0, 0, 0, 0, "Module handling options:", 4 },
    { "module-option", 'O', "MODULE,OPTION=VALUE", 0, "Set an option to a "
        "specific module (e.g., -O MODULE,OPTION=VALUE or --module-option="
        "MODULE,OPTION=VALUE). This argument can also be defined multiple "
        "times. This option automatically sets the module (i.e., -M is not "
        "required) if it is not already set" },
    { "modules", 'M', "MODULE,MODULE,..", 0, "Set modules that should be used "
        "(default: lcpi,hpctoolkit). Use a comma-separated list to specify "
        "multiple modules (e.g., -M hpctoolkit,macpo or --modules=hpctoolkit,"
        "macpo). This argument can also be defined multiple times. NOTICE: "
        "module order matters! See --measurement-order and --analysis-order" },
    { "compile-order", -1, "MODULE,MODULE,...", OPTION_HIDDEN, "Set the order "
      "in which compile modules should be called (1st defined, 1st called)" },
    { "measurement-order", -2, "MODULE,MODULE,...", 0, "Set the order in which "
      "measurement modules should be called (1st defined, 1st called). This "
      "option automatically sets the modules (i.e., -M is not required)" },
    { "analysis-order", -3, "MODULE,MODULE,...", 0, "Set the order in which "
      "analysis modules should be called (1st defined, 1st called). This "
      "option automatically sets the modules (i.e., -M is not required)" },
    { "module-help", -4, "MODULE|all", 0, "Show module options. Use 'all' to "
      "see options for all available module" },

    { 0, 0, 0, 0, "Output formating options:", 5 },
    { "colorful", 'c', 0, 0, "Enable ANSI colors" },
    { "verbose", 'v', "LEVEL", 0, "Enable verbose mode (range: 0-10)" },
    { "verbose-level", 'l', "LEVEL", OPTION_ALIAS,
        "Enable verbose mode (default: 5, range: 0-10)" },
    { "recommendations", 'r', "COUNT", 0,
        "Number of recommendations PerfExpert should provide (default: 3)" },

    { 0, 0, 0, 0, "Other options:", 6 },
    { "database", 'd', "FILE", 0, "Select a recommendation database file "
        "different from the default (I hope you know what you are doing)" },
    { "leave-garbage", 'g', 0, 0,
        "Do not remove temporary directory when finalize" },
    { "do-not-run", 'n', 0, 0, "Do not run PerfExpert, just parse the command "
        "line arguments and finalize (for debugging)" },
    { "only-experiments", 'e', 0, 0, "Tell PerfExpert to do not perform any "
        "analysis just take measurements and finalize (for manual analysis)" },

    { 0, 'h', 0, OPTION_HIDDEN, "Give a very short usage message" },
    { 0 }
};

static char args_doc[] = "THRESHOLD PROGRAM [PROGRAM ARGUMENTS]";
static char doc[] = "\nPerfExpert -- an easy-to-use automatic performance "
    "diagnosis and optimization\n              tool for HPC applications\n\n"
    "  THRESHOLD           Threshold (relevance % of runtime) to take hotspots "
    "into\n                      consideration (range: fraction value between 0"
    " and 1,\n                      translated to --module-option=lcpi,"
    "threshold=VALUE)\n"
    "  PROGRAM             Program (binary) to analyze (do not use shell "
    "scripts)\n"
    "  PROGRAM ARGUMENTS   Program arguments, see documentation if any argument"
    "\n                      starts with a dash sign ('-')";

typedef struct arg_options {
    char *modules;
    char *program;
    char **program_argv;
    char *program_argv_temp[MAX_ARGUMENTS_COUNT];
    int  do_not_run;
} arg_options_t;

/* Function declarations */
static int parse_env_vars(void);
static int load_module(char *module);
static int set_module_option(char *option);
static int set_module_order(char *option, module_phase_t order);
static error_t parse_options(int key, char *arg, struct argp_state *state);
static void module_help(const char *module);

#ifdef __cplusplus
}
#endif

#endif /* PERFEXPERT_OPTIONS_H_ */
