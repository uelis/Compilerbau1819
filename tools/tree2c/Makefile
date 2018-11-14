TARGET = tree2c

GHC = ghc
GHC_OPTS =

$(TARGET) : Tree.hs Cmm.hs Lex.hs Main.hs Names.hs Parse.hs Tokens.hs
	$(GHC) $(GHC_OPTS) -o $@ --make Main.hs

all: $(TARGET)

lexer: $(filter-out Main%,$(filter-out Pars%,$(OBJS)))
		$(GHC) $(GHC_OPTS) -o $@ $^

%.hs:	%.y
	happy -iGRM.LOG $<

%.hs:	%.x
	alex $<

%.o:	%.hs
	$(GHC) $(GHC_OPTS) -c -o $@ $<

clean:
	@rm -f *.o *.hi Lex.hs Parse.hs GRM.LOG $(TARGET)
# EOF
