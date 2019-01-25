program carrmagi;
{TP Carré magique
Enoncé : faire un programme qui affiche un carré magique, ce carré aura une dimension impaire, définit en constante.
On pourra ainsi changer de carré en changeant la constante.
Un carré magique est une table d'entier à 2 dimensions, dans toutes les colonnes, les lignes et diagonales ont la même somme.
Vous devez utiliser obligatoirement un tableau à 2 dimensions.

Principe :
-1er Le premier entier 1, se trouve au nord du milieu de la table.
-2ème On place les chiffres de façon croissante en allant au Nord-Est de la position courante une seule fois.
-3ème Si la place est déjà prise, on se déplace au Nord-Ouest, jusqu'à trouver cette place libre.
-4ème On s'arrête au carré de dimension (5x5),(7x7)
-5ème Le tableau est considéré comme sphérique. Si on arrive au-delà de la dernière colonne, on revient à la première colonne, idem pour les lignes.

3 Versions, un programme sans fonction et procédure.
Ensuite, codage sur pascal.
Ensuite, la V2 avec des fonctions et procédures.
Pour finir, la V3 pareil avec des types enregistrement.



ALGORITHME : Carré_Magique
//Version sans les fonctions et procédures.
//BUT : Faire un carré magique.
//ENTREE : Une dimension pour le carré magique (constante ici.)
//SORTIE : Le carré magique écrit.

CONST TAILLECARRE:=5
VAR i,j,k : ENTIER
Carremagique : tableau[1..TAILLECARRE,1..TAILLECARRE] 

DEBUT
	POUR i DE 1 A TAILLECARRE FAIRE
		POUR j DE 1 A TAILLE CARRE FAIRE
			Carremagique[i,j]<-0
		FINPOUR
	FINPOUR
	i<-(TAILLECARRE DIV 2)
	j<-(TAILLECARRE DIV 2 +1)
	Carremagique[i,j]<-1
	POUR k DE 1 A (TAILLECARRE*TAILLECARRE)– 1 FAIRE
		SI i=1 ALORS
			i<-TAILLECARRE
		SINON
			i<-i-1
		FINSI
		SI j=TAILLECARRE ALORS
			j<-1
		SINON
			j<-j+1
		FINSI
		TANTQUE Carremagique[i,j]<>0 FAIRE
			SI i=1 ALORS
				i<- TAILLECARRE
			SINON
				i<-i-1
			FINSI
			SI j=1 ALORS
				j<- TAILLECARRE
			SINON
				j<-j-1
			FINSI
		FINTANTQUE
		Carremagique [i,j]<-k+1
	FINPOUR
	POUR i DE 1 A TAILLECARRE FAIRE
		POUR j DE 1 A TAILLECARRE FAIRE
			ECRIRE Carremagique[i,j]
		FINPOUR
		//retour à la ligne.
	FINPOUR
FIN.



ALGORITHME : Carré_Magique
//Version avec les fonctions et procédures.
//BUT : Faire un carré magique.
//ENTREE : Une dimension pour le carré magique (constante ici.)
//SORTIE : Le carré magique écrit.

CONST TAILLECARRE=5
TYPE TABLECARRE = tableau[1..TAILLECARRE,1..TAILLECARRE] d’ENTIER

//Procédure d’écriture
Procédure ecrire(T:TABLECARRE)
VAR i,j: Entier
DEBUT
	POUR i DE 1 A TAILLECARRE FAIRE
		POUR j DE 1 A TAILLECARRE FAIRE
			SI T[i,j]<10 ALORS
				ECRIRE(' ',T[i,j],' ')
			SINON
				ECRIRE(' ',T[i,j])
			FINSI
		FINPOUR
		//Retour à la ligne.
	FINPOUR
FIN

//Fonction d'initialisation.

Fonction initialisation():TABLECARRE
VAR 	i,j : ENTIER
	T:TABLECARRE
DEBUT
	POUR i DE 1 A TAILLECARRE FAIRE
		POUR j DE 1 A TAILLECARRE FAIRE
			T[i,j]<-0
		FINPOUR
	FINPOUR
	Initialisation<-T
FIN


//Fonction de remplissage.

Fonction remplissage ():TABLECARRE
VAR 	i,j,k: ENTIER
	carremagique : TABLECARRE
DEBUT
	carremagique<-initialisation()

	i<-(TAILLECARRE DIV 2)
	j<-(TAILLECARRE DIV 2 +1)
	carremagique[i,j]<-1
	POUR k DE 1 A (TAILLECARRE*TAILLECARRE)-1 FAIRE
		i<-i-1
		j<-j+1
		SI j=(TAILLECARRE+1) ALORS
			j<-1
		FINSI
		SI i=0 ALORS
			i<-TAILLECARRE
		FINSI

		TANTQUE (carremagique[i,j]<>0) FAIRE
			i<-i-1
			j<-j-1
			SI j=0 ALORS
				J<-TAILLECARRE
			FINSI
			SI i=0 ALORS
				I<-TAILLECARRE
			FINSI
		FINTANTQUE
		carremagique[i,j]<-k+1
	FINPOUR
	remplissage<-carremagique
FIN

//Début du Programme
VAR carremagique: TABLECARRE

DEBUT
	ecrire(remplissage)
FIN.
}


//BUT : Faire un carré magique.
//ENTREE : Une dimension pour le carré magique (constante ici.)
//SORTIE : Le carré magique écrit.

uses crt;

CONST TAILLECARRE=5;
TYPE TABLECARRE = array[1..TAILLECARRE,1..TAILLECARRE] of integer;


//Procedure d'ecriture.

procedure ecrire(T:TABLECARRE);
VAR i,j:integer;
BEGIN
	FOR i:=1 to TAILLECARRE DO
	BEGIN
		FOR j:=1 to TAILLECARRE DO
		BEGIN
			IF T[i,j]<10 THEN
				write(' ',T[i,j],' ')
			ELSE
				write(' ',T[i,j]);
		END;
		writeln;
	END;
END;

//Fonction d'initialisation.

function initialisation():TABLECARRE;
VAR i,j:integer;
	T:TABLECARRE;
BEGIN
	FOR i:=1 to TAILLECARRE DO
	BEGIN
		FOR j:=1 to TAILLECARRE DO
		BEGIN
			T[i,j]:=0;
		END;
	END;
	initialisation:=T;
END;


//Fonction de remplissage.

function remplissage ():TABLECARRE;
var i,j,k:integer;
	carremagique : TABLECARRE;
BEGIN
	carremagique:=initialisation();

	i:=(TAILLECARRE DIV 2);
	j:=(TAILLECARRE DIV 2 +1);
	carremagique[i,j]:=1;
	FOR k:=1 TO (TAILLECARRE*TAILLECARRE)-1 DO
	BEGIN
		i:=i-1;
		j:=j+1;
		IF j=(TAILLECARRE+1) THEN
			j:=1;
		IF i=0 THEN
			i:=TAILLECARRE;

		WHILE carremagique[i,j]<>0 DO
		BEGIN
			i:=i-1;
			j:=j-1;
			IF j=0 THEN
				j:=TAILLECARRE;
			IF i=0 THEN
				i:=TAILLECARRE;
		END;
		carremagique[i,j]:=k+1;
	END;
	remplissage:=carremagique;
END;

//Début du Programme

BEGIN
	clrscr;

	ecrire(remplissage());
	
	readln;
END.