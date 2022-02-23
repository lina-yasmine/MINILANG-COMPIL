#include <stdio.h>
#include <stdlib.h>
#include<string.h>

typedef struct
{
   int state;
   char name[200];
   char code[200];
   char type[200];
   char val[200];
 } var_cst;

typedef struct
{ 
   int state; 
   char name[200];
   char type[30];
} MC_sep;


var_cst tab1[1000];
MC_sep tab2[200],tab3[200];
extern char sav[20];


void initialisation()
{
  int i;
  for (i=0;i<1000;i++)  tab1[i].state=0;
  
  

  for (i=0;i<200;i++)
    {tab2[i].state=0;
    tab3[i].state=0;}

}


void inserer (char entite[], char code[],char type[],char val[],int i, int choice)
{
  switch (choice)
 { 
   case 0:
       tab1[i].state=1;
       strcpy(tab1[i].name,entite);
       strcpy(tab1[i].code,code);
	   strcpy(tab1[i].type,type);
	   strcpy(tab1[i].val,val);
	   break;

   case 1:
       tab3[i].state=1;
       strcpy(tab3[i].name,entite);
       strcpy(tab3[i].type,code);
       break; 
    
   case 2:
      tab2[i].state=1;
      strcpy(tab2[i].name,entite);
      strcpy(tab2[i].type,code);
      break;
 }


}


void rechercher (char entite[], char code[],char type[],char val[],int choice)	
{

int j,i;

switch(choice) 
  {
   case 0:
        for (i=0;((i<1000)&&(tab1[i].state==1))&&(strcmp(entite,tab1[i].name)!=0);i++); 
        if((i<1000)&&(strcmp(entite,tab1[i].name)!=0))
        { 
	        
			inserer(entite,code,type,val,i,0); 
	      
         }
        //else
          //printf("entite existe deja!\n");
        break;

   case 1:
       
       for (i=0;((i<200)&&(tab3[i].state==1))&&(strcmp(entite,tab1[i].name)!=0);i++); 
        if(i<200)
          inserer(entite,code,type,val,i,1);
        //else
          //printf("entite existe deja!\n");
        break; 
    
   case 2:
         for (i=0;((i<200)&&(tab2[i].state==1))&&(strcmp(entite,tab1[i].name)!=0);i++); 
        if(i<200)
         inserer(entite,code,type,val,i,2);
        //else
   	       //printf("entite existe deja!\n");
        break;

    case 3:
        for (i=0;((i<1000)&&(tab1[i].state==1))&&(strcmp(entite,tab1[i].name)!=0);i++); 
                  
        if (i<1000)
        { inserer(entite,code,type,val,i,0); }
        //else
          //printf("entite existe deja!\n");
        break;
  }

}

int Recherche_position(char entite[])
{
		int i=0;
		while(i<1000)
		{
		
		if(tab1[i].state==1) if (strcmp(entite,tab1[i].name)==0) return i;	
		i++;
		}
 
		return -1;
		
}

char* recherche_val(char entite[])
{
 int x=Recherche_position(entite);
 if(x==-1) {printf("Entite n'existe pas dans la TS\n"); return "";}

 return tab1[x].val;

}

float recheche_val(char entite[])
{
 int x=Recherche_position(entite);
 if(x==-1) {printf("Entite n'existe pas dans la TS\n"); return -1;}

 return atof(tab1[x].val);

}


void modifier_val(char entite[],char val[])
{
 int x=Recherche_position(entite);
 if(x==-1) printf("Entite n'existe pas dans la TS\n");

 else strcpy(tab1[x].val,val);

}



int verifIDF(char entite[])
{
 int x=Recherche_position(entite);
 if(x==-1) {printf("Entite n'existe pas dans la TS\n"); return -1;}
 else if ((strcmp(tab1[x].code,"IdfCst")==0) && (strcmp(tab1[x].val,"")!=0) ) return 1;
return 0;
}

	 void insererTYPE(char entite[], char type[])
{
     int pos;
	   pos=Recherche_position(entite);
	   if(pos!=-1)  { strcpy(tab1[pos].type,type);
                     //printf("Insersion type: entite = %s type = %s\n",tab1[pos].name,tab1[pos].type);
                     }
}

void insererCODE(char entite[])
{
     int pos;
	   pos=Recherche_position(entite);
	   if(pos!=-1)  { strcpy(tab1[pos].code,"IdfCst");
                     }
}



int  nbSIGNE (char chaine[], char (*types)[9])
{
  int nb=0,i;

  for (i=0 ; i<strlen(chaine); i++ ) {
    if (chaine[i]=='%') {strcpy(types[nb],"CHAR."); nb++;}
    if (chaine[i]=='#') {strcpy(types[nb],"FLOAT."); nb++;}
    if (chaine[i]=='&') {strcpy(types[nb],"INTEGER."); nb++;}
    if (chaine[i]=='$') {strcpy(types[nb],"STRING."); nb++;}
    
    }
  
  return nb;
}



char * TypeEntite(char entite[])
	{
	int pos;
	
  pos=Recherche_position(entite);

  return tab1[pos].type;

}  
	
	int doubleDeclaration(char entite[])
	{
	int pos;
	pos=Recherche_position(entite);
	if(strcmp(tab1[pos].type,"")==0) return 0;
	   else return -1;
	  
  }
	
 void majType(char (*noms)[9],char t[],int n)
  {
    int j;
    //printf("Je suis dans la TS 1: n = %d type = %s\n",n,t);
    for(j=0;j<n;j++)
    {
      insererTYPE(noms[j],t);
      
    }
	}

void afficher()
{int i;

printf("\n\n\t\t\t/*************** Table des symboles des IDF & CST *************/\n\n");
printf("_________________________________________________________________________________________\n");
printf("\t|           Nom_Entite         |   Code_Entite    | Type_Entite | Val_Entite\n");
printf("__________________________________________________________________________________________\n");
  
for(i=0;i<1000;i++)
{	
	
    if(tab1[i].state==1)
      { 
        printf("\t|          %10s           |%15s | %12s | %12s\n",tab1[i].name,tab1[i].code,tab1[i].type,tab1[i].val);
         
      }
}

 
printf("\n\n\t\t\t/*************** Table des symboles des  mots cle *************/\n\n");

printf("_______________________________________________________\n");
printf("\t| \t \t NomEntite | \t CodeEntite\n");
printf("_______________________________________________________\n");
  
for(i=0;i<200;i++)
    if(tab3[i].state==1)
      { 
        printf("\t|%25s |\t%12s\n",tab3[i].name,tab3[i].type);
               
      }

printf("\n\n\t\t\t/*************** Table des symboles des separateurs *************/\n\n");

printf("__________________________________________________________\n");
printf("\t|         NomEntite         |      CodeEntite      \t \n");
printf("___________________________________________________________\n");
  
for(i=0;i<200;i++)
    if(tab2[i].state==1)
      { 
        printf("\t|         %10s         | %12s \t \n",tab2[i].name,tab2[i].type );
        
      }

}

