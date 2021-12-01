unit inventaire;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, utilities;

procedure initialisationinv();
procedure ajouterinvobjet(obj:objet);
procedure ajouterinvarme(obj:arme);
procedure ajouterinvbombe(obj:bombe);
procedure ajouterinvpotion(obj:potion);
procedure equipercasque(epe:armure);
procedure equiperplastron(epe:armure);
procedure equiperjambiere(epe:armure);
procedure equiperbottes(epe:armure);
procedure equiperbouclier(epe:armure);
procedure afficheinv();

implementation

procedure initialisationinv();
var i:integer;
begin
  for i:=1 to length(invarme) do
     invarme[i]:=nullarm;
  for i:=1 to length(invobjet) do
     invobjet[i]:=nullobj;
  for i:=1 to length(invbombe) do
     invbombe[i]:=nullbombe;
  for i:=1 to length(invpotion) do
     invpotion[i]:=nullpotion;
  for i:=1 to length(invarmure) do
     invarmure[i]:=nullarmure;
end;
procedure ajouterinvobjet(obj:objet);
var
  fini:Boolean;
  y:integer;
begin
  y:=1;
  fini:=False;
  while fini = False do
  begin
    if invobjet[y].nom = obj.nom then
    begin
       if invobjet[y].stack < 5 then
          invobjet[y].stack:=invobjet[y].stack+1;
       fini:=True;
    end
    else if invobjet[y].nom = 'null' then
    begin
       invobjet[y]:=obj;
       fini:=True
    end
    else if invobjet[y].nom <> 'null' then
    begin
       y:=y+1;
    end;
  end;
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
procedure equipercasque(epe:armure);
begin
  invarmure[1]:=epe;
end;
procedure equiperplastron(epe:armure);
begin
  invarmure[2]:=epe;
end;
procedure equiperjambiere(epe:armure);
begin
  invarmure[3]:=epe;
end;
procedure equiperbottes(epe:armure);
begin
  invarmure[4]:=epe;
end;
procedure equiperbouclier(epe:armure);
begin
  invarmure[5]:=epe;
end;

procedure afficheinv();
var i:integer;
begin
     writeln('----------------------------------------- Objet');
     for i:=1 to length(invobjet) do
        writeln(IntToStr(i) + ':' + invobjet[i].nom ,'  ',invobjet[i].stack );
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
  end;

end.

