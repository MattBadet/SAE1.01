//unité contenant tout le code logique demandé pour le combat
unit combatUnit;
{$codepage UTF8}
{$mode objfpc}{$H+}

interface

uses utilities, inventaire, perso, affichagemenu;

type
  race = (normal,dragon,demon);
  monstre = packed record
    id: integer;
    vieBase: integer;
    spe: race;
  end;

function combat(): player;
function calculLvl(joueur: player): integer;

implementation

//calcul du lvl du joueur en fonction de son xp
function calculLvl(joueur: player): integer;

begin
  if (joueur.xp < 100) then
  result := 1;
  if (joueur.xp >= 100) AND (joueur.xp < 300) then
  result := 2;
  if (joueur.xp >= 300) AND (joueur.xp < 500) then
  result := 3;
  if (joueur.xp >= 500) AND (joueur.xp < 800) then
  result := 4;
  if (joueur.xp >= 800) AND (joueur.xp < 1200) then
  result := 5;
  if (joueur.xp >= 1200) AND (joueur.xp < 1700) then
  result := 6;
  if (joueur.xp >= 1700) AND (joueur.xp < 2300) then
  result := 7;
  if (joueur.xp >= 2300) AND (joueur.xp < 3000) then
  result := 8;
  if (joueur.xp >= 3000) AND (joueur.xp < 4000) then
  result := 9;
  if (joueur.xp > 4000) then
  result := 10;
end;

//donne le bon monstre en fonction de son id
function choixMonstre(nb : integer): monstre;

