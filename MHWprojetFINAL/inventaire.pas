unit inventaire;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, utilities, perso;

procedure initialisationinv();//INITIALISATION DE L'INVENTAIRE
procedure ajouterinvarme(obj:arme);//AJOUT D'UN ITEM DANS L'INVENTAIRE ARME
procedure ajouterinvbombe(obj:bombe);//AJOUT D'UN ITEM DANS L'INVENTAIRE BOMBE
procedure ajouterinvpotion(obj:potion);//AJOUT D'UN ITEM DANS L'INVENTAIRE POTION
procedure equipercasque(joueur:player;epe:armure);//EQUIPER UN CASQUE
procedure equiperplastron(joueur:player;epe:armure);//EQUIPER UN PLASTRON
procedure equiperjambiere(joueur:player;epe:armure);//EQUIPER UNE JAMBIERE
procedure equiperbottes(joueur:player;epe:armure);//EQUIPER DES BOTTES
procedure equiperbouclier(joueur:player;epe:armure);//EQUIPER UN BOUCLIER
procedure desequiperepee(joueur:player;obj:arme);//DESEQUIPER UNE EPEE
procedure desequipercasque(joueur:player;epe:armure);//DESEQUIPER UN CASQUE
procedure desequiperplastron(joueur:player;epe:armure);//DESEQUIPER UN PLASTRON
procedure desequiperjambiere(joueur:player;epe:armure);//DESEQUIPER UNE JAMBIERE
procedure desequiperbottes(joueur:player;epe:armure);//DESEQUIPER DES BOTTES
procedure desequiperbouclier(joueur:player;epe:armure);//DESEQUIPER UN BOUCLIER
procedure afficheinv(joueur:player);//TEMP POUR LES TEST DE L'INV

procedure deletepotion(obj:potion);//Enlever une potion de l'inventaire
procedure deletebombe(obj:bombe); //Enlever une bombe de l'inventaire

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
  while fini = False do
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
  while fini = False do
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
  while fini = False do
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
  while fini = False do
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
end;
procedure equiperplastron(joueur:player;epe:armure);
begin
  joueur.eqarmure[2]:=epe;
end;
procedure equiperjambiere(joueur:player;epe:armure);
begin
  joueur.eqarmure[3]:=epe;
end;
procedure equiperbottes(joueur:player;epe:armure);
begin
  joueur.eqarmure[4]:=epe;
end;
procedure equiperbouclier(joueur:player;epe:armure);
begin
  joueur.eqarmure[5]:=epe;
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
end;
procedure desequiperplastron(joueur:player;epe:armure);
begin
  ajouterinvarmure(joueur.eqarmure[2]);
  joueur.eqarmure[2]:=nullarmure;
end;
procedure desequiperjambiere(joueur:player;epe:armure);
begin
  ajouterinvarmure(joueur.eqarmure[3]);
  joueur.eqarmure[3]:=nullarmure;
end;
procedure desequiperbottes(joueur:player;epe:armure);
begin
  ajouterinvarmure(joueur.eqarmure[4]);
  joueur.eqarmure[4]:=nullarmure;
end;
procedure desequiperbouclier(joueur:player;epe:armure);
begin
  ajouterinvarmure(joueur.eqarmure[5]);
  joueur.eqarmure[5]:=nullarmure;
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
    if invpotion[i+1]=nullpotion then
       invpotion[i]:=nullpotion;
  end;
end;
procedure deletebombe(obj:potion);
begin
  for i:=1 to length(invpotion) do
  begin
    if invbombe[i+1]=nullbombe then
       invbombe[i]:=nullbombe;
  end;
end;

end.

