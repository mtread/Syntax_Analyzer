/* Author: Mackenzie Treadway
 * Date: 09-15-2025
 *
 * listing.h - Header file for error reporting and listing functions.
 */

#ifndef LISTING_H
#define LISTING_H

enum ErrorCategories {LEXICAL, SYNTAX, GENERAL};

void appendError(ErrorCategories category, const char* message);
void firstLine();
void lastLine();

#endif
