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

#include <rose.h>

#include <algorithm>

#include "inst_defs.h"
#include "ir_methods.h"
#include "loop_traversal.h"
#include "streams.h"

using namespace SageBuilder;
using namespace SageInterface;

loop_traversal_t::loop_traversal_t(const du_table_t& _def_table) :
        def_table(_def_table) {
    initial_node = NULL;
    deep_search = true;
}

loop_info_list_t& loop_traversal_t::get_loop_info_list() {
    return loop_info_list;
}

void loop_traversal_t::set_deep_search(bool _deep_search) {
    deep_search = _deep_search;
}

attrib loop_traversal_t::evaluateInheritedAttribute(SgNode* node, attrib attr) {
    if (initial_node == NULL) {
        initial_node = node;
    }

    ROSE_ASSERT(initial_node);

    if (ir_methods::is_loop(node)) {
        SgScopeStatement* scope_stmt = isSgScopeStatement(node);
        ROSE_ASSERT(scope_stmt);

        ir_methods::def_map_t def_map;
        SgExpression* idxv = NULL;
        SgExpression* init = NULL;
        SgExpression* test = NULL;
        SgExpression* incr = NULL;
        int incr_op = ir_methods::INVALID_OP;

        // Expand the iterator list into a map for easier lookup.
        ir_methods::construct_def_map(def_table, def_map);

        ir_methods::get_loop_header_components(scope_stmt, idxv, init, test,
                incr, incr_op, def_map);

        streams_t streams(deep_search);
        streams.traverse(node, attrib());
        reference_list_t& _ref_list = streams.get_reference_list();

        SgStatement* loop_body = NULL;
        if (SgForStatement* for_stmt = isSgForStatement(scope_stmt))
            loop_body = for_stmt->get_loop_body();
        else if (SgWhileStmt* while_stmt = isSgWhileStmt(scope_stmt))
            loop_body = while_stmt->get_body();
        else if (SgDoWhileStmt* do_while_stmt = isSgDoWhileStmt(scope_stmt))
            loop_body = do_while_stmt->get_body();

        loop_info_t loop_info = {0};
        loop_info.loop_stmt = scope_stmt;

        loop_info.idxv_expr = idxv;
        loop_info.init_expr = init;
        loop_info.test_expr = test;
        loop_info.incr_expr = incr;
        loop_info.incr_op = incr_op;
        loop_info.processed = false;
        loop_info.reference_list = _ref_list;

        // Process child loops, if any.
        loop_traversal_t inner_traversal(def_table);
        // Use the same deep_search flag as with the outer loop.
        inner_traversal.set_deep_search(deep_search);
        inner_traversal.traverse(loop_body, attrib());
        loop_info_list_t& child_list = inner_traversal.get_loop_info_list();
        loop_info.child_loop_info.push_back(child_list);

        if (ir_methods::is_loop(initial_node)) {
            if (initial_node != node) {
                // This is some other child node of the parent loop node.
                // Hence skip it.
                return attr;
            }
        } else {
            // initial_node is a function definition.
            // is `node' the top-level loop in the function?
            if (ir_methods::is_top_level_loop(node, initial_node) == false) {
                return attr;
            }
        }

        // Add this loop to the list only if
        // the above two conditions did not invalidate it.
        loop_info_list.push_back(loop_info);
    }

    return attr;
}
