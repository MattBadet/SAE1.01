unit inventaire;
//Le role de cette unité est de gérer l'inventaire donc tous ce qui est ajouter a un inventaire ou alors supprimer un objet.
{$mode objfpc}{$H+}
{$codepage UTF8}
interface

uses
  Classes, SysUtils, utilities, perso;

procedure initialisationinv();//INITIALISATION DE L'INVENTAIRE
//PARTIE AJOUT D'OBJET DANS L'INVENTAIRE
procedure ajouterinvarme(obj:arme);//AJOUT D'UN ITEM DANS L'INVENTAIRE ARME
procedure ajouterinvbombe(obj:bombe);//AJOUT D'UN ITEM DANS L'INVENTAIRE BOMBE
procedure ajouterinvpotion(obj:potion);//AJOUT D'UN ITEM DANS L'INVENTAIRE POTION
//PARTIE EQUIPER ARMURE OU ARME
procedure equiperepee(joueur:player;obj:arme);//EQUIPER UNE EPEE
procedure equipercasque(joueur:player;epe:armure);//EQUIPER UN CASQUE
procedure equiperplastron(joueur:player;epe:armure);//EQUIPER UN PLASTRON
procedure equiperjambiere(joueur:player;epe:armure);//EQUIPER DES JAMBIERES
procedure equiperbottes(joueur:player;epe:armure);//EQUIPER DES BOTTES
procedure equiperbouclier(joueur:player;epe:armure);//EQUIPER UN BOUCLIER
//PARTIE DESEQUIPER ARMURE OU ARME
procedure desequiperepee(joueur:player;obj:arme);//DESEQUIPER UNE EPEE
procedure desequipercasque(joueur:player;epe:armure);//DESEQUIPER UN CASQUE
procedure desequiperplastron(joueur:player;epe:armure);//DESEQUIPER UN PLASTRON
procedure desequiperjambiere(joueur:player;epe:armure);//DESEQUIPER UNE JAMBIERE
procedure desequiperbottes(joueur:player;epe:armure);//DESEQUIPER DES BOTTES
procedure desequiperbouclier(joueur:player;epe:armure);//DESEQUIPER UN BOUCLIER

procedure afficheinv(joueur:player);//TEMP POUR LES TEST DE L'INV
//PARTIE ENLEVER UN OBJET DE L'INVENTAIRE
procedure deletepotion(obj:potion);//Enlever une potion de l'inventaire
procedure deletebombe(obj:bombe); //Enlever une bombe de l'inventaire
procedure deleteepee(obj:arme);//Enlever une epee de l'inventaire
procedure deletecasque(obj:armure);//Enlever un casque de l'inventaire
procedure deleteplastron(obj:armure);//Enlever un plastron de l'inventaire
procedure deletejambiere(obj:armure);//Enlever des jambieres de l'inventaire
procedure deletebottes(obj:armure);//Enlever des bottes de l'inventaire
procedure deletebouclier(obj:armure);//Enlever un bouclier de l'inventaire

implementation

procedure initialisationinv();
var i:integer;
begin
  for i:=1 to length(invarme) do
     invarme[i]:=nullarm;
  for i:=1 to length(invbombe) do
     invbombe[i]:=nullbombe;
  for i:=1 to length(invpotion) do
     invpotion[i]:=nullpotion;
  for i:=1 to length(invarmure) do
     invarmure[i]:=nullarmure;
end;

procedure ajouterinvarme(obj:arme);
var
  fini:Boolean;
  y:integer;
begin
  y:=1;
  fini:=False;
  while fini = False do //cet boucle parcours l'inventaire pour ajouter l'arme a un endroit ou il n'y a pas encore d'arme
  begin
    if invarme[y].nom = 'null' then
    begin
       invarme[y]:=obj;
       fini:=True
    end;
    if invarme[y].nom <> 'null' then
    begin
       y:=y+1;
       if y > length(invarme) then
       begin
          fini:=True;
          write('inventory full');
       end;
    end;
  end;
end;
procedure ajouterinvbombe(obj:bombe);
var
  fini:Boolean;
  y:integer;
begin
  y:=1;
  fini:=False;
  while fini = False do//cet boucle parcours l'inventaire pour ajouter la bombe a un endroit ou il n'y a pas encore de bombe
  begin
    if invbombe[y].nom = 'null' then
    begin
       invbombe[y]:=obj;
       fini:=True
    end;
    if invbombe[y].nom <> 'null' then
    begin
       if y > length(invbombe) then
       begin
          fini:=True;
          writeln('inventory full');
       end;
       y:=y+1;
    end;
  end;
