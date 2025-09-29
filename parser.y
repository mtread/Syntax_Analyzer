/* Author: Mackenzie Treadway
 * Date: 09-15-2025
 *
 * parser.y - Bison grammar rules for the compiler front end.
 * This file defines the syntax structure of the language.
 */

%{
#include <stdio.h>
#include "listing.h"
int yylex();
void yyerror(const char* message);
%}

%token FUNCTION RETURNS BEGIN_ END IF THEN ELSIF ELSE ENDIF
%token SWITCH CASE OTHERS ENDSWITCH WHEN LIST OF FOLD LEFT RIGHT ENDFOLD IS
%token IDENTIFIER INT_LITERAL REAL_LITERAL CHAR_LITERAL
%token ADDOP SUBOP MULOP DIVOP REMOP EXPOP NEGOP
%token LESS LESSEQ GREATER GREATEREQ EQUAL NOTEQUAL
%token ANDOP OROP NOTOP COMMA COLON SEMICOLON LPAREN RPAREN

%%

program
    : function
    ;

function
    : FUNCTION IDENTIFIER RETURNS IDENTIFIER BEGIN_ statement END
    ;

statement
    : expression SEMICOLON
    | IF expression THEN statement_list ENDIF
    | SWITCH expression CASE expression COLON statement ENDSWITCH
    | WHEN expression COMMA expression COLON expression
    ;

statement_list
    : statement
    | statement_list statement
    ;

expression
    : IDENTIFIER
    | INT_LITERAL
    | REAL_LITERAL
    | CHAR_LITERAL
    | expression ADDOP expression
    | expression SUBOP expression
    | expression MULOP expression
    | expression DIVOP expression
    ;

%%

void yyerror(const char* message) {
    appendError(SYNTAX, message);
}
