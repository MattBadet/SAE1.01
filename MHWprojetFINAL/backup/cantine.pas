unit cantine;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, affichagemenu, perso;

type
  //RECORD MENU
  menu = packed record
    nom:string;
    desc:string;
    prix:integer;
    effet:integer;
  end;
const
  //LE MENU LE MOIN CHER
  petitmenu : menu =(
            nom:'petit menu';
            desc:'petit menu mais bon';
            prix:20;
            effet:5;
  );
  //LE MENU CLASSIQUE
  moyenmenu : menu =(
            nom:'menu classique';
            desc:'Un menu classique';
            prix:100;
            effet:10;
  );
  //LE MENU LE PLUS CHER
  grandmenu : menu =(
            nom:'grand menu';
            desc:'Un grand menu pour un grand homme !';
            prix:250;
            effet:20;
  );

  var
    atkbase:integer;

procedure choixmenu(choix:integer;joueur : player);//CHOIX DES MENU
procedure getpetitmenu(joueur : player);//AFFECT LES EFFETS DU PETIT MENU
procedure getmoyenmenu(joueur : player);//AFFECT LES EFFETS DU MENU CLASSIQUE
procedure getgrandmenu(joueur : player);//AFFECT LES EFFETS DU GROS MENU
procedure cleareffet(joueur : player);
procedure cantineMenu(joueur : player);

implementation
procedure cantineMenu(joueur : player);
begin
  choixmenu(1,joueur);//affichecantine());
end;
procedure choixmenu(choix:integer;joueur : player);
begin
  case choix of
       1:getpetitmenu(joueur);
       2:getmoyenmenu(joueur);
       3:getgrandmenu(joueur);
  end;
end;

procedure getpetitmenu(joueur : player);
begin
  atkbase:=joueur.atk;
  joueur.atk:=round((joueur.atk*105) div 100);
end;

procedure getmoyenmenu(joueur :player);
begin
  atkbase:=joueur.atk;
  joueur.atk:=(joueur.atk*110) div 100;
end;
procedure getgrandmenu(joueur : player);
begin
  atkbase:=joueur.atk;
  joueur.atk:=(joueur.atk*120) div 100;
end;
procedure cleareffet(joueur : player);
begin
  joueur.atk:=atkbase;
end;

end.

