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

#ifndef COMMON_H_
#define COMMON_H_

#define	STRING_LENGTH	256
#define	STREAM_LENGTH	256

enum { MSG_TERMINAL=0, MSG_STREAM_INFO, MSG_MEM_INFO, MSG_METADATA };
enum { TYPE_UNKNOWN=0, TYPE_READ, TYPE_WRITE, TYPE_READ_AND_WRITE };

typedef struct {
	unsigned short read_write:2;
	size_t address;
	unsigned long var_idx;
	int line_number;
} mem_info_t;

typedef struct {
	char binary_name[STRING_LENGTH];
	short day, month, year, hour, min, sec;
} metadata_info_t;

typedef struct {
	char stream_name[STREAM_LENGTH];
} stream_info_t;

typedef struct node {
	unsigned short coreID;
	unsigned short type_message;
	union {
		mem_info_t mem_info;
		stream_info_t stream_info;
		metadata_info_t metadata_info;
	};
} node_t;

#endif
