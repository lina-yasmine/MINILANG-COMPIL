%{ 
#include "syn.tab.h"
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"T.h"
extern int nb_ligne; 
extern int nb_col;
extern YYSTYPE yyval ;
%}
lMAJ    [A-Z]
lmin    [a-z]
chiffre [0-9]
chiffrenonNUL [1-9]
IDF     {lMAJ}({lmin}|{chiffre})* 
INTEGER    {chiffre}+|"("("-"){chiffre}+")"
FLOAT 0|(0|{chiffrenonNUL}{chiffre}*)"\."{chiffre}+|"("[-+](0|{chiffrenonNUL}{chiffre}*)"."{chiffre}+")"
CHAR \'.\'
const_str \"[^\"]+\"
saut \n
comtr #(([^(!\n)]|\n)*!\n|(.*?)*!\n)
%%
"+"          { 
                printf("plus reconnue \n"); nb_col += strlen(yytext);           
                rechercher (yytext,"plus","","", 2); nb_col += strlen(yytext);
                return plus ;
             }
"-"          { 
                printf("moins reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"moins","","", 2); nb_col += strlen(yytext);     
                return moins ;
             }
"*"          {  
                printf("etoile reconnue \n"); nb_col += strlen(yytext); 
                rechercher (yytext,"etoile","","", 2); nb_col += strlen(yytext);
                return etoile ; 
             }
"/"          {  
                printf("div reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"divi","","", 2); nb_col += strlen(yytext);
                return divi ; 
             }             
"@"          {  
                printf("arobase reconnue \n"); nb_col += strlen(yytext); 
                rechercher (yytext,"arob","","", 2); nb_col += strlen(yytext);
                return arob ;
             }
"#"          {  
                printf("diez reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"diez","","", 2); nb_col += strlen(yytext);
                return diez ; 
             }
"$"          { 
                printf("dollar reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"dollar","","", 2); nb_col += strlen(yytext);
                return dollar ;
             }
"&"          {  
                printf("e commercial reconnue \n"); nb_col += strlen(yytext); 
                rechercher (yytext,"ecom","","", 2); nb_col += strlen(yytext);  
                return ecom ; 
             }
"!"          {  
                printf("point d'exclamation reconnue \n"); nb_col += strlen(yytext); 
                rechercher (yytext,"excla","","", 2); nb_col += strlen(yytext);
                return excla; 
             }
","          {    
                printf("virgule reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"vg","","", 2); nb_col += strlen(yytext);
                return vg ; 
             }
"."          { 
                printf("point reconnue \n"); nb_col += strlen(yytext); 
                rechercher (yytext,"point","","", 2); nb_col += strlen(yytext);
                return point ;
             }
":"          { 
                printf("double point reconnue \n"); nb_col += strlen(yytext); 
                rechercher (yytext,"dp","","", 2); nb_col += strlen(yytext);
                return dp ; 
             }
";"          { 
                printf("point virgule reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"pvg","","", 2); nb_col += strlen(yytext);
                return pvg ; 
             }
"‘"          {  
                printf("single-quote ouvrante reconnue \n"); nb_col += strlen(yytext);  
                rechercher (yytext,"sqo","","", 2); nb_col += strlen(yytext);
                return sqo ;
             }
"’"          {  
                printf("single-quote fermante reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"sqf","","", 2); nb_col += strlen(yytext);
                return sqf ;  
             }
"\""         {  
                printf("doubl-quote reconnue \n"); nb_col += strlen(yytext); 
                rechercher (yytext,"dq","","", 2); nb_col += strlen(yytext);
                return dq ; 
             }
"“"          { 
                printf("double-quote ouvrante reconnue \n"); nb_col += strlen(yytext); 
                rechercher (yytext,"dqo","","", 2); nb_col += strlen(yytext);
                return dqo ; 
             }
"”"          {  
                printf("double-quote fermante reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"dqf","","", 2); nb_col += strlen(yytext);
                return dqf ;
             }
"="         {  
                printf("affectation reconnue \n"); nb_col += strlen(yytext); 
                rechercher (yytext,"aff","","", 2); nb_col += strlen(yytext);
                return aff;
             }
"("          { 
                printf(" parenthèse ouvrante reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"po","","", 2); nb_col += strlen(yytext);
                return po ;
             }
")"          {  
                printf(" parenthèse fermante reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"pf","","", 2); nb_col += strlen(yytext);
                return pf; 
             }
"|"          {  
                printf(" séparateur de variables reconnue \n"); nb_col += strlen(yytext);
                rechercher (yytext,"sep","","", 2); nb_col += strlen(yytext);
                return sep ;
             }
"IDENTIFICATION DIVISION"  { 
                             printf("Mc_idenDiv reconnue \n"); nb_col += strlen(yytext);
                             rechercher (yytext,"mc_idenDiv","","", 1); nb_col += strlen(yytext);
                             return mc_idenDiv;
                           }
"PROGRAM-ID"                { 
                              printf("Mc_Pgm-id reconnue \n"); nb_col += strlen(yytext);
                              rechercher (yytext,"mc_pgm_id"," ","", 1); nb_col += strlen(yytext);
                              return mc_pgm_id ; 
                            }
"DATA DIVISION"            { 
                             printf("Mc_datadiv reconnue \n"); nb_col += strlen(yytext);
                             rechercher (yytext,"mc_datadiv"," ","", 1); nb_col += strlen(yytext);
                             return mc_datadiv; 
                            }
"WORKING-STORAGE SECTION"  { 
                             printf("Mc_wss reconnue \n"); nb_col += strlen(yytext);
                             rechercher (yytext,"mc_wss"," ","", 1); nb_col += strlen(yytext);
                             return mc_wss ;
                            }
"PROCEDURE DIVISION"       { 
                             printf("Mc_ProcDiv reconnue \n"); nb_col += strlen(yytext);
                             rechercher (yytext,"mc_procDiv"," ","", 1); nb_col += strlen(yytext);
                             return mc_procDiv;
                            }
"STOP RUN"                 { 
                             printf("Mc_STOP_RUN reconnue \n"); nb_col += strlen(yytext); 
                             rechercher (yytext,"mc_stop"," ","", 1); nb_col += strlen(yytext);
                             return mc_stop ;
                           }
ACCEPT      { 
              printf("Mc_ACCEPT reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_accept"," ","", 1); nb_col += strlen(yytext);
              return mc_accept; 
            }
DISPLAY     { 
              printf("Mc_DISPLAY reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_dis"," ","", 1); nb_col += strlen(yytext);
              return mc_dis ; 
            }
MOVE        { 
              printf("Mc_MOVE reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_move"," ","", 1); nb_col += strlen(yytext);
              return mc_move ; 
            }
TO          {
              printf("Mc_TO reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_to"," ","", 1); nb_col += strlen(yytext);
              return mc_to ;
            }
IF          {
              printf("Mc_IF reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_if"," ","", 1); nb_col += strlen(yytext);
              return mc_if ;
            }
ELSE        { 
              printf("Mc_ELSE reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_else"," ","", 1); nb_col += strlen(yytext);
              return mc_else ;  
            }
END         { 
              printf("Mc_END reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_end"," ","", 1); nb_col += strlen(yytext);
              return mc_end ;   
            }
INTEGER     { 
              printf("Mc_INTEGER reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_int"," ","", 1); nb_col += strlen(yytext);
              return mc_int ;   
            }
FLOAT       { 
              printf("Mc_FLOAT reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_float"," ","", 1); nb_col += strlen(yytext);
              return mc_float ; }
CHAR        {
              printf("Mc_CHAR reconnue \n"); nb_col += strlen(yytext);  
              rechercher (yytext,"mc_char"," ","", 1); nb_col += strlen(yytext);
              return mc_char ;  
            }
STRING      { 
              printf("Mc_STRING reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_str"," ","", 1); nb_col += strlen(yytext);
              return mc_str ;   
            }
CONST       { 
              printf("Mc_CONST reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"mc_const"," ","", 1); nb_col += strlen(yytext);
              return mc_const;  
            }
AND         { 
              printf("Mc_AND reconnue \n"); nb_col += strlen(yytext); 
              rechercher (yytext,"AND"," ","", 1); nb_col += strlen(yytext);
              return AND ;  
            }
OR          { 
              printf("Mc_OR reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"OR"," ","", 1); nb_col += strlen(yytext);
              return OR ;    
            }
NOT         { 
              printf("Mc_NOT reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"NOT"," ","", 1); nb_col += strlen(yytext);
              return NOT ;
            }
G           { 
              printf("Mc_G reconnue \n"); nb_col += strlen(yytext); 
              rechercher (yytext,"G"," ","", 1); nb_col += strlen(yytext);
              return G ;     
            }
L           { 
              printf("Mc_L reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"L"," ","", 1); nb_col += strlen(yytext);
              return L ;
            }
GE          { 
              printf("Mc_GE reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"GE"," ","", 1); nb_col += strlen(yytext);
              return GE ;    
            }
LE          { 
              printf("Mc_LE reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"LE"," ","", 1); nb_col += strlen(yytext);
              return LE ;
            } 
EQ          { 
              printf("Mc_EQ reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"EQ"," ","", 1); nb_col += strlen(yytext);
              return EQ ;
            }
DI          { 
              printf("Mc_DI reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"DI"," ","", 1); nb_col += strlen(yytext);
              return DI ;
            }
LINE        { 
              printf("Mc_LINE reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"LINE"," ","", 1); nb_col += strlen(yytext);
              return LINE ;  
            }
SIZE        { 
              printf("Mc_SIZE reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"SIZE"," ","", 1); nb_col += strlen(yytext);
              return SIZE ; 
            }
READ        { 
              printf("Mc_READ reconnue \n"); nb_col += strlen(yytext);
              rechercher (yytext,"READ"," ","", 1); nb_col += strlen(yytext);
              return READ ;
            }
{CHAR}      { 
              printf("caractère reconnue \n"); nb_col += strlen(yytext);
              yylval.ch=strdup(yytext); 
              rechercher (yytext,"CONST_char","mc_char","", 0); nb_col += strlen(yytext);
              return CONST_char ; 
            }
{const_str} { 
              printf("Chaine de caractère reconnue \n"); nb_col += strlen(yytext); 
              yylval.str=strdup(yytext);
              rechercher (yytext,"CONST_string","mc_str","", 0); nb_col += strlen(yytext);
              return CONST_string ;
            }
{INTEGER}   {
              printf("CONST reconnue \n"); nb_col += strlen(yytext); 
              yylval.entier=atoi(yytext);
              rechercher (yytext,"CONST","mc_int",(yytext), 0); nb_col += strlen(yytext);
              return CONST ; 
            }
{FLOAT}     { 
              printf("CONST réelle reconnue \n"); nb_col += strlen(yytext); 
              yylval.reel=atof(yytext);
              rechercher (yytext,"CONST_R","mc_float",(yytext), 0); nb_col += strlen(yytext);
              return  CONST_R ;
            }
{IDF}       { 
              printf("IDF reconnue \n"); nb_col += strlen(yytext); if (strlen(yytext)>8) printf("erreur , la taille de l'idf dépasse la taille maximale "); 
              yylval.str=strdup(yytext);
              rechercher (yytext,"IDF","","", 0); nb_col += strlen(yytext);
              return IDF ; 
            } 
{comtr}     { printf("commentaire reconnue \n"); nb_col += strlen(yytext);
                {
                      int i;
                      for(i=0;i<strlen(yytext);i++) 
                      {
                           if(yytext[i] =='\n' ) 
                           {    nb_ligne++;
                                nb_col = 1;
                            }
                            nb_col++;
                      }
                } 
            } 
[ \t]    nb_col += strlen(yytext); 
{saut}   nb_ligne=nb_ligne+1; nb_col =1;
. { printf("Erreur lexicale au niveau de la ligne Num %d colonne %d \n", nb_ligne,nb_col); } 
%%
