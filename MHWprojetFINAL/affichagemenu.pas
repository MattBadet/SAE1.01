{ Cette unité à pour rôle de gérer l'affichage des Menus }
unit affichagemenu;
{$codepage UTF8}
{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, GestionEcran, affichageObjet,perso,inventaire,utilities;

function afficheMenuPrincipale():Boolean; // menu de la ville
procedure regles(); // affiche les règles et le synopsis
function afficheCreationPerso():player; // menu de la création du personnage
procedure credit(); // Affichage des crédits
function afficheVille():Integer; // Affichage du menu d'une partie
function afficheVente(invPotion:array of potion;PO:Integer):Integer; // afffichage des ventes du marchand
function afficheAchat(invPotion:array of potion;invBombre:array of bombe;PO:Integer):Integer; // afffichage des achats du marchand
function afficheCantine():Integer; // Affichage de la cantine
procedure afficheForge(forge:array of armure); // afffichage de la forge
function afficheChambre():Integer; // Menu de la chambre qui donne accès à l'inventaire et au repos
function afficheInventaireChambre(inventaire:array of arme):Integer; // afffichage de l'inventaire depuis la chambre
function afficheInventaireCombat(inventaire:array of arme):Integer; // afffichage de l'inventaire depuis un combat
procedure precombat(); // ecran de liaison entre la ville et le combat
procedure afficheCombat(monstre:Integer); // fenêtre de combat
function afficheMenuCombat():Boolean; // choix de combattre ou aller dans l'inventaire
procedure afficheMajVie(pvMonstre,PvMaxMonstre,pvHero,pvMaxHero:Integer); // renouvelle les pv à chaque tour
procedure vie(pv,pvMax,x,y:Integer); // affiche la barre de vie et le nombre de pv sur les pv max
procedure afficheVictoire(); // affiche l'écran de victoire
procedure afficheDeadMenu(); // affiche l'écran de défaite

implementation

procedure afficheDeadMenu();
var
  x,y:Integer;
begin
    effacerEcran();
    x:= 10;
    y:=8;
    ecrireEnPositionXY(x,y,'               ,____                                          /   \                                          ____,');
    ecrireEnPositionXY(x,y+1,'               |---.\                                 )      ((   ))                                        /.---|');
    ecrireEnPositionXY(x,y+2,'       ___     |    `       (@)                      /|\      ))_((     /|\                                 `    |     ___');
    ecrireEnPositionXY(x,y+3,'      / .-\  ./=)           |-|                     / | \    (/\|/\)   / | \                      (@)           (=\.  /-. \');
    ecrireEnPositionXY(x,y+4,'     |  |"|_/\/|            | | -------------------/--|-voV---\`|''/--Vov-|--\---------------------|-|            |\/\_|"|  |');
    ecrireEnPositionXY(x,y+5,'     ;  |-;| /_|            |-|                         ''^`   (o o)  ''^`                          | |            |_\ |;-|  ;');
    ecrireEnPositionXY(x,y+6,'    / \_| |/ \ |            | |                               `\Y/''                               |-|            | / \| |_/ \');
    deplacerCurseurXY(x,y+7);
    write('   /      \/\( |            |-|                                                                   | |            | )/\/      \');
    deplacerCurseurXY(x,y+8);
    write('   |   /  |` ) |            | |                             YOU DIED !                            |-|            | ( ''|  \   |');
    deplacerCurseurXY(x,y+9);
    write('   /   \ _/    |            |-|                                                                   | |            |    \_ /   \');
    deplacerCurseurXY(x,y+10);
    write('  /--._/  \    |            | |                                                                   |-|            |    /  \_.--\');
    deplacerCurseurXY(x,y+11);
    write('  `/|)    |    /            |_|___________________________________________________________________| |            \    |    (|\`');
    deplacerCurseurXY(x,y+12);
    write('    /     |   |             (@)              l   /\ /         ( (       \ /\   l                `\|-|             |   |     \');
    deplacerCurseurXY(x,y+13);
    write('  .''      |   |                              l /   V           \ \       V   \ l                  (@)             |   |      ''.');
    deplacerCurseurXY(x,y+14);
    write(' /         \  |                              l/                _) )_          \I                                  |  /         \');
    deplacerCurseurXY(x,y+15);
    write('(_.-.__.__./  /                                                `\ /''                                              \  \.__.__.-._)');
end;

procedure afficheVictoire();
var
  x,y:Integer;
begin
    x:= 34;
    y:=8;
    dessinerCadreXY(x-5,y-2,x+77,y+17,simple,white,black);
    deplacerCurseurXY(x+34,y);
    write('/   \');
    deplacerCurseurXY(x+26,y+1);
    write(')      ((   ))     (');
    deplacerCurseurXY(x,y+2);
    write('(@)                      /|\      ))_((     /|\ ');
    deplacerCurseurXY(x,y+3);
    write('|-|                     / | \    (/\|/\)   / | \                      (@)');
    deplacerCurseurXY(x,y+4);
    write('| | -------------------/--|-voV---\`|''/--Vov-|--\---------------------|-|');
    deplacerCurseurXY(x,y+5);
    write('|-|                         ''^`   (o o)  ''^`                          | |');
    deplacerCurseurXY(x,y+6);
    write('| |                               `\Y/''                               |-|');
    deplacerCurseurXY(x,y+7);
    write('|-|                                                                   | |');
    deplacerCurseurXY(x,y+8);
    write('| |                             VICTOIRE !                            |-|');
    deplacerCurseurXY(x,y+9);
    write('|-|                                                                   | |');
    deplacerCurseurXY(x,y+10);
    write('| |                                                                   |-|');
    deplacerCurseurXY(x,y+11);
    write('|_|___________________________________________________________________| |');
    deplacerCurseurXY(x,y+12);
    write('(@)              l   /\ /         ( (       \ /\   l                `\|-|');
    deplacerCurseurXY(x+17,y+13);
    write('l /   V           \ \       V   \ l                  (@)');
    deplacerCurseurXY(x+17,y+14);
    write('l/                _) )_          \I');
    deplacerCurseurXY(x+35,y+15);
    write('`\ /''');
end;

procedure vie(pv,pvMax,x,y:Integer); // affiche la barre de vie et le nombre de pv sur les pv max
var
  i:Integer;
begin
    dessinerCadreXY(x,y,x+10,y+2,simple,white,black);
    deplacerCurseurXY(x+1,y+1);
    couleurTexte(Green);
    for i:=1 to (pv div(pvMax div 10)) do  // en fonction du pourcentage de vie remplie une barre de vie
        write('█');                       // par tranche de 10%
    deplacerCurseurXY(x+2,y+3);
    couleurTexte(white);
    write(pv:4,'/',pvMax:4);
end;

procedure afficheMajVie(pvMonstre,PvMaxMonstre,pvHero,pvMaxHero:Integer); // renouvelle les pv à chaque tour
begin
    vie(pvHero,pvMaxHero,19,27);
    vie(pvMonstre,pvMaxMonstre,19,27);
end;

function afficheMenuCombat():Boolean; // choix de combattre ou aller dans l'inventaire
var
  choix:Integer; // choix du menu
begin
    dessinerCadreXY(68,5,82,7,simple,white,black);
    ecrireEnPositionXY(70,6,'1 - Inventaire');
    dessinerCadreXY(68,9,82,11,simple,white,black);
    ecrireEnPositionXY(70,10,'2 - Combattre');
    dessinerCadreXY(68,13,82,15,simple,white,black);
    ecrireEnPositionXY(70,17,'Votre choix : ');
    readln(choix);
    case choix of
      1:Result:=False;
      2:Result:=True;
      else
        Result:=afficheMenuCombat();
    end;
end;

procedure afficheCombat(monstre:Integer); // fenêtre de combat
begin
    effacerEcran();
    affichage(15,5,'hero');
    vie(150,200,19,27);
    case monstre of
      1:affichage(90,2,'griffon');
      3:affichage(70,13,'dragon1');
      2:affichage(95,3,'dragon2');
      4:affichage(80,2,'phoenix');
    end;
    dessinerCadreXY(70,5,80,7,simple,white,black);
    ecrireEnPositionXY(72,6,'Inventaire');
    dessinerCadreXY(70,9,80,11,simple,white,black);
    ecrireEnPositionXY(72,10,'Combattre');
    vie(210,250,105,28);
end;

procedure precombat(); // ecran de liaison entre la ville et le combat
begin

end;

function afficheInventaireCombat(inventaire:array of arme):integer; // afffichage de l'inventaire depuis un combat
var
  x,y,i,choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,33,simple,white,black);
    dessinerCadreXY(67,0,83,2,simple,white,black);
    deplacerCurseurXY(70,1);
    write('Inventaire');
    dessinerCadreXY(2,3,40,32,simple,white,black);
    dessinerCadreXY(42,3,146,32,simple,white,black);
    ecrireEnPositionXY(18,4,'Objet');
    // remplissage inventaire
    x:=5;
    y:=6;
    for i:=1 to length(invpotion) do
        ecrireEnPositionXY(x,y+2*i,(i,':',invpotion[i].nom));
    x:=17;
    for i:=1 to length(invbombe) do
        ecrireEnPositionXY(x,y,(i,':',invbombe[i].nom));
    // test statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,24,144,31,simple,white,black);
    readln(choix);
    Result:=choix;
end;
function afficheInventaireChambre(inventaire:array of arme):integer; // afffichage de l'inventaire depuis la chambre
var
  x,y,i,choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,33,simple,white,black);
    dessinerCadreXY(67,0,83,2,simple,white,black);
    deplacerCurseurXY(70,1);
    write('Inventaire');
    dessinerCadreXY(2,3,40,32,simple,white,black);
    dessinerCadreXY(42,3,146,32,simple,white,black);
    ecrireEnPositionXY(18,4,'Objet');
    // remplissage inventaire
    x:=5;
    y:=6;
    // Arme
    for i:=1 to length(invarme) do
        writeln(IntToStr(i) + ':' + invarme[i].nom);
    // Armure
    for i:=1 to length(invarmure) do
        writeln(IntToStr(i) + ':' + invarmure[i].nom);
    // Arme Equipe
    for i:=1 to length(joueur.eqarmure) do
        writeln(IntToStr(i) + ':' + joueur.eqarmure[i].nom);
    // Armure Equipe
    writeln(IntToStr(i) + ':' + joueur.epee.nom);
    for i:=1 to length(invarme) do
        writeln(IntToStr(i) + ':' + invarme[i].nom);
    dessinerCadreXY(44,24,144,31,simple,white,black);
    readln(choix);
    Result:=choix;
end;
    {writeln('----------------------------------------- Objet');
     for i:=1 to length(joueur.materiaux) do
        writeln(i,'  ',joueur.materiaux[i] );
     writeln('----------------------------------------- Arme');
     for i:=1 to length(invarme) do
        writeln(IntToStr(i) + ':' + invarme[i].nom);
     writeln('----------------------------------------- Bombe');
     for i:=1 to length(invbombe) do
        writeln(IntToStr(i) + ':' + invbombe[i].nom);
     writeln('----------------------------------------- Potion');
     for i:=1 to length(invpotion) do
        writeln(IntToStr(i) + ':' + invpotion[i].nom);
     writeln('----------------------------------------- Armure');
     for i:=1 to length(invarmure) do
        writeln(IntToStr(i) + ':' + invarmure[i].nom);
     writeln('----------------------------------------- Arme Equipe');
     for i:=1 to length(joueur.eqarmure) do
        writeln(IntToStr(i) + ':' + joueur.eqarmure[i].nom);
     writeln('----------------------------------------- Armure Equipe');
     writeln(IntToStr(i) + ':' + joueur.epee.nom);}

function afficheChambre():Integer; // Menu de la chambre qui donne accès à l'inventaire et au repos
begin
    effacerEcran();
    affichage(0,0,'plancher');
    affichage(22,10,'grCoffre');
    affichage(49,3,'armure');
    affichage(90,9,'grLit');
end;

procedure afficheForge(forge:array of armure); // afffichage de la forge
var
  x,y,i:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,34,simple,white,black);
    dessinerCadreXY(71,0,79,2,simple,white,black);
    deplacerCurseurXY(73,1);
    write('Forge');
    dessinerCadreXY(2,3,40,30,simple,white,black);     // objets disponibles
    dessinerCadreXY(42,3,146,30,simple,white,black);  // crafts
    dessinerCadreXY(2,31,146,33,simple,white,black); // resources
    deplacerCurseurXY(5,32);
    write('Ressources Disponilbes : X trucs  X machins ....');
    deplacerCurseurXY(18,4);
    write('Objet');
    // remplissage forge
    x:=5;
    y:=6;
    for i:=0 to length(forge) do
        ecrireEnPositionXY(x,y+2*i,forge[i].nom);
    // statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,22,144,29,simple,white,black);
end;

function afficheCantine():Integer; // Affichage de la cantine
var
  choix:Integer;
begin
    effacerEcran();
    dessinerCadreXY(2,5,48,30,simple,white,black);
    affichage(15,14,'burger');
    dessinerCadreXY(52,5,98,30,simple,white,black);
    affichage(60,18,'burger');
    affichage(80,8,'frite');
    dessinerCadreXY(102,5,148,30,simple,white,black);
    affichage(105,21,'burger');
    affichage(132,15,'frite');
    affichage(110,6,'biere');
    ecrireEnPositionXY(67,1,'Votre Choix : ');
    readln(choix);
    Result:=choix;
end;

function afficheAchat(invPotion:array of potion;invBombre:array of bombe;PO:Integer):Integer; // afffichage des achats du marchand
var
  x,y,i:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,34,simple,white,black);
    dessinerCadreXY(69,0,81,2,simple,white,black);
    deplacerCurseurXY(71,1);
    write('Marchand');
    dessinerCadreXY(2,3,40,30,simple,white,black);    // objets disponibles
    dessinerCadreXY(42,3,146,33,simple,white,black); // crafts
    dessinerCadreXY(2,31,40,33,simple,white,black); // resources
    deplacerCurseurXY(5,32);
    write('Pièces d''Or Disponilbes : ',PO);
    deplacerCurseurXY(18,4);
    write('Objet');
    // remplissage marchand potion
    x:=5;
    y:=6;
    for i:=1 to 2 do
        ecrireEnPositionXY(x,y+2*i,invPotion[i].nom);
    // remplissage marchand bombe
    x:=5;
    y:=10;
    for i:=1 to 2 do
        ecrireEnPositionXY(x,y+2*i,invBombe[i].nom);
    // test statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,25,144,32,simple,white,black);
end;

function afficheVente(invPotion:array of potion;PO:Integer):Integer; // afffichage des ventes du marchand
var
  x,y,i:Integer;
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,34,simple,white,black);
    dessinerCadreXY(69,0,81,2,simple,white,black);
    deplacerCurseurXY(71,1);
    write('Marchand');
    dessinerCadreXY(2,3,40,30,simple,white,black);    // objets disponibles
    dessinerCadreXY(42,3,146,33,simple,white,black); // crafts
    dessinerCadreXY(2,31,40,33,simple,white,black); // resources
    deplacerCurseurXY(5,32);
    write('Pièces d''Or Disponilbes : ',PO);
    deplacerCurseurXY(18,4);
    write('Objet');
    // remplissage marchand
    x:=5;
    y:=6;
    for i:=0 to length(invPotion) do
        ecrireEnPositionXY(x,y+2*i,invPotion[i].nom);
    // test statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,25,144,32,simple,white,black);
end;

function afficheVille():Integer; // Affichage du menu d'une partie
var
  choix:Integer; // le choix de l'action du menu
begin
    effacerEcran();
    // Module Marchand
    dessinerCadreXY(3,0,37,16,simple,white,black);
    affichage(5,3,'marchand');
    ecrireEnPositionXY(15,15,'1 - Marchand');
    // Module Cantine
    dessinerCadreXY(41,0,75,16,simple,white,black);
    affichage(48,4,'burger');
    ecrireEnPositionXY(53,15,'2 - Cantine');
    // Module Forge
    dessinerCadreXY(79,0,113,16,simple,white,black);
    affichage(89,7,'enclume');
    ecrireEnPositionXY(93,15,'3 - Forge');
    // Module Chambre
    dessinerCadreXY(116,0,147,16,simple,white,black);
    affichage(122,1,'lit');
    ecrireEnPositionXY(128,15,'4 - Chambre');
    // Module Combat
    dessinerCadreXY(5,19,90,32,simple,white,black);
    affichage(8,20,'epee');
    ecrireEnPositionXY(43,31,'5 - Partir en Chasse');
    // Module Exit
    dessinerCadreXY(110,19,144,32,simple,white,black);
    affichage(120,20,'croix');
    ecrireEnPositionXY(121,31,'6 - Quitter');
    // Réponse (choix du menu)
    ecrireEnPositionXY(17,70,'Votre Choix : ');
    readln(choix);
    case choix of
      1:Result:=2;
      2:Result:=3;
      3:Result:=4;
      4:Result:=1;
      5:Result:=5;
      6:Result:=6;
      else
        Result:=afficheVille();
    end;
end;

procedure credit(); // Affichage des crédits
begin
    effacerEcran();
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');

end;

function afficheCreationPerso():player; // menu de la création du personnage
var
  choix:Integer; // contient le choix du menu
  joueur:player; // le personnage une fois créé
begin
    changerTailleConsole(150,35);
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');
    deplacerCurseurXY(60,12);
    write('Quel est votre sexe ? ');
    deplacerCurseurXY(60,15);
    write('Quel est votre taille ? ');
    deplacerCurseurXY(60,18);
    write('Comment vous appelez-vous ? ');
    deplacerCurseurXY(60,21);
    write('Comment allez- vous ? ');
    deplacerCurseurXY(82,12);
    readln(joueur.sexe);
    deplacerCurseurXY(84,15);
    readln(joueur.taille);
    deplacerCurseurXY(88,18);
    readln(joueur.nom);
    Result:=joueur;
end;

procedure regles(); // affiche les règles et le synopsis
begin
    effacerEcran();
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');
    ecrireEnPositionXY(35,13,'La commission des chasseurs est une institution chargée d’étudier et de chasser');
    ecrireEnPositionXY(35,14,'les grands monstres qui peuplent le monde. Lors de la cinquième expédition');
    ecrireEnPositionXY(35,15,'envoyée dans le nouveau monde, la commission des chasseurs à découvert l’existence');
    ecrireEnPositionXY(35,16,'d’une île mystérieuse : Aeternum, protégée par un étrange brouillard magique');
    ecrireEnPositionXY(35,17,'empêchant les navires de s’y rendre mais qui semble jouer un rôle important dans');
    ecrireEnPositionXY(35,18,'le cycle de migration des grands monstres. Après de nombreuses recherches, la');
    ecrireEnPositionXY(35,19,'commission a mis la main sur un artéfact magique ressemblant à une boussole,');
    ecrireEnPositionXY(35,20,'censé permettre d’accéder à l’île. Vous faites partie de la sixième grande');
    ecrireEnPositionXY(35,21,' expédition de chasseurs dont l’objectif est de découvrir les secret d’Aeternum.');
end;

function afficheMenuPrincipale():Boolean; // menu de la ville
var
  choix:Integer; // contient le choix du menu
begin
    changerTailleConsole(150,35);
    dessinerCadreXY(38,1,112,8,simple,white,black);
    deplacerCurseurXY(40,3);
    write('  /\/\   ___  _ __  ___| |_ ___ _ __    /\  /\_   _ _ __ | |_ ___ _ __ ');
    deplacerCurseurXY(40,4);
    write(' /    \ / _ \| ''_ \/ __| __/ _ \ ''__|  / /_/ / | | | ''_ \| __/ _ \ ''__|');
    deplacerCurseurXY(40,5);
    write('/ /\/\ \ (_) | | | \__ \ ||  __/ |    / __  /| |_| | | | | ||  __/ |');
    deplacerCurseurXY(40,6);
    write('\/    \/\___/|_| |_|___/\__\___|_|    \/ /_/  \__,_|_| |_|\__\___|_|');
    dessinerCadreXY(60,11,85,15,simple,white,black);
    dessinerCadreXY(60,17,85,21,simple,white,black);
    dessinerCadreXY(60,23,85,27,simple,white,black);
    ecrireEnPositionXY(62,13,'1 - Nouvelle Partie');
    ecrireEnPositionXY(62,19,'2 - Crédit');
    ecrireEnPositionXY(62,25,'3 - Quitter');
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');
    dessinerCadreXy(60,29,85,33,simple,white,black);
    ecrireEnPositionXY(88,22,'Votre Choix : ');
    readln(choix);
    Case choix of
      1:Result:=True;
      2:Result:=False;
      3:write('');
      else
        Result:=afficheMenuPrincipale();
      end;
end;

end.