const
  griffon: monstre = (
    id:1;
    vieBase:50;
    spe:normal;
  );
  dragonDesMontagnes: monstre = (
    id:2;
    vieBase:100;
    spe:dragon;
  );
  dragonElectrique : monstre = (
    id:3;
    vieBase:150;
    spe:dragon;
  );
  phoenix: monstre = (
    id:4;
    vieBase:200;
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
function loose(joueur : player): player;

begin
  joueur.vieActu := (joueur.def div 5);
  result := joueur;
  afficheDeadMenu;
end;

//génération des drop en cas de victoire
function generDrop(joueur : player; monstreActu : monstre; vieMi : integer): player;

var
  roll : integer;

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
    if (roll = 1) AND (monstreActu.spe = demon) AND (calculLvl(joueur) >= 5) then
    joueur.materiaux[5] := joueur.materiaux[5] + 1;

  roll := random(20) + 1;
    //génération fer
    if roll <= 6 then
    joueur.materiaux[2] := joueur.materiaux[2] + 2;
    if (roll = 7) OR (roll = 8) then
    joueur.materiaux[2] := joueur.materiaux[2] + 1;
    if roll = 9 then
    joueur.materiaux[2] := joueur.materiaux[2] + 3;

  roll := random(20) + 1;
    //génération acier
    if (calculLvl(joueur) >= 3) then
    begin
      if roll <= 4 then
      joueur.materiaux[3] := joueur.materiaux[3] + 2;
      if (roll = 5) OR (roll = 6) then
      joueur.materiaux[3] := joueur.materiaux[3] + 1;
      if roll = 7 then
      joueur.materiaux[3] := joueur.materiaux[3] + 3;
    end;

  roll := random(20) + 1;
    //génération ecailles
    if (monstreActu.spe = dragon) AND (calculLvl(joueur) >= 5) then
    begin
      if roll <= 2 then
      joueur.materiaux[4] := joueur.materiaux[4] + 2;
      if roll = 3 then
      joueur.materiaux[4] := joueur.materiaux[4] + 1;
    end;

  //génération or
  joueur.materiaux[6] := joueur.materiaux[6] + (vieMi div 10);

  result := joueur;
end;

//le joueur gagne le combat
function win(joueur : player; monstreActu : monstre; vieMi : integer): player;

var
  roll : integer;

begin
  afficheVictoire;
  result := generDrop(joueur, monstreActu, vieMi);
end;

//Utilisation d'objet pendant le combat
procedure inventaireCombat(joueur : player;vieJ, vieMaxJ, vieM : integer);

var
  id : integer;

begin
  id := afficheInventaireCombat(joueur);

  if id = 1 then
  begin
  deletebombe(bombepetite);
  vieM := vieM - bombepetite.degat;
  end;
  if id = 2 then
  begin
  deletebombe(bombemoyenne);
  vieM := vieM - bombemoyenne.degat;
  end;
  if id = 3 then
  begin
  deletepotion(petitepotion);
  vieJ := vieJ + round(vieMaxJ div 10);
  end;
  if id = 4 then
  begin
  deletepotion(moyennepotion);
  vieJ := vieJ + round(vieMaxJ div 5);
  end;
  if id = 5 then
  begin
  deletepotion(grandepotion);
  vieJ := vieJ + round(vieMaxJ div 3);
  end;
end;

//Tour du joueur
function tourJ(vieMd, arme, vieU, vieMi : integer;joueur : player;monstreActu : monstre): integer;

var
  dU, reussite, idObjet : integer; //dU = dégats du joueur ; reussite = echec ou critique
  choixA : boolean; //choixA = choix de l'utilisateur lors de son tour entre attaquer et aller dans son inventaire

begin
  choixA := afficheMenuCombat; //le joueur attaque ou va dans son inventaire

  if (choixA = TRUE) then //si le joueur décide d'attaquer
  begin
    dU := (random(arme div 2) + (arme div 2)); //calcul des dégats que le joueur inflige au monstre
    reussite := random(100);

    if joueur.epee.material = 'reste' then //si l'épée est démoniaque, plus de chance de critique
    begin
      if ((reussite >= 20) AND (reussite <= 75)) then //Coup normal
      begin
        vieMd := vieMd - dU; //le monstre perd des pv
      end
      else if (reussite > 75) then //critique
      begin
        vieMd := vieMd - (dU * 2); //le monstre perd des pv
      end
    end
    else
    begin
      if ((reussite >= 20) AND (reussite <= 90)) then //Coup normal
      begin
        vieMd := vieMd - dU; //le monstre perd des pv
      end
      else if (reussite > 90) then //critique
      begin
        vieMd := vieMd - (dU * 2); //le monstre perd des pv
      end
    end;
  end
  else //le joueur ouvre son inventaire
  begin
    inventaireCombat(joueur, vieU, joueur.def, vieMd);
  end; //if (choixA = TRUE) then
  afficheCombat(monstreActu.id);
  afficheMajVie(vieMd, vieMi, vieU, joueur.def);
  result := vieMd;
end;

//Tour du monstre
function tourM(vieMi, vieMd, vieU : integer): integer;

var
  dM, reussite : integer; //dM = dégats du monstre ; reussite = echec ou critique

begin
  dM := random((((vieMi + vieMd) div 2) div 7) + ((((vieMi + vieMd) div 2) div 7) div 2)); //calcul des dégats que le monstre inglige au joueur
  reussite := random(100);

  if ((reussite >= 20) AND (reussite <= 90)) then //Le coup rate pas
  begin
    vieU := vieU - dM; //le monstre perd des pv
  end
  else if (reussite > 90) then //le coup est critique
  begin
    vieU := vieU - (dM * 2); //le monstre perd des pv
  end;

  result := vieU;
end;

//Tour du boss
function tourBoss(vieMi, vieMd, vieU : integer): integer;

var
  dM, reussite : integer; //dM = dégats du monstre ; reussite = echec ou critique

begin
  dM := random(round((((vieMi + vieMd) div 2) div 7) + ((((vieMi + vieMd) div 2) div 7) div 2) * 1.2)); //calcul des dégats que le monstre inglige au joueur
  reussite := random(100);

  if ((reussite >= 10) AND (reussite <= 80)) then //Le coup rate pas
  begin
    vieU := vieU - dM; //le monstre perd des pv
  end
  else if (reussite > 80) then //le coup est critique
  begin
    vieU := vieU - (dM * 2); //le monstre perd des pv
  end;

  result := vieU;
end;

//Logique du combat de base. Retourne le record du joueur
function combatMonstre(joueur: player): player;

var
  vieU, vieMi, vieMd, arme : integer; //vieMd = vie du monstre actuel ; vieMi = vie du monstre initial
  monstreActu : monstre;

begin
  vieU := joueur.vieActu;
  monstreActu := choixMonstre((random(4)+1)); //choix aléatoire du monstre
  if calculLvl(joueur) = 1 then
  vieMi := monstreActu.vieBase
  else
  vieMi := ((monstreActu.vieBase * calculLvl(joueur))div 2);
  vieMd := vieMi;
  arme := joueur.atk;


  afficheCombat(monstreActu.id);

  if (vieU > vieMd) then //si le joueur a plus de vie que le monstre il commence
  vieMd := tourJ(vieMd, arme, vieU, vieMi, joueur, monstreActu);
  afficheMajVie(vieMd, vieMi, vieU, joueur.def); //affichage de l'attaque

  while (vieU > 0) AND (vieMd > 0) do // tant qu'aucun des deux n'est mort, le combat continue
  begin
    vieU := tourM(vieMi, vieMd, vieU); //Tour du monstre
    afficheMajVie(vieMd, vieMi, vieU, joueur.def); //affichage de l'attaque

    if (vieU > 0) then //si le joueur n'a pas encore perdu
    vieMd := tourJ(vieMd, arme, vieU, vieMi, joueur, monstreActu);  //Tour du joueur
    afficheMajVie(vieMd, vieMi, vieU, joueur.def); //affichage de l'attaque

  end; //while (vieU > 0) AND (vieM > 0) do

  joueur.vieActu := vieU;

  if (vieU > 0) then
  joueur := win(joueur, monstreActu, vieMi)
  else
  joueur := loose(joueur);
  readln;

  result := joueur;
end;

//Logique du combat de boss. Retourne le record du joueur si perdu ou active les credits et fini le jeu
function combatBoss(joueur : player): player;

var
  vieU, vieMi, vieMd, arme : integer; //vieMd = vie du monstre actuel ; vieMi = vie du monstre initial
  boss: monstre = (
    id:5;
    vieBase:2500;
    spe:normal;
  );

begin
  vieU := joueur.def;
  vieMi := boss.vieBase;
  vieMd := vieMi;
  arme := joueur.atk;

  afficheCombat(boss.id);

  while (vieU > 0) AND (vieMd > 0) do // tant qu'aucun des deux n'est mort, le combat continue
  begin
    vieU := tourBoss(vieMi, vieMd, vieU); //Tour du boss
    afficheMajVie(vieMd, vieMi, vieU, joueur.def); //affichage de l'attaque

    if (vieU > 0) then //si le joueur n'a pas encore perdu
    vieMd := tourJ(vieMd, arme, vieU, vieMi, joueur, boss);  //Tour du joueur
    afficheMajVie(vieMd, vieMi, vieU, joueur.def); //affichage de l'attaque

  end; //while (vieU > 0) AND (vieM > 0) do

  if (vieU > 0) then
  afficheCredit
  else
  joueur := loose(joueur);

  result := joueur;
end;

//Logique central du combat
function combat(): player;

var
  choixU : boolean;

begin
  if (calculLvl(joueur) < 10) then
  begin
    joueur := combatMonstre(joueur);
  end
  else
  begin
    choixU := TRUE;//afficheChoixBoss;
    if choixU then
    joueur := combatBoss(joueur)
    else
    joueur := combatMonstre(joueur);
  end;
  result := joueur;
end;

end.
