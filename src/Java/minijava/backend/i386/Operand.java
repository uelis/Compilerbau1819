package minijava.backend.i386;

import minijava.intermediate.Temp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Function;

abstract class Operand {

  final static class Imm extends Operand {

    final int imm;

    Imm(Integer imm) {
      assert (imm != null);
      this.imm = imm;
    }

    @Override
    public String toString() {
      throw new UnsupportedOperationException("TODO");
    }

    @Override
    public Operand rename(Function<Temp, Temp> sigma) {
      return this;
    }
  }

  final static class Reg extends Operand {

    final Temp reg;

    Reg(Temp reg) {
      assert (reg != null);
      this.reg = reg;
    }

    @Override
    public String toString() {
      throw new UnsupportedOperationException("TODO");
    }

    @Override
    List<Temp> use() {
      return Collections.singletonList(reg);
    }

    @Override
    public Operand rename(Function<Temp, Temp> sigma) {
      return new Reg(sigma.apply(reg));
    }
  }

  final static class Mem extends Operand {

    final Temp base;  // maybe null
    final Integer scale; // null or 1, 2, 4 or 8;
    final Temp index;  // maybe null
    final int displacement;

    Mem(Temp base, Integer scale, Temp index, int displacement) {
      assert (scale == null || (scale == 1 || scale == 2 || scale == 4 || scale == 8));
      this.base = base;
      this.scale = scale;
      this.index = index;
      this.displacement = displacement;
    }

    Mem(Temp base) {
      this(base, null, null, 0);
    }

    @Override
    public String toString() {
      throw new UnsupportedOperationException("TODO");
    }

    @Override
    List<Temp> use() {
      List<Temp> use = new ArrayList<>(2);
      if (base != null) {
        use.add(base);
      }
      if (index != null) {
        use.add(index);
      }
      return use;
    }

    @Override
    public Operand rename(Function<Temp, Temp> sigma) {
      return new Mem(base != null ? sigma.apply(base) : null, scale,
              index != null ? sigma.apply(index) : null, displacement);
    }
  }

  List<Temp> use() {
    return Collections.emptyList();
  }

  abstract Operand rename(Function<Temp, Temp> sigma);
}
