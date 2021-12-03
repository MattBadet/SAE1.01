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
      choixU := afficheInventaireChambre(); //le joueur choisis l'objet qu'il veut équiper

      if choixU = 1 then
      begin
        equipercasque(joueur, casquecuire);
      end
      else if choixU = 2 then
      begin
        equiperplastron(joueur, plastroncuire);
      end;
      if choixU = 3 then
      begin
        equiperjambiere(joueur, jambierecuire);
      end;
      if choixU = 4 then
      begin
        equiperbottes(joueur, bottescuire);
      end;
      if choixU = 5 then
      begin
        equipercasque(joueur, casquefer);
      end;
      if choixU = 6 then
      begin
        equiperplastron(joueur, plastronfer);
      end;
      if choixU = 7 then
      begin
        equiperjambiere(joueur, jambierefer);
      end;
      if choixU = 8 then
      begin
        equiperbottes(joueur, bottesfer);
      end;
      if choixU = 9 then
      begin
        equiperbouclier(joueur, bouclierfer);
      end;
      if choixU = 10 then
      begin
        equipercasque(joueur, casqueacier);
      end;
      if choixU = 11 then
      begin
        equiperplastron(joueur, plastronacier);
      end;
      if choixU = 12 then
      begin
        equiperjambiere(joueur, jambiereacier);
      end;
      if choixU = 13 then
      begin
        equiperbottes(joueur, bottesacier);
      end;
      if choixU = 14 then
      begin
        equiperbouclier(joueur, bouclieracier);
      end;
      if choixU = 15 then
      begin
        equipercasque(joueur, casquescale);
      end;
      if choixU = 16 then
      begin
        equiperplastron(joueur, plastronscale);
      end;
      if choixU = 17 then
      begin
        equiperjambiere(joueur, jambierescale);
      end;
      if choixU = 18 then
      begin
        equiperbottes(joueur, bottesscale);
      end;
      if choixU = 19 then
      begin
        equiperbouclier(joueur, bouclierscale);
      end;
      if choixU = 20 then
      begin
        equiperepee(joueur, epeebois);
      end;
      if choixU = 21 then
      begin
        equiperepee(joueur, epeefer);
      end;
      if choixU = 22 then
      begin
        equiperepee(joueur, epeeacier);
      end;
      if choixU = 23 then
      begin
        equiperepee(joueur, epeescale);
      end;
      if choixU = 24 then
      begin
        equiperepee(joueur, epeedemo);
      end;
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

  if choixU = 1 then //Le joueur veut acheter quequechose chez le marchand
  begin
    if (choixU = 1) AND (joueur.materiaux[6] >= 50) then
    begin
      ajouterinvpotion(petitepotion);
      joueur.materiaux[6] := joueur.materiaux[6] - 50;
    end
    else
    begin
      if (choixU = 2) AND (joueur.materiaux[6] >= 150) then
      begin
        ajouterinvpotion(moyennepotion);
        joueur.materiaux[6] := joueur.materiaux[6] - 150;
      end
      else
      begin
        if (choixU = 3) AND (joueur.materiaux[6] >= 400) then
        begin
          ajouterinvpotion(grandepotion);
          joueur.materiaux[6] := joueur.materiaux[6] - 400;
        end
        else
        begin
          if (choixU = 4) AND (joueur.materiaux[6] >= 100) then
          begin
            ajouterinvbombe(bombepetite);
            joueur.materiaux[6] := joueur.materiaux[6] - 100;
          end
          else
          begin
            if (choixU = 5) AND (joueur.materiaux[6] >= 250) then
            begin
              ajouterinvbombe(bombemoyenne);
              joueur.materiaux[6] := joueur.materiaux[6] - 250;
            end
            else
            begin
              AffichagePasArgent;
            end;
          end;
        end;
      end;
    end;
  end
  else //Le joueur veut vendre un objet
  begin

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
  4 : forgeMenu(joueur);
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
