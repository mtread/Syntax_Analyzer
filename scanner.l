/* Author: Mackenzie Treadway
 * Date: 09-15-2025
 *
 * scanner.l - The lexical analyzer (scanner) using Flex.
 * This file defines how to break input into tokens for the parser.
 */

%{
#include "parser.tab.h"
#include "listing.h"
%}

digit      [0-9]
letter     [A-Za-z]
whitespace [ \t\n]

%%

"function"   { return FUNCTION; }
"returns"    { return RETURNS; }
"begin"      { return BEGIN_; }
"end"        { return END; }
"if"         { return IF; }
"then"       { return THEN; }
"elsif"      { return ELSIF; }
"else"       { return ELSE; }
"endif"      { return ENDIF; }
"switch"     { return SWITCH; }
"case"       { return CASE; }
"others"     { return OTHERS; }
"endswitch"  { return ENDSWITCH; }
"when"       { return WHEN; }
"list"       { return LIST; }
"of"         { return OF; }
"fold"       { return FOLD; }
"left"       { return LEFT; }
"right"      { return RIGHT; }
"endfold"    { return ENDFOLD; }
"is"         { return IS; }

{letter}({letter}|{digit})*   { return IDENTIFIER; }
{digit}+                       { return INT_LITERAL; }
{digit}*"."{digit}+([eE][-+]?{digit}+)? { return REAL_LITERAL; }
\'([^\\\n]|(\\.))\'           { return CHAR_LITERAL; }

"+"  { return ADDOP; }
"-"  { return SUBOP; }
"*"  { return MULOP; }
"/"  { return DIVOP; }
"%"  { return REMOP; }
"^"  { return EXPOP; }
"~"  { return NEGOP; }
"<"  { return LESS; }
"<=" { return LESSEQ; }
">"  { return GREATER; }
">=" { return GREATEREQ; }
"="  { return EQUAL; }
"<>" { return NOTEQUAL; }
"&"  { return ANDOP; }
"|"  { return OROP; }
"!"  { return NOTOP; }
","  { return COMMA; }
":"  { return COLON; }
";"  { return SEMICOLON; }
"("  { return LPAREN; }
")"  { return RPAREN; }

{whitespace}  { /* Ignore spaces and newlines */ }

. { appendError(LEXICAL, yytext); }

%%

int yywrap() { return 1; }