end;
procedure ajouterinvpotion(obj:potion);
var
  fini:Boolean;
  y:integer;
begin
  y:=1;
  fini:=False;
  while fini = False do//cet boucle parcours l'inventaire pour ajouter la potion a un endroit ou il n'y a pas encore de potion
  begin
    if invpotion[y].nom = 'null' then
    begin
       invpotion[y]:=obj;
       fini:=True
    end;
    if invpotion[y].nom <> 'null' then
    begin
       y:=y+1;
       if y > length(invpotion) then
       begin
          fini:=True;
          writeln('inventory full');
       end;
    end;
  end;
end;
procedure ajouterinvarmure(obj:armure);
var
  fini:Boolean;
  y:integer;
begin
  y:=1;
  fini:=False;
  while fini = False do//cet boucle parcours l'inventaire pour ajouter l'armure a un endroit ou il n'y a pas encore de une armure
  begin
    if invarmure[y].nom = 'null' then
    begin
       invarmure[y]:=obj;
       fini:=True
    end;
    if invarmure[y].nom <> 'null' then
    begin
       y:=y+1;
       if y > length(invarmure) then
       begin
          fini:=True;
          writeln('inventory full');
       end;
    end;
  end;
end;

procedure equiperepee(joueur:player;obj:arme);
begin
  joueur.epee:=obj;
end;
procedure equipercasque(joueur:player;epe:armure);
begin
  joueur.eqarmure[1]:=epe;
  initdef(joueur);
end;
procedure equiperplastron(joueur:player;epe:armure);
begin
  joueur.eqarmure[2]:=epe;
  initdef(joueur);
end;
procedure equiperjambiere(joueur:player;epe:armure);
begin
  joueur.eqarmure[3]:=epe;
  initdef(joueur);
end;
procedure equiperbottes(joueur:player;epe:armure);
begin
  joueur.eqarmure[4]:=epe;
  initdef(joueur);
end;
procedure equiperbouclier(joueur:player;epe:armure);
begin
  joueur.eqarmure[5]:=epe;
  initdef(joueur);
end;

procedure desequiperepee(joueur:player;obj:arme);
begin
  ajouterinvarme(joueur.epee);
  joueur.epee:=nullarm;
end;
procedure desequipercasque(joueur:player;epe:armure);
begin
  ajouterinvarmure(joueur.eqarmure[1]);
  joueur.eqarmure[1]:=nullarmure;
  initdef(joueur);
end;
procedure desequiperplastron(joueur:player;epe:armure);
begin
  ajouterinvarmure(joueur.eqarmure[2]);
  joueur.eqarmure[2]:=nullarmure;
  initdef(joueur);
end;
procedure desequiperjambiere(joueur:player;epe:armure);
begin
  ajouterinvarmure(joueur.eqarmure[3]);
  joueur.eqarmure[3]:=nullarmure;
  initdef(joueur);
end;
procedure desequiperbottes(joueur:player;epe:armure);
begin
  ajouterinvarmure(joueur.eqarmure[4]);
  joueur.eqarmure[4]:=nullarmure;
  initdef(joueur);
end;
procedure desequiperbouclier(joueur:player;epe:armure);
begin
  ajouterinvarmure(joueur.eqarmure[5]);
  joueur.eqarmure[5]:=nullarmure;
  initdef(joueur);
end;

procedure afficheinv(joueur:player);
var i:integer;
begin
     writeln('----------------------------------------- Objet');
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
     writeln(IntToStr(i) + ':' + joueur.epee.nom);

  end;

procedure deletepotion(obj:potion);
begin
  for i:=1 to length(invpotion) do
  begin
    if invpotion[i].id=obj.id then
       invpotion[i]:=nullpotion;
  end;
end;
procedure deletebombe(obj:bombe);
begin
  for i:=1 to length(invbombe) do
  begin
    if invbombe[i].id=obj.id then
       invbombe[i]:=nullbombe;
  end;
end;
procedure deleteepee(obj:arme);
begin
  obj:=nullarm;
end;
procedure deletecasque(obj:armure);
begin
  obj:=nullarmure;
end;
procedure deleteplastron(obj:armure);
begin
  obj:=nullarmure;
end;
procedure deletejambiere(obj:armure);
begin
  obj:=nullarmure;
end;
procedure deletebottes(obj:armure);
begin
  obj:=nullarmure;
end;
procedure deletebouclier(obj:armure);
begin
  obj:=nullarmure;
end;

end.

