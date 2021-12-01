{ Cette unité à pour rôle de gérer l'affichage des Menus }
unit affichagemenu;
{$codepage UTF8}
{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, GestionEcran, affichageObjet, crtperso;

procedure afficheChambre(); // Menu de la chambre qui donne accès à l'inventaire et au repos
procedure afficheMenuPartie(); // Affichage du menu d'une partie
procedure afficheVille();
procedure afficheDeadMenu();
procedure afficheInventaire(); // afffichage de l'inventaire
procedure afficheForge(); // afffichage de la forge
procedure afficheCombat(monstre:Integer); // fenêtre de combat
function afficheCantine():Boolean; // Affichage de la cantine
procedure afficheCreationPerso(); // menu de la création du personnage    *
procedure afficheVictoire();
procedure afficheMarchand(); // afffichage du marchand

implementation

procedure afficheDeadMenu();
var
  x,y:Integer;
begin
    effacerEcran();
    x:= 10;
    y:=8;
    deplacerCurseurXY(x,y);
    write('               ,____                                          /   \                                          ____,');
    deplacerCurseurXY(x,y+1);
    write('               |---.\                                 )      ((   ))                                        /.---|');
    deplacerCurseurXY(x,y+2);
    write('       ___     |    `       (@)                      /|\      ))_((     /|\                                 `    |     ___');
    deplacerCurseurXY(x,y+3);
    write('      / .-\  ./=)           |-|                     / | \    (/\|/\)   / | \                      (@)           (=\.  /-. \');
    deplacerCurseurXY(x,y+4);
    write('     |  |"|_/\/|            | | -------------------/--|-voV---\`|''/--Vov-|--\---------------------|-|            |\/\_|"|  |');
    deplacerCurseurXY(x,y+5);
    write('     ;  |-;| /_|            |-|                         ''^`   (o o)  ''^`                          | |            |_\ |;-|  ;');
    deplacerCurseurXY(x,y+6);
    write('    / \_| |/ \ |            | |                               `\Y/''                               |-|            | / \| |_/ \');
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

procedure vie(pv,pvMax,x,y:Integer);
var
  i:Integer;
begin
    dessinerCadreXY(x,y,x+10,y+2,simple,white,black);
    deplacerCurseurXY(x+1,y+1);
    couleurTexte(Green);
    for i:=1 to (pv div(pvMax div 10)) do
        write('█');
    deplacerCurseurXY(x+2,y+3);
    couleurTexte(white);
    write(pv,'/',pvMax);
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
    vie(210,250,105,28);
end;

procedure precombat(); // ecran de liaison entre la ville et le combat
begin

end;

procedure afficheInventaire(); // afffichage de l'inventaire
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,33,simple,white,black);
    dessinerCadreXY(67,0,83,2,simple,white,black);
    deplacerCurseurXY(70,1);
    write('Inventaire');
    dessinerCadreXY(2,3,40,32,simple,white,black);
    dessinerCadreXY(42,3,146,32,simple,white,black);
    deplacerCurseurXY(18,4);
    write('Objet');
    // test remplissage inventaire
    deplacerCurseurXY(5,6);
    write('Inventaire');
    deplacerCurseurXY(5,8);
    write('Inventaire');
    deplacerCurseurXY(5,10);
    write('Inventaire');
    deplacerCurseurXY(5,12);
    write('Inventaire');
    deplacerCurseurXY(5,14);
    write('Inventaire');
    deplacerCurseurXY(5,16);
    write('Inventaire');
    deplacerCurseurXY(5,18);
    write('Inventaire');
    deplacerCurseurXY(5,20);
    write('Inventaire');
    deplacerCurseurXY(5,22);
    write('Inventaire');
    deplacerCurseurXY(5,24);
    write('Inventaire');
    // test statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,24,144,31,simple,white,black);
end;

procedure afficheChambre(); // Menu de la chambre qui donne accès à l'inventaire et au repos
begin
    effacerEcran();
    affichage(0,0,'plancher');
    affichage(22,10,'grCoffre');
    affichage(49,3,'armure');
    affichage(90,9,'grLit');
end;

procedure afficheForge(); // afffichage de la forge
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,34,simple,white,black);
    dessinerCadreXY(71,0,79,2,simple,white,black);
    deplacerCurseurXY(73,1);
    write('Forge');
    dessinerCadreXY(2,3,40,30,simple,white,black);      // objets disponibles
    dessinerCadreXY(42,3,146,30,simple,white,black);   // crafts
    dessinerCadreXY(2,31,146,33,simple,white,black); // resources
    deplacerCurseurXY(5,32);
    write('Ressources Disponilbes : X trucs  X machins ....');
    deplacerCurseurXY(18,4);
    write('Objet');
    // test remplissage forge
    deplacerCurseurXY(5,6);
    write('Objet Forge');
    deplacerCurseurXY(5,8);
    write('Objet Forge');
    deplacerCurseurXY(5,10);
    write('Objet Forge');
    deplacerCurseurXY(5,12);
    write('Objet Forge');
    deplacerCurseurXY(5,14);
    write('Objet Forge');
    deplacerCurseurXY(5,16);
    write('Objet Forge');
    deplacerCurseurXY(5,18);
    write('Objet Forge');
    deplacerCurseurXY(5,20);
    write('Objet Forge');
    deplacerCurseurXY(5,22);
    write('Objet Forge');
    deplacerCurseurXY(5,24);
    write('Objet Forge');
    // test statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,22,144,29,simple,white,black);
end;

function afficheCantine():Boolean; // Affichage de la cantine
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
end;

procedure afficheMarchand(); // afffichage du marchand
begin
    effacerEcran();
    dessinerCadreXY(1,1,148,34,simple,white,black);
    dessinerCadreXY(69,0,81,2,simple,white,black);
    deplacerCurseurXY(71,1);
    write('Marchand');
    dessinerCadreXY(2,3,40,30,simple,white,black);     // objets disponibles
    dessinerCadreXY(42,3,146,33,simple,white,black);  // crafts
    dessinerCadreXY(2,31,40,33,simple,white,black); // resources
    deplacerCurseurXY(5,32);
    write('Pièces d''Or Disponilbes : Xpo');
    deplacerCurseurXY(18,4);
    write('Objet');
    // test remplissage forge
    deplacerCurseurXY(5,6);
    write('Objet Marchand');
    deplacerCurseurXY(5,8);
    write('Objet Marchand');
    deplacerCurseurXY(5,10);
    write('Objet Marchand');
    deplacerCurseurXY(5,12);
    write('Objet Marchand');
    deplacerCurseurXY(5,14);
    write('Objet Marchand');
    deplacerCurseurXY(5,16);
    write('Objet Marchand');
    deplacerCurseurXY(5,18);
    write('Objet Marchand');
    deplacerCurseurXY(5,20);
    write('Objet Marchand');
    deplacerCurseurXY(5,22);
    write('Objet Marchand');
    deplacerCurseurXY(5,24);
    write('Objet Marchand');
    // test statistique objet
    affichage(50,8,'epee');
    dessinerCadreXY(44,25,144,32,simple,white,black);
end;

procedure afficheMenuPartie(); // Affichage du menu d'une partie
begin
    effacerEcran();
    // Module Marchand
    dessinerCadreXY(3,0,37,16,simple,white,black);
    affichage(5,3,'marchand');
    deplacerCurseurXY(17,15);
    write('Marchand');
    // Module Cantine
    dessinerCadreXY(41,0,75,16,simple,white,black);
    affichage(48,4,'burger');
    deplacerCurseurXY(55,15);
    write('Cantine');
    // Module Forge
    dessinerCadreXY(79,0,113,16,simple,white,black);
    affichage(89,7,'enclume');
    deplacerCurseurXY(95,15);
    write('Forge');
    // Module Chambre
    dessinerCadreXY(116,0,147,16,simple,white,black);
    affichage(122,1,'lit');
    deplacerCurseurXY(130,15);
    write('Chambre');
    // Module Combat
    dessinerCadreXY(5,19,90,32,simple,white,black);
    affichage(8,20,'epee');
    deplacerCurseurXY(45,31);
    write('Partir en Chasse');
    // Module Exit
    dessinerCadreXY(110,19,144,32,simple,white,black);
    affichage(120,20,'croix');
    deplacerCurseurXY(123,31);
    write('Quitter');
end;

procedure credit(); // Affichage des crédits
begin

end;

procedure afficheCreationPerso(); // menu de la création du personnage
var
  choix:Integer; // contient le choix du menu
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
    readln();
    deplacerCurseurXY(84,15);
    readln();
    deplacerCurseurXY(88,18);
    readln();
    deplacerCurseurXY(82,21);
    readln();
    readln(choix);
end;

procedure afficheVille(); // menu de la ville
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
    deplacerCurseurXY(62,13);
    write('1 - Nouvelle Partie');
    deplacerCurseurXY(62,19);
    write('2 - Crédit');
    deplacerCurseurXY(62,25);
    write('3 - Quitter');
    affichage(10,2,'decoCelt');
    affichage(124,2,'decoCelt');
    deplacerCurseurXY(88,22);
    readln(choix);
    Case choix of
      1:affichemenuPartie();
      2:credit();
      3:write('');
      else
        affichemenuPrincipal();
      end;
end;

end.
