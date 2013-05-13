
#ifndef	MINST_H_
#define	MINST_H_

#include "generic_defs.h"

class MINST : public AstTopDownProcessing<attrib>
{
	short lang;
	short action;
	int line_number;
	std::string inst_func;

	SgBasicBlock* bb;
	SgGlobal* global_node;
	SgFunctionDeclaration *fdecl;

	public:
		MINST(short _lang, short _action, int _line_number, std::string _inst_func)
		{
			lang=_lang, action=_action, line_number=_line_number, inst_func=_inst_func;
		}

		void insert_map_function(SgNode* node);
		void insert_map_prototype(SgNode* node);

		virtual void atTraversalEnd();
		virtual void atTraversalStart();

		virtual attrib evaluateInheritedAttribute(SgNode* node, attrib attr);
};

#endif	/* MINST_H_ */
