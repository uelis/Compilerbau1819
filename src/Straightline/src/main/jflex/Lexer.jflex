/* Copyright (c) 1997 Andrew W. Appel.  Licensed software: see LICENSE file */

import java_cup.runtime.Symbol;

%%

%public
%class Lexer
%implements java_cup.runtime.Scanner
%function next_token
%type java_cup.runtime.Symbol
%yylexthrow ParseException

%char
%line
%column

%{

private void error(String s) throws ParseException {
  throw new ParseException("At line " + yyline + ", column " + yycolumn + ": " + s);
}

private Symbol symbol(int kind) {
    return new Symbol(kind, yyline, yycolumn);
}

private Symbol symbol(int kind, Object value) {
    return new Symbol(kind, yyline, yycolumn, value);
}

private int commentDepth = 0;

%}

%eofval{
  {
    if (commentDepth > 0) {
       error("runaway comment");
    }
    return symbol(Parser_sym.EOF);
  }
%eofval}

%state SingleLineComment MultiLineComment
idchars=[A-Za-z_0-9]
id=[A-Za-z]{idchars}*
ws=[\r\n\t\ ]+
%%
<YYINITIAL> {
   {ws}     { }
   ","      { return symbol(Parser_sym.COMMA); }
   ";"      { return symbol(Parser_sym.SEMICOLON); }
   "("      { return symbol(Parser_sym.LPAREN); }
   ")"      { return symbol(Parser_sym.RPAREN); }
   "+"      { return symbol(Parser_sym.PLUS); }
   "-"      { return symbol(Parser_sym.MINUS); }
   "*"      { return symbol(Parser_sym.TIMES); }
   "/"      { return symbol(Parser_sym.DIVIDE); }
   "="      { return symbol(Parser_sym.EQ); }
   "print"  { return symbol(Parser_sym.PRINT); }
   {id}     { return symbol(Parser_sym.IDENTIFIER, yytext()); }
   [0-9]+   { return symbol(Parser_sym.INT, Integer.parseInt(yytext())); }
   "/*"     { commentDepth = 1; yybegin(MultiLineComment); }
   "*/"     { error("unexpected */"); }
   "//"     { yybegin(SingleLineComment); }
   .        { error("illegal token"); }
}
<SingleLineComment> {
   [^\n]+   { /* ignore */ }
   \n       { yybegin(YYINITIAL); }
}
<MultiLineComment> {
    "/*"    { commentDepth++; }
    "*/"    { commentDepth--; if (commentDepth==0) yybegin(YYINITIAL); }
    [^]|\n  { }
}


