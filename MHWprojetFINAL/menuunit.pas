unit menuUnit;

{$mode objfpc}{$H+}

interface

uses combatUnit, utilities, inventaire, cantine, forge, perso, affichagemenu;

procedure menuGeneral();

implementation

//chambre : inventaire de perso et repos
procedure chambre(joueur : player; dormi : boolean);

var
  choixU : integer; //Choix du joueur dans le menu
  rep : boolean; //Répète le menu tant que le joueur ne décide pas de quitter

begin
  rep := TRUE;

  while rep do
  begin
    choixU := afficheChambre(); //Récupération du choix de l'utilisateur

    if (choixU = 1) then //Le joueur ouvre l'inventaire
    begin
      afficheInventairePerso();
    end
    else
    begin
      if (choixU = 2) then//le joueur va dormir
      begin
        litAffichage(dormi);

        if dormi = FALSE then
        begin
          dormi := TRUE;

          joueur.vieActu := joueur.vieActu + (joueur.def div 5); //regen du perso
          if (joueur.vieActu > joueur.def) then //si la regen fait dépasser sa vie max, on le remet à sa vie max
          joueur.vieActu := joueur.def;
        end;
      end // if (choixU = 2)
      else
      begin // Le joueur veut quitter
        rep := FALSE;
      end;
    end; //if (choixU = 1) then
  end; //while rep do

end;

//marchand : achat d'objets
procedure marchand();

var
  choixU : integer;

begin
  choixU := afficheMarchand;

  case choixU of
  1:ajouterinvpotion(petitepotion);
  2:ajouterinvpotion(moyennepotion);
  3:ajouterinvpotion(grandepotion);
  4:ajouterinvbombe(bombepetite);
  5:ajouterinvbombe(bombemoyenne);
  end;

end;

//Ville : choix entre les batiments et le combat
procedure ville(joueur : player; dormi : boolean);

var
  choixU : integer; //Le choix de l'utilisateur (qu'es-ce qu'il veut faire)

begin
  choixU := afficheVille();

  if choixU = 5 then
  dormi := FALSE;

  case choixU of
  1 : chambre(joueur, dormi);
  2 : marchand();
  3 : cantineMenu(joueur);
  4 : forgeMenu();
  5 : combat(joueur);
  else menuGeneral();
  end;

end;

//Lancement d'une nouvelle partie
procedure nouvellePartie();

var
  joueur : player; //record du joueur
  dormi : boolean; //boolean indiquant si le joueur a fait une chasse depuis sa

begin
  dormi := FALSE;
  regles;
  joueur := afficheCreationPerso();
  ville(joueur, dormi);
end;

//Menu principal du jeu
procedure menuGeneral();

var
  choixU : boolean;

begin
  choixU := afficheMenuPrincipal; //TRUE pour jouer / FALSE pour quitter

  if choixU then
  nouvellePartie;
end;

end.
