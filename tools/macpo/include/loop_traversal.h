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

#ifndef	LOOP_TRAVERSAL_H_
#define	LOOP_TRAVERSAL_H_

#include "generic_defs.h"
#include "inst_defs.h"

class loop_traversal_t : public AstTopDownProcessing<attrib> {
    public:
        loop_traversal_t(VariableRenaming*& _var_renaming);

        loop_info_list_t& get_loop_info_list();
        virtual attrib evaluateInheritedAttribute(SgNode* node, attrib attr);

    private:
        SgForStatement* for_stmt;
        reference_list_t reference_list;
        loop_info_list_t loop_info_list;
        VariableRenaming* var_renaming;
};

#endif	/* LOOP_TRAVERSAL_H_ */
