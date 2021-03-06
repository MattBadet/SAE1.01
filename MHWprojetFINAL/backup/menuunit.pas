//Unité des menus de bases (lancement du jeu, menu général, ville)
unit menuUnit;
{$codepage UTF8}
{$mode objfpc}{$H+}

interface

uses combatUnit, utilities, inventaire, cantine, forge, perso, affichagemenu;

procedure menuGeneral();
procedure ville(joueur : player; dormi : boolean);

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
      choixU := afficheInventaireChambre(joueur); //le joueur choisis l'objet qu'il veut équiper

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
        afficheDormir(dormi);

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
procedure marchand(joueur : player);

var
  choixU : integer;

begin
  choixU := afficheMarchand; //demande au joueur si il veut acheter ou vendre

  if choixU = 1 then //Le joueur veut acheter quequechose chez le marchand
  begin

    choixU := afficheAchat(joueur.materiaux[6]); //renvoie l'id de l'objet a acheter

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
              affichePasAssezArgent;
            end;
          end;
        end;
      end;
    end;
  end
  else //Le joueur veut vendre un objet
  begin

    choixU := afficheVente(joueur.materiaux[6]); //renvoie l'id de l'objet a vendre

    if choixU = 1 then
      begin
        deletecasque(casquecuire);
        joueur.materiaux[6] := joueur.materiaux[6] + 12;
      end
      else if choixU = 2 then
      begin
        deleteplastron(plastroncuire);
        joueur.materiaux[6] := joueur.materiaux[6] + 50;
      end;
      if choixU = 3 then
      begin
        deletejambiere(jambierecuire);
        joueur.materiaux[6] := joueur.materiaux[6] + 25;
      end;
      if choixU = 4 then
      begin
        deletebottes(bottescuire);
        joueur.materiaux[6] := joueur.materiaux[6] + 12;
      end;
      if choixU = 5 then
      begin
        deletecasque(casquefer);
        joueur.materiaux[6] := joueur.materiaux[6] + 50;
      end;
      if choixU = 6 then
      begin
        deleteplastron(plastronfer);
        joueur.materiaux[6] := joueur.materiaux[6] + 150;
      end;
      if choixU = 7 then
      begin
        deletejambiere(jambierefer);
        joueur.materiaux[6] := joueur.materiaux[6] + 100;
      end;
      if choixU = 8 then
      begin
        deletebottes(bottesfer);
        joueur.materiaux[6] := joueur.materiaux[6] + 50;
      end;
      if choixU = 9 then
      begin
        deletebouclier(bouclierfer);
        joueur.materiaux[6] := joueur.materiaux[6] + 75;
      end;
      if choixU = 10 then
      begin
        deletecasque(casqueacier);
        joueur.materiaux[6] := joueur.materiaux[6] + 75;
      end;
      if choixU = 11 then
      begin
        deleteplastron(plastronacier);
        joueur.materiaux[6] := joueur.materiaux[6] + 300;
      end;
      if choixU = 12 then
      begin
        deletejambiere(jambiereacier);
        joueur.materiaux[6] := joueur.materiaux[6] + 150;
      end;
      if choixU = 13 then
      begin
        deletebottes(bottesacier);
        joueur.materiaux[6] := joueur.materiaux[6] + 75;
      end;
      if choixU = 14 then
      begin
        deletebouclier(bouclieracier);
        joueur.materiaux[6] := joueur.materiaux[6] + 100;
      end;
      if choixU = 15 then
      begin
        deletecasque(casquescale);
        joueur.materiaux[6] := joueur.materiaux[6] + 125;
      end;
      if choixU = 16 then
      begin
        deleteplastron(plastronscale);
        joueur.materiaux[6] := joueur.materiaux[6] + 500;
      end;
      if choixU = 17 then
      begin
        deletejambiere(jambierescale);
        joueur.materiaux[6] := joueur.materiaux[6] + 250;
      end;
      if choixU = 18 then
      begin
        deletebottes(bottesscale);
        joueur.materiaux[6] := joueur.materiaux[6] + 125;
      end;
      if choixU = 19 then
      begin
        deletebouclier(bouclierscale);
        joueur.materiaux[6] := joueur.materiaux[6] + 175;
      end;
      if choixU = 20 then
      begin
        deleteepee(epeebois);
        joueur.materiaux[6] := joueur.materiaux[6] + 5;
      end;
      if choixU = 21 then
      begin
        deleteepee(epeefer);
        joueur.materiaux[6] := joueur.materiaux[6] + 75;
      end;
      if choixU = 22 then
      begin
        deleteepee(epeeacier);
        joueur.materiaux[6] := joueur.materiaux[6] + 150;
      end;
      if choixU = 23 then
      begin
        deleteepee(epeescale);
        joueur.materiaux[6] := joueur.materiaux[6] + 250;
      end;
      if choixU = 24 then
      begin
        deleteepee(epeedemo);
        joueur.materiaux[6] := joueur.materiaux[6] + 500;
      end;
  end;
end;

//Ville : choix entre les batiments et le combat
procedure ville(joueur : player; dormi : boolean);

var
  choixU : integer; //Le choix de l'utilisateur (qu'es-ce qu'il veut faire)
  rep : boolean;

begin
  rep := TRUE;
  while rep do
  begin
    choixU := afficheVille();

    if choixU = 5 then
    dormi := FALSE;

    case choixU of
    1 : chambre(joueur, dormi);
    2 : marchand(joueur);
    3 : cantineMenu(joueur);
    4 : forgeMenu(joueur);
    5 : combat(joueur);
    else rep := FALSE;
    end;
  end;

end;

//Lancement d'une nouvelle partie
procedure nouvellePartie();

var
  joueur : player; //record du joueur
  dormi : boolean; //boolean indiquant si le joueur a fait une chasse depuis sa
  info:array[1..3] of string;
begin
  dormi := FALSE;
  regles;
  info :=afficheCreationPerso;
  joueur := createjoueur(info[],info[],info[]);
  ville(joueur, dormi);
end;

//Menu principal du jeu
procedure menuGeneral();

var
  choixU : boolean;
  rep : boolean;

begin
  rep := TRUE;
  while rep do
    begin
    choixU := afficheMenuPrincipale; //TRUE pour jouer / FALSE pour quitter

    if choixU then
    nouvellePartie
    else
    rep := FALSE;
  end;

end;

end.
