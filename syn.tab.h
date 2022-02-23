/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CONST = 258,
     CONST_R = 259,
     CONST_string = 260,
     CONST_char = 261,
     mc_float = 262,
     mc_char = 263,
     mc_str = 264,
     mc_const = 265,
     vg = 266,
     pvg = 267,
     sqo = 268,
     sqf = 269,
     dq = 270,
     aff = 271,
     po = 272,
     pf = 273,
     sep = 274,
     point = 275,
     mc_idenDiv = 276,
     mc_pgm_id = 277,
     mc_datadiv = 278,
     mc_wss = 279,
     mc_procDiv = 280,
     mc_stop = 281,
     mc_accept = 282,
     mc_dis = 283,
     mc_move = 284,
     mc_to = 285,
     mc_if = 286,
     mc_else = 287,
     mc_end = 288,
     mc_int = 289,
     AND = 290,
     OR = 291,
     NOT = 292,
     G = 293,
     L = 294,
     GE = 295,
     LE = 296,
     EQ = 297,
     DI = 298,
     sup = 299,
     dp = 300,
     dqo = 301,
     dqf = 302,
     LINE = 303,
     SIZE = 304,
     READ = 305,
     plus = 306,
     moins = 307,
     etoile = 308,
     divi = 309,
     diez = 310,
     excla = 311,
     arob = 312,
     dollar = 313,
     ecom = 314,
     IDF = 315
   };
#endif
/* Tokens.  */
#define CONST 258
#define CONST_R 259
#define CONST_string 260
#define CONST_char 261
#define mc_float 262
#define mc_char 263
#define mc_str 264
#define mc_const 265
#define vg 266
#define pvg 267
#define sqo 268
#define sqf 269
#define dq 270
#define aff 271
#define po 272
#define pf 273
#define sep 274
#define point 275
#define mc_idenDiv 276
#define mc_pgm_id 277
#define mc_datadiv 278
#define mc_wss 279
#define mc_procDiv 280
#define mc_stop 281
#define mc_accept 282
#define mc_dis 283
#define mc_move 284
#define mc_to 285
#define mc_if 286
#define mc_else 287
#define mc_end 288
#define mc_int 289
#define AND 290
#define OR 291
#define NOT 292
#define G 293
#define L 294
#define GE 295
#define LE 296
#define EQ 297
#define DI 298
#define sup 299
#define dp 300
#define dqo 301
#define dqf 302
#define LINE 303
#define SIZE 304
#define READ 305
#define plus 306
#define moins 307
#define etoile 308
#define divi 309
#define diez 310
#define excla 311
#define arob 312
#define dollar 313
#define ecom 314
#define IDF 315




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 22 "syn.y"
{
        int entier;
        float reel;
        char ch; 
        char* str;
}
/* Line 1529 of yacc.c.  */
#line 176 "syn.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

