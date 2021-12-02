unit forge;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, inventaire, utilities;

procedure forgeMenu();//ENTRE DANS LA FORGE
procedure choixmenu(choix:integer);//APPELLER QUAND LE JOUEUR CHOISIE L'ITEM QU'IL VEUT FABRIQUER
procedure createepee(epe:arme);//CREER UNE EPEE
procedure createcasque(epe:armure);//CREER UN CASQUE
procedure createplastron(epe:armure);//CREER UN PLASTRON
procedure createjambiere(epe:armure);//CREER UNE JAMBIERE
procedure createbottes(epe:armure);//CREER DES BOTTES
procedure createbouclier(epe:armure);//CREER UN BOUCLIER

implementation

procedure forgeMenu();
begin
  choixmenu(1);
end;
procedure choixmenu(choix:integer);
begin
  case choix of
       1:createepee(epeefer);
       2:createepee(epeeacier);
       3:createepee(epeescale);
       4:createepee(epeedemo);
       5:createcasque(casquecuire);
       6:createcasque(casquefer);
       7:createcasque(casqueacier);
       8:createcasque(casquescale);
       9:createplastron(plastroncuire);
       10:createplastron(plastronfer);
       11:createplastron(plastronacier);
       12:createplastron(plastronscale);
       13:createjambiere(jambierecuire);
       14:createjambiere(jambierefer);
       15:createjambiere(jambiereacier);
       16:createjambiere(jambierescale);
       17:createbottes(bottescuire);
       18:createbottes(bottesfer);
       19:createbottes(bottesacier);
       20:createbottes(bottesscale);
       21:createbouclier(bouclierfer);
       22:createbouclier(bouclieracier);
       23:createbouclier(bouclierscale);
  end;
end;

procedure createepee(epe:arme);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (invobjet[i].nom = epe.material) then
    begin
       if invobjet[i].stack>=2 then
       begin
          invobjet[i].stack:=invobjet[i].stack -2 ;
          comptfer:=2;
          if invobjet[i].stack=0 then
             invobjet[i]:=nullobj;
       end;
    end;
    if (i>length(invobjet)) then
    begin
         comptfer:=2;
         reussie:=False;
    end
    else
        i:=i+1;
  end;
  if reussie then
  begin
     writeln('Vous avez reussie a fabriquer une epee en ',epe.material);
     ajouterinvarme(epe);
  end
  else
      writeln('La tentative a echouer');
end;
procedure createcasque(epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (invobjet[i].nom = epe.material) then
    begin
       if invobjet[i].stack>=2 then
       begin
          invobjet[i].stack:=invobjet[i].stack -2 ;
          comptfer:=2;
          if invobjet[i].stack=0 then
             invobjet[i]:=nullobj;
       end;
    end;
    if (i>length(invobjet)) then
    begin
         comptfer:=2;
         reussie:=False;
    end
    else
        i:=i+1;
  end;
  if reussie then
  begin
     writeln('Vous avez reussie a fabriquer un casque en ',epe.material);
     equipercasque(epe);
  end
  else
      writeln('La tentative a echouer');
end;
procedure createplastron(epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (invobjet[i].nom = epe.material) then
    begin
       if invobjet[i].stack>=10 then
       begin
          invobjet[i].stack:=invobjet[i].stack -10 ;
          comptfer:=2;
          if invobjet[i].stack=0 then
             invobjet[i]:=nullobj;
       end;
    end;
    if (i>length(invobjet)) then
    begin
         comptfer:=2;
         reussie:=False;
    end
    else
        i:=i+1;
  end;
  if reussie then
  begin
     writeln('Vous avez reussie a fabriquer un casque en ',epe.material);
     equiperplastron(epe);
  end
  else
      writeln('La tentative a echouer');
end;
procedure createjambiere(epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (invobjet[i].nom = epe.material) then
    begin
       if invobjet[i].stack>=5 then
       begin
          invobjet[i].stack:=invobjet[i].stack -5 ;
          comptfer:=2;
          if invobjet[i].stack=0 then
             invobjet[i]:=nullobj;
       end;
    end;
    if (i>length(invobjet)) then
    begin
         comptfer:=2;
         reussie:=False;
    end
    else
        i:=i+1;
  end;
  if reussie then
  begin
     writeln('Vous avez reussie a fabriquer un casque en ',epe.material);
     equiperjambiere(epe);
  end
  else
      writeln('La tentative a echouer');
end;
procedure createbottes(epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (invobjet[i].nom = epe.material) then
    begin
       if invobjet[i].stack>=3 then
       begin
          invobjet[i].stack:=invobjet[i].stack -3 ;
          comptfer:=2;
          if invobjet[i].stack=0 then
             invobjet[i]:=nullobj;
       end;
    end;
    if (i>length(invobjet)) then
    begin
         comptfer:=2;
         reussie:=False;
    end
    else
        i:=i+1;
  end;
  if reussie then
  begin
     writeln('Vous avez reussie a fabriquer un casque en ',epe.material);
     equiperbottes(epe);
  end
  else
      writeln('La tentative a echouer');
end;
procedure createbouclier(epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (invobjet[i].nom = epe.material) then
    begin
       if invobjet[i].stack>=5 then
       begin
          invobjet[i].stack:=invobjet[i].stack -5 ;
          comptfer:=2;
          if invobjet[i].stack=0 then
             invobjet[i]:=nullobj;
       end;
    end;
    if (i>length(invobjet)) then
    begin
         comptfer:=2;
         reussie:=False;
    end
    else
        i:=i+1;
  end;
  if reussie then
  begin
     writeln('Vous avez reussie a fabriquer un casque en ',epe.material);
     equiperbouclier(epe);
  end
  else
      writeln('La tentative a echouer');
end;


end.

