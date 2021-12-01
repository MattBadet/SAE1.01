unit cantine;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  menu = packed record
    nom:string;
    desc:string;
    prix:integer;
    effet:integer;
  end;
const
  petitmenu : menu =(
            nom:'petit menu';
            desc:'petit menu mais bon';
            prix:20;
            effet:5;
  );
  moyenmenu : menu =(
            nom:'menu classique';
            desc:'Un menu classique';
            prix:100;
            effet:10;
  );
  grandmenu : menu =(
            nom:'grand menu';
            desc:'Un grand menu pour un grand homme !';
            prix:250;
            effet:20;
  );

  var
    atkbase:integer;

procedure choixmenu(choix:integer);
procedure getpetitmenu();
procedure getmoyenmenu();
procedure getgrandmenu();
procedure cleareffet();

implementation
procedure cantine();
begin
  choixmenu(affichagecantine());
end;
procedure choixmenu(choix:integer);
begin
  case choix of
       1:getpetitmenu();
       2:getmoyenmenu();
       3:getgrandmenu();
  end;
end;

procedure getpetitmenu();
begin
  atkbase:=joueur.atk;
  joueur.atk=joueur.atk*1.05;
end;

procedure getmoyenmenu();
begin
  atkbase:=joueur.atk;
  joueur.atk=joueur.atk*1.10;
end;
procedure getgrandmenu();
begin
  atkbase:=joueur.atk;
  joueur.atk=joueur.atk*1.20;
end;
procedure cleareffet();
begin
  joueur.atk:=atkbase;
end;

end.

