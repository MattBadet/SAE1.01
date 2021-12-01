unit forge;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, inventaire, utilities;

procedure createepee(epe:arme);
procedure createcasque(epe:armure);
procedure createplastron(epe:armure);
procedure createjambiere(epe:armure);
procedure createbottes(epe:armure);
procedure createbouclier(epe:armure);

implementation

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

