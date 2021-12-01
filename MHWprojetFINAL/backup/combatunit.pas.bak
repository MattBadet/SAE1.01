unit combatUnit;

{$mode objfpc}{$H+}

interface

uses utilities, inventaire, cantine, forge, perso;

type
  race = (normal,dragon,demon);
  monstre = packed record
    id: integer;
    vieBase: integer;
    spe: race;
  end;

function combat(joueur : player): player;
function calculLvl(joueur: personnage): integer;h

implementation

//calcul du lvl du joueur en fonction de son xp
function calculLvl(joueur: personnage): integer;

begin
  if (joueur.xp < 100) then
  result := 1;
  if (joueur.xp => 100) AND (joueur.xp < 300) then
  result := 2;
  if (joueur.xp => 300) AND (joueur.xp < 500) then
  result := 3;
  if (joueur.xp => 500) AND (joueur.xp < 800) then
  result := 4;
  if (joueur.xp => 800) AND (joueur.xp < 1200) then
  result := 5;
  if (joueur.xp => 1200) AND (joueur.xp < 1700) then
  result := 6;
  if (joueur.xp => 1700) AND (joueur.xp < 2300) then
  result := 7;
  if (joueur.xp => 2300) AND (joueur.xp < 3000) then
  result := 8;
  if (joueur.xp => 3000) AND (joueur.xp < 4000) then
  result := 9;
  if (joueur.xp > 4000) then
  result := 10;
end;

//donne le bon monstre en fonction de son id
function choixMonstre(nb : integer): monstre;

const
  griffon: monstre = (
    id:1;
    vieBase:100;
    spe:normal;
  );
  dragonDesMontagnes: monstre = (
    id:2;
    vieBase:150;
    spe:dragon;
  );
  dragonElectrique : monstre = (
    id:3;
    vieBase:200;
    spe:dragon;
  );
  phoenix: monstre = (
    id:4;
    vieBase:250;
    spe:demon;
  );

begin
  case nb of
  1:result := griffon;
  2:result := dragonDesMontagnes;
  3:result := dragonElectrique;
  4:result := phoenix;
  end;
end;

//mort du personnage
function loose(joueur : personnage): personnage;

begin
  joueur.vieActu := (joueur.vieBase div 5);
  result := joueur;
  afficheDeadMenu;
end;

//génération des drop en cas de victoire
function generDrop(joueur : personnage; monstreActu : monstre; vieMi : integer): personnage;

begin
  //génération xp
  joueur.xp := joueur.xp + (vieMi div 10);

  roll := random(10) + 1;
    //génération cuivre
    if (roll <= 5) then
    joueur.materiaux[1] := joueur.materiaux[1] + 2;
    if (roll = 6) OR (roll = 7) then
    joueur.materiaux[1] := joueur.materiaux[1] + 1;
    if (roll = 8) then
    joueur.materiaux[1] := joueur.materiaux[1] + 3;

  roll := random(10) + 1;
    //génération morceau demon
    if (roll = 1) AND (monstre.spe = demon) AND (calculLvl(joueur.xp) >= 5) then
    joueur.materiaux[5] := joueur.materiaux[5] + 1;

  roll := random(20) + 1;
    //génération fer
    if roll <= 6 then
    joueur.materiaux[2] := joueur.materiaux[2] + 2;
    if roll = 7 OR roll = 8 then
    joueur.materiaux[2] := joueur.materiaux[2] + 1;
    if roll = 9 then
    joueur.materiaux[2] := joueur.materiaux[2] + 3;

  roll := random(20) + 1;
    //génération acier
    if (calculLvl(joueur.xp) >= 3) then
    begin
      if roll <= 4 then
      joueur.materiaux[3] := joueur.materiaux[3] + 2;
      if roll = 5 OR roll = 6 then
      joueur.materiaux[3] := joueur.materiaux[3] + 1;
      if roll = 7 then
      joueur.materiaux[3] := joueur.materiaux[3] + 3;
    end;

  roll := random(20) + 1;
    //génération ecailles
    if (monstre.spe = dragon) AND (calculLvl(joueur.xp) >= 5) then
    begin
      if roll <= 2 then
      joueur.materiaux[4] := joueur.materiaux[4] + 2;
      if roll = 3 then
      joueur.materiaux[4] := joueur.materiaux[4] + 1;
    end;

  //génération or
  joueur.materiaux[6] := joueur.materiaux[6] + (vieMi div 10);
