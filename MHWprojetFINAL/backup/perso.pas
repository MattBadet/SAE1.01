unit perso;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  player = packed record
    nom:string;
    sexe:string;
    vieActu:integer;
    def:integer;
    atk:integer;
    materiaux:array[1..6] of integer;
    xp:integer;
  end;

function createjoueur(nom,sexe:string):player;

implementation

function createjoueur(nom,sexe:string):player;
begin
  joueur.nom:=name;
  joueur.sexe:sex;
  joueur.vieActu:300;
  joueur.def:0;
  joueur.atk:0;
  joueur.materiaux[1]:=1;
  joueur.materiaux[2]:=2;
  joueur.materiaux[3]:=3;
  joueur.materiaux[4]:=4;
  joueur.materiaux[5]:=5;
  joueur.materiaux[6]:=6;
  joueur.xp:0;
end.

