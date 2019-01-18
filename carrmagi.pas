program carrmagi;
//TP Carré magique
//Enoncé : faire un programme qui affiche un carré magique, ce carré aura une dimension impaire, définit en constante.
//On pourra ainsi changer de carré en changeant la constante.
//Un carré magique est une table d'entier à 2 dimensions, dans toutes les colonnes, les lignes et diagonales ont la même somme.
//Vous devez utiliser obligatoirement un tableau à 2 dimensions.

//Principe :
//-1er Le premier entier 1, se trouve au nord du milieu de la table.
//-2ème On place les chiffres de façon croissante en allant au Nord-Est de la position courante une seule fois.
//-3ème Si la place est déjà prise, on se déplace au Nord-Ouest, jusqu'à trouver cette place libre.
//-4ème On s'arrête au carré de dimension (5x5),(7x7)
//-5ème Le tableau est considéré comme sphérique. Si on arrive au-delà de la dernière colonne, on revient à la première colonne, idem pour les lignes.

// 3 Versions, un programme sans fonction et procédure.
// Ensuite, codage sur pascal.
// Ensuite, la V2 avec des fonctions et procédures.
// Pour finir, la V3 pareil avec des types enregistrement.


//BUT : Faire un carré magique.
//ENTREE : Une dimension pour le carré magique (constante ici.)
//SORTIE : Le carré magique écrit.

uses crt;

CONST TAILLECARRE=5;
VAR i,j,k :integer;
carremagique: array[1..TAILLECARRE,1..TAILLECARRE] of integer;


BEGIN
	clrscr;
	FOR i:=1 to TAILLECARRE DO
	BEGIN
		FOR j:=1 to TAILLECARRE DO
		BEGIN
			carremagique[i,j]:=0;
		END;
	END;
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

		WHILE Carremagique[i,j]<>0 DO
		BEGIN
			i:=i-1;
			j:=j-1;
			IF j=0 THEN
				j:=TAILLECARRE;
			IF i=0 THEN
				i:=TAILLECARRE;
		END;

		Carremagique[i,j]:=k+1;
		
	END;

	FOR i:=1 to TAILLECARRE DO
	BEGIN
		FOR j:=1 to TAILLECARRE DO
		BEGIN
			IF Carremagique[i,j]<10 THEN
				write(' ',Carremagique[i,j],' ')
			ELSE
				write(' ',Carremagique[i,j]);
		END;
		writeln;
	END;
	readln;
END.
