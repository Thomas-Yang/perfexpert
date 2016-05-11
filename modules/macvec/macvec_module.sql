--
-- Copyright (c) 2011-2016 University of Texas at Austin. All rights reserved.
--
-- $COPYRIGHT$
--
-- Additional copyrights may follow
--
-- This file is part of PerfExpert.
--
-- PerfExpert is free software: you can redistribute it and/or modify it under
-- the terms of the The University of Texas at Austin Research License
--
-- PerfExpert is distributed in the hope that it will be useful, but WITHOUT ANY
-- WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
-- A PARTICULAR PURPOSE.
--
-- Authors: Antonio Gomez-Iglesias, Leonardo Fialho and Ashay Rane
--
-- $HEADER$
--

--
-- Enable foreign keys
--
PRAGMA foreign_keys = ON;

--
-- Create table if not exist
--

CREATE TABLE IF NOT EXISTS macvec_rules (
  rule              INTEGER PRIMARY KEY,
  description       VARCHAR
);


CREATE TABLE IF NOT EXISTS macvec_analysis (
  id                INTEGER PRIMARY KEY,
  line              INTEGER,
  filename          VARCHAR,
  analysis          VARCHAR
);

INSERT INTO macvec_rules (rule, description) VALUES (15308, "Check if pointers overlap: If the compiler is unaware that pointers do not overlap in memory, the compiler dependence analysis may infer existence of vector dependence. If the pointers used in this loop body indeed do not overlap, declare them with the restrict keyword. For instance: double* restrict ptr_a;. See https://software.intel.com/en-us/articles/vectorization-with-the-intel-compilers-part-i for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15344, "Check if pointers overlap: If the compiler is unaware that pointers do not overlap in memory, the compiler dependence analysis may infer existence of vector dependence. If the pointers used in this loop body indeed do not overlap, declare them with the restrict keyword. For instance: double* restrict ptr_a;. See https://software.intel.com/en-us/articles/vectorization-with-the-intel-compilers-part-i for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15346, "Check if pointers overlap");

INSERT INTO macvec_rules (rule, description) VALUES (15315, "Inform compiler about loop trip count: The compiler vectorization cost model takes various factors into account, with the loop trip count being one among them. Informing the compiler about loop trip counts that cannot be statically inferred helps the compiler make better decisions about the vectorizability of the code. If loop trip count is known, add pragma loop_count(n) directive before the loop, where n is equal to the loop count. See https://software.intel.com/en-us/node/524502 for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15321, "Inform compiler about loop trip count: The compiler vectorization cost model takes various factors into account, with the loop trip count being one among them. Informing the compiler about loop trip counts that cannot be statically inferred helps the compiler make better decisions about the vectorizability of the code. If loop trip count is known, add pragma loop_count(n) directive before the loop, where n is equal to the loop count. See https://software.intel.com/en-us/node/524502 for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15335, "Inform compiler about loop trip count: The compiler vectorization cost model takes various factors into account, with the loop trip count being one among them. Informing the compiler about loop trip counts that cannot be statically inferred helps the compiler make better decisions about the vectorizability of the code. If loop trip count is known, add pragma loop_count(n) directive before the loop, where n is equal to the loop count. See https://software.intel.com/en-us/node/524502 for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15523, "Inform compiler about loop trip count: The compiler vectorization cost model takes various factors into account, with the loop trip count being one among them. Informing the compiler about loop trip counts that cannot be statically inferred helps the compiler make better decisions about the vectorizability of the code. If loop trip count is known, add pragma loop_count(n) directive before the loop, where n is equal to the loop count. See https://software.intel.com/en-us/node/524502 for additional details.");

INSERT INTO macvec_rules (rule, description) VALUES (15381, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15389, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15409, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15421, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15450, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15451, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15456, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15457, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15468, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15469, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15472, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15473, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");
INSERT INTO macvec_rules (rule, description) VALUES (15524, "Align memory references: Aligned memory accesses usually incur much lower penalty of access (when compared with unaligned acccesses), especially on the Intel Xeon Phi coprocessor. To align arrays and structures, use __attribute__((aligned(64))) for statically-allocated  memory and _mm_malloc() for dynamically allocated memory. See https://software.intel.com/en-us/articles/data-alignment-to-assist-vectorization for additional details.");

INSERT INTO macvec_rules (rule, description) VALUES (15336, "Indicate branch evaluations: Branches that evaluate to always true or always false can be indicated to the compiler to change code layout for optimization. Use the __builtin_expect() intrinsic function to indicate branch outcomes that are highly biased.");

INSERT INTO macvec_rules (rule, description) VALUES (15311, "Use limited types: Using mixed precision (single- as well as double-precision) values in a loop body introduces many inefficiences in vectorized code generation. The inefficiencies arise in choosing the appropriate alignment, converting intermediate results from one format to another and in estimating the cost of vectorization. If possible, convert all floating point values to use the same precision.");
INSERT INTO macvec_rules (rule, description) VALUES (15327, "Use limited types: Using mixed precision (single- as well as double-precision) values in a loop body introduces many inefficiences in vectorized code generation. The inefficiencies arise in choosing the appropriate alignment, converting intermediate results from one format to another and in estimating the cost of vectorization. If possible, convert all floating point values to use the same precision.");
INSERT INTO macvec_rules (rule, description) VALUES (15386, "Use limited types: Using mixed precision (single- as well as double-precision) values in a loop body introduces many inefficiences in vectorized code generation. The inefficiencies arise in choosing the appropriate alignment, converting intermediate results from one format to another and in estimating the cost of vectorization. If possible, convert all floating point values to use the same precision.");
INSERT INTO macvec_rules (rule, description) VALUES (15410, "Use limited types: Using mixed precision (single- as well as double-precision) values in a loop body introduces many inefficiences in vectorized code generation. The inefficiencies arise in choosing the appropriate alignment, converting intermediate results from one format to another and in estimating the cost of vectorization. If possible, convert all floating point values to use the same precision.");
INSERT INTO macvec_rules (rule, description) VALUES (15411, "Use limited types: Using mixed precision (single- as well as double-precision) values in a loop body introduces many inefficiences in vectorized code generation. The inefficiencies arise in choosing the appropriate alignment, converting intermediate results from one format to another and in estimating the cost of vectorization. If possible, convert all floating point values to use the same precision.");
INSERT INTO macvec_rules (rule, description) VALUES (15417, "Use limited types: Using mixed precision (single- as well as double-precision) values in a loop body introduces many inefficiences in vectorized code generation. The inefficiencies arise in choosing the appropriate alignment, converting intermediate results from one format to another and in estimating the cost of vectorization. If possible, convert all floating point values to use the same precision.");
INSERT INTO macvec_rules (rule, description) VALUES (15418, "Use limited types: Using mixed precision (single- as well as double-precision) values in a loop body introduces many inefficiences in vectorized code generation. The inefficiencies arise in choosing the appropriate alignment, converting intermediate results from one format to another and in estimating the cost of vectorization. If possible, convert all floating point values to use the same precision.");


INSERT INTO macvec_rules (rule, description) VALUES (15320, "Try and use unit strides: Strided accesses to array elements leads to cache and TLB misses. A unit stride (stride increment of 1) is not only cache and TLB friendly but also assists in vectorization. To enforce unit strides, check that the loop induction variable is incremented by one and that the loop induction variable is used to index into the last (innermost) dimension of the array.");
INSERT INTO macvec_rules (rule, description) VALUES (15452, "Try and use unit strides: Strided accesses to array elements leads to cache and TLB misses. A unit stride (stride increment of 1) is not only cache and TLB friendly but also assists in vectorization. To enforce unit strides, check that the loop induction variable is incremented by one and that the loop induction variable is used to index into the last (innermost) dimension of the array.");
INSERT INTO macvec_rules (rule, description) VALUES (15453, "Try and use unit strides: Strided accesses to array elements leads to cache and TLB misses. A unit stride (stride increment of 1) is not only cache and TLB friendly but also assists in vectorization. To enforce unit strides, check that the loop induction variable is incremented by one and that the loop induction variable is used to index into the last (innermost) dimension of the array.");
INSERT INTO macvec_rules (rule, description) VALUES (15460, "Try and use unit strides: Strided accesses to array elements leads to cache and TLB misses. A unit stride (stride increment of 1) is not only cache and TLB friendly but also assists in vectorization. To enforce unit strides, check that the loop induction variable is incremented by one and that the loop induction variable is used to index into the last (innermost) dimension of the array.");
INSERT INTO macvec_rules (rule, description) VALUES (15461, "Try and use unit strides: Strided accesses to array elements leads to cache and TLB misses. A unit stride (stride increment of 1) is not only cache and TLB friendly but also assists in vectorization. To enforce unit strides, check that the loop induction variable is incremented by one and that the loop induction variable is used to index into the last (innermost) dimension of the array.");

INSERT INTO macvec_rules (rule, description) VALUES (15415, "Try software prefetching: Gather and scatter accesses in vector instructions cause high penalty at execution time. If the code is being compiled for the Xeon Phi coprocessor, using software prefetching may help. See https://software.intel.com/sites/products/documentation/doclib/iss/2013/compiler/cpp-lin/GUID-3A086451-4C82-4BB1-B742-FF93EBF60DA3.htm for details.");
INSERT INTO macvec_rules (rule, description) VALUES (15416, "Try software prefetching: Gather and scatter accesses in vector instructions cause high penalty at execution time. If the code is being compiled for the Xeon Phi coprocessor, using software prefetching may help. See https://software.intel.com/sites/products/documentation/doclib/iss/2013/compiler/cpp-lin/GUID-3A086451-4C82-4BB1-B742-FF93EBF60DA3.htm for details.");
INSERT INTO macvec_rules (rule, description) VALUES (15458, "Try software prefetching: Gather and scatter accesses in vector instructions cause high penalty at execution time. If the code is being compiled for the Xeon Phi coprocessor, using software prefetching may help. See https://software.intel.com/sites/products/documentation/doclib/iss/2013/compiler/cpp-lin/GUID-3A086451-4C82-4BB1-B742-FF93EBF60DA3.htm for details.");
INSERT INTO macvec_rules (rule, description) VALUES (15459, "Try software prefetching: Gather and scatter accesses in vector instructions cause high penalty at execution time. If the code is being compiled for the Xeon Phi coprocessor, using software prefetching may help. See https://software.intel.com/sites/products/documentation/doclib/iss/2013/compiler/cpp-lin/GUID-3A086451-4C82-4BB1-B742-FF93EBF60DA3.htm for details.");
INSERT INTO macvec_rules (rule, description) VALUES (15462, "Try software prefetching: Gather and scatter accesses in vector instructions cause high penalty at execution time. If the code is being compiled for the Xeon Phi coprocessor, using software prefetching may help. See https://software.intel.com/sites/products/documentation/doclib/iss/2013/compiler/cpp-lin/GUID-3A086451-4C82-4BB1-B742-FF93EBF60DA3.htm for details.");
INSERT INTO macvec_rules (rule, description) VALUES (15463, "Try software prefetching: Gather and scatter accesses in vector instructions cause high penalty at execution time. If the code is being compiled for the Xeon Phi coprocessor, using software prefetching may help. See https://software.intel.com/sites/products/documentation/doclib/iss/2013/compiler/cpp-lin/GUID-3A086451-4C82-4BB1-B742-FF93EBF60DA3.htm for details.");
