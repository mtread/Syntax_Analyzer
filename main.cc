/* Author: Mackenzie Treadway
 * Date: 09-15-2025
 *
 * main.cc - The main entry point for the compiler.
 * In plain English: this file starts the parser and runs the program.
 */

#include <iostream>
#include "listing.h"

extern int yyparse();

int main() {
    firstLine();     // Print a start message
    yyparse();       // Call the parser
    lastLine();      // Print a finish message
    return 0;
}
