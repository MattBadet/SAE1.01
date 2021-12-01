unit perso;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure createjoueur();
function listmateriaux():array[1..6] of integer;

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
function listmateriaux():array[1..6] of integer;
var
  i:integer;
  tabl:array[1..6] of integer;
begin
     tabl[1]:=1;//CUIVRE
     tabl[2]:=2;//FER
     tabl[3]:=3;//ACIER
     tabl[4]:=4;//ECAILLE
     tabl[5]:=5;//DEMON
     tabl[6]:=6;//OR
end;

procedure createjoueur(name,sex);
begin
  joueur :player = (
    nom:name;
    sexe:sex;
    vieActu:300;
    def:0;
    atk:0;
    materiaux:listmateriaux();
    xp:0;
  );

end;

implementation

end.

