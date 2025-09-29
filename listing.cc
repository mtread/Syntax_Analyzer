/* Author: Mackenzie Treadway
 * Date: 09-15-2025
 *
 * listing.cc - Implements error and listing functions.
 * In plain terms: this file helps display errors and program start/finish messages.
 */

#include <iostream>
#include "listing.h"
using namespace std;

void appendError(ErrorCategories category, const char* message) {
    switch (category) {
        case LEXICAL: cout << "Lexical Error: "; break;
        case SYNTAX: cout << "Syntax Error: "; break;
        case GENERAL: cout << "Error: "; break;
    }
    cout << message << endl;
}

void firstLine() {
    cout << "Compilation started." << endl;
}

void lastLine() {
    cout << "Compilation finished." << endl;
}
