%{
    //BOUKANTAR LINA YASMINE 
    //BELACHAR LAMIA 
#include<stdio.h>
#include<string.h>
#include<stdlib.h> 

int nb_ligne=1;
int nb_col=1;
char sauvType[20];
char sauvidf[20];
int i = 0 ;
int n;
int yylex();
void initialisation();
void afficher();
int yyerror(char* msg);
int doubleDeclaration(char entite[]) ;
void insererTYPE();

%}
%union {
        int entier;
        float reel;
        char ch; 
        char* str;
}
%token <entier> CONST <reel> CONST_R <str> CONST_string <ch> CONST_char 
%token <str> mc_float <str> mc_char <str> mc_str <str> mc_const 
%token vg pvg sqo sqf dq aff po pf sep point
%token mc_idenDiv mc_pgm_id mc_datadiv mc_wss  
%token mc_procDiv mc_stop mc_accept mc_dis
%token mc_move mc_to mc_if mc_else mc_end mc_int 
%token AND OR NOT G L GE LE EQ DI sup dp dqo dqf
%token LINE SIZE READ plus moins etoile divi 
%token diez excla arob dollar ecom <str> IDF

// Les prioritées 
%left          OR                
%left          AND         
%left     G GE EQ DI LE L                  
%left     plus moins           
%left     etoile divi  


%start S
%%
// l'axiome
S: mc_idenDiv point mc_pgm_id point IDF point mc_datadiv point mc_wss point DECLARATION mc_procDiv point INSTRUCTION mc_stop point {printf("programme syntaxiquement correcte \n"); YYACCEPT;}
;

// toutes les déclarations
DECLARATION:  DEC DECLARATION 
             |D_TAB DECLARATION
             |D_CST DECLARATION
             | ;

// declaration d'un tableau
D_TAB : IDF LINE CONST vg SIZE CONST TYPE point 
{   if (($3<0)||($6<1)) 
printf (" Erreur semantique : Taille du tableau ou borne inferieure négative, ligne %d, colonne %d \n",nb_ligne,nb_col);
                                        }
;
// declaration d'une constante 
D_CST:  mc_const IDF aff CONSTANTE point {
            if(doubleDeclaration($2) == -1)
            printf("Erreur semantique, line %d, colonne %d : double declaration d'une constante.\n", nb_ligne, nb_col);
            else insererTYPE($2,sauvType);
        };
        | mc_const IDF TYPE point {
            if(doubleDeclaration($2) == -1)
            printf("Erreur semantique, line %d, colonne %d : double declaration d'une constante.\n", nb_ligne, nb_col);
            else insererTYPE($2,sauvType);
        }; ;
// declaration de variable
DEC : LIST_DEC TYPE point 
LIST_DEC : IDF sep LIST_DEC  {
          if(doubleDeclaration($1) == -1)
            printf("Erreur semantique, line %d, colonne %d : double declaration d'une variable.\n", nb_ligne, nb_col);
            else insererTYPE($1,sauvType);
        } 
         | IDF {
            if(doubleDeclaration($1) == -1)
            printf("Erreur semantique, line %d, colonne %d : double declaration d'une variable.\n", nb_ligne, nb_col);
            else insererTYPE($1,sauvType);
        };
// les types
TYPE: mc_int {strcpy(sauvType,"entier");} 
    | mc_float {strcpy(sauvType,"reel");} 
    | mc_char {strcpy(sauvType,"ch");} 
    | mc_str {strcpy(sauvType,"str");} ;
;
// les variables
CONSTANTE : CONST
          | CONST_R
          | CONST_char
          | CONST_string
;
// opérateurs arithmétique sans la division , pour traiter le cas de division par 0 apart 
OPA : plus
    | moins
    | etoile
;
//opérateurs logique
OPL : OR
    | AND
;
//opérateurs de comparaision
OPC : G
    | GE 
    | L
    | LE
    | DI
    | EQ
;
// expression 
EXP : OPERATION|OPER_AR ; 
VALEUR :  CONSTANTE| IDF ;
// les opérateurs 
OPERATEURS : OPL | OPC ;

 // boucle des opérations
OPERATIONS : OPERATION point OPERATEURS point OPERATIONS
               | OPERATION
;
 // les opérations de comparaision et logique
OPERATION : po EXP point OPERATEURS point EXP pf
           | po NOT EXP pf ;

  // la division 
division : VALEUR divi CONST { if ($3==0) {printf("Erreur semantique, line %d, colonne %d : Division sur zéro \n\n", nb_ligne, nb_col);exit(-1);};}
         | VALEUR divi CONST_R { if ($3==0.0) {printf("Erreur semantique, line %d, colonne %d : Division sur zéro \n\n", nb_ligne, nb_col);exit(-1);};}
 ;         
 // les opérations arithmétique
OPER_AR : VALEUR OPA OPER_AR| division|  VALEUR ; 

// partie instructions
INSTRUCTION:  AFFECTATION INSTRUCTION
            | ACC INSTRUCTION 
            | DISP INSTRUCTION
            | BOUCLE INSTRUCTION
            | OPERATIONS INSTRUCTION
            | OPER_AR INSTRUCTION
            | CONDITION INSTRUCTION
            | ;
// l'entrée
ACC: mc_accept po dqo SF dqf dp arob IDF pf point ;

// la sortie
DISP : mc_dis po CONST_string dp IDF pf point ; 
// condition 
CONDITION : mc_if OPERATIONS dp INSTRUCTION mc_end
          | mc_if OPERATIONS dp INSTRUCTION mc_else dp INSTRUCTION mc_end ;
// les signes de formatages
SF : diez 
   |excla 
   |arob 
   |dollar 
   |ecom ;
// les affectations
AFFECTATION: IDF aff IDF point { if(doubleDeclaration($1) == 0)
            printf("Erreur semantique, line %d, colonne %d : variable non declaree.\n\n", nb_ligne, nb_col);
            }
           | IDF aff CONSTANTE point {if(doubleDeclaration($1) == 0)
            printf("Erreur semantique, line %d, colonne %d : variable non declaree.\n\n", nb_ligne, nb_col);
            insererTYPE($1,sauvType);
            };
//la boucle 
BOUCLE: mc_move IDF mc_to IDF INSTRUCTION mc_end 
      | mc_move IDF mc_to CONST INSTRUCTION mc_end
      | mc_move CONST mc_to CONST INSTRUCTION mc_end ;
%%
int main ()
{
initialisation();
yyparse();
afficher();
return 0;
}
int yywrap()
{return 0;}
int yyerror (char *msg ) { 
        printf ("Erreur syntaxique, ligne %d, colonne %d \n",nb_ligne,nb_col); 
        return 1; }
