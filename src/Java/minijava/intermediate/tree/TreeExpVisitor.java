package minijava.intermediate.tree;

public interface TreeExpVisitor<A> {

  A visit(TreeExpConst expCONST);

  A visit(TreeExpName expNAME);

  A visit(TreeExpTemp expTEMP);

  A visit(TreeExpParam expPARAM);

  A visit(TreeExpMem expMEM);

  A visit(TreeExpBinOp expOP);

  A visit(TreeExpCall expCALL);

  A visit(TreeExpESeq expESEQ);
}