end;

//le joueur gagne le combat
function win(joueur : personnage; monstreActu : monstre; vieMi : integer): personnage;

var
  roll : integer;

begin
  afficheVictoire;
  result := generDrop(joueur, monstreActu, vieMi);
end;

//Tour du joueur
function tourJ(vieMd, arme : integer): integer;

var
  dU, reussite, idObjet : integer; //dU = dégats du joueur ; reussite = echec ou critique
  choixA, rep : boolean; //choixA = choix de l'utilisateur lors de son tour entre attaquer et aller dans son inventaire

begin
  rep := TRUE;

  while rep do
  begin
    rep := FALSE;
    choixA := menuCombat; //le joueur attaque ou va dans son inventaire

    if (choixA = TRUE) then //si le joueur décide d'attaquer
    begin
      dU := (random(arme div 2) + (arme div 2)); //calcul des dégats que le joueur inflige au monstre
      reussite := random(100);

      if ((reussite >= 20) AND (reussite <= 90)) then //Coup normal
      begin
        vieMd := vieMd - dU; //le monstre perd des pv
      end
      else if (reussite > 90) then //critique
      begin
        vieMd := vieMd - (dU * 2); //le monstre perd des pv
      end
    end
    else //le joueur ouvre son inventaire
    begin
      idObjet := afficheInventaire();
      if (idObjet = 0) do
      rep := TRUE;
      else
      UtiliserObjet(idObjet);
    end; //if (choixA = TRUE) then
    result := vieMd;
  end; //rep si joueur décide de simplement regarder son inventaire
end;

//Tour du monstre
function tourM(vieMi, vieMd, vieU : integer): integer;

var
  dM, reussite : integer; //dM = dégats du monstre ; reussite = echec ou critique

begin
  dM := random(((vieMi + vieMd) div 2) div 7); //calcul des dégats que le monstre inglige au joueur
  reussite := random(100);

  if ((reussite >= 20) AND (reussite <= 90)) then //Le coup rate
  begin
    vieU := vieU - dM; //le monstre perd des pv
  end
  else if (reussite > 90) then
  begin
    vieU := vieU - (dM * 2); //le monstre perd des pv
  end;

  result := vieU;
end;

//Logique du combat. Retourne le record du joueur
function combat(joueur: personnage): personnage;

var
  vieMi, vieMd : integer; //vieMd = vie du monstre actuel ; vieMi = vie du monstre initial
  monstreActu : monstre;

begin
  randomize;
  vieU := joueur.defGlobal;
  monstreActu := choixMonstre((random(4)+1)); //choix aléatoire du monstre
  vieMi := ((monstreActu.vieBase * joueur.lvl)div 2);
  vieMd := vieMi;
  arme := joueur.atkGlobal;


  afficheCombat(monstreActu);

  if (vieU > vieMd) then //si le joeur a plus de vie que le monstre il commence
  vieMd := tourJ(vieMd, arme);
  attaqueU(vieMd, vieMi, vieU, joueur.defGlobal); //affichage de l'attaque

  while (vieU > 0) AND (vieMd > 0) do // tant qu'aucun des deux n'est mort, le combat continue
  begin
    vieU := tourM(vieMi, vieMd, vieU); //Tour du monstre
    attaqueU(vieMd, vieMi, vieU, joueur.defGlobal); //affichage de l'attaque

    if (vieU > 0) then //si le joueur n'a pas encore perdu
    vieMd := tourJ(vieMd, arme); //Tour du joueur
    attaqueU(vieMd, vieMi, vieU, joueur.defGlobal); //affichage de l'attaque

  end; //while (vieU > 0) AND (vieM > 0) do

  if (vieU > 0) then
  joueur := win(joueur, monstreActu, vieMi)
  else
  joueur := loose(joueur);

  result := joueur;
end;

end.
