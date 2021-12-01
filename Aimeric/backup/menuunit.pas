unit menuUnit;

{$mode objfpc}{$H+}

interface

uses combatUnit, utilities, inventaire, cantine, forge, perso;

procedure menuGeneral();

implementation

//chambre : inventaire de perso et repos
procedure chambre(joueur : perso; dormi : boolean);

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
      inventairePerso();
    end
    else
    begin
      if (choixU = 2)//le joueur va dormir
      begin
        litAffichage(dormi);

        if dormi = FALSE then
        begin
          dormi := TRUE;

          vieActu.joueur := vieActu.joueur + (vieMax.joueur div 5); //regen du perso
          if (vieActu.joueur > vieMax.joueur) then //si la regen fait dépasser sa vie max, on le remet à sa vie max
          vieActu.joueur := vieMax.joueur;
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
  1:ajouterinvobjet(petitepotion);
  2:ajouterinvobjet(moyennepotion);
  3:ajouterinvobjet(grandepotion);
  4:ajouterinvobjet(bombepetite);
  5:ajouterinvobjet(bombemoyenne);
  end;

end;

//Ville : choix entre les batiments et le combat
procedure ville(joueur : perso; dormi : boolean);

var
  choixU : integer; //Le choix de l'utilisateur (qu'es-ce qu'il veut faire)

begin
  choixU := afficheVille();

  if choixU = 5 then
  dormi := FALSE;

  case choixU of
  1 : chambre(joueur, dormi);
  2 : marchand(joueur);
  3 : cantine(joueur));
  4 : forge(joueur);
  5 : combat(joueur);
  else menuGeneral();
  end;

end;

//Lancement d'une nouvelle partie
procedure nouvellePartie();

var
  joueur : personnage; //record du joueur
  dormi : boolean; //boolean indiquant si le joueur a fait une chasse depuis sa

begin
  dormi := FALSE;
  regles();
  joueur := afficheCreationPerso();
  ville(joueur, dormi);
end;

//Menu principal du jeu
procedure menuGeneral();

var
  choixU : boolean;

begin
  choixU := menuGeneralAffichage; //TRUE pour jouer / FALSE pour quitter

  if choixU then
  nouvellePartie;
end;

end.
