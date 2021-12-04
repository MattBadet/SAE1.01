unit forge;
//le role de cette unité est de simulé la fabrication d'élément d'armure ou d'armes.
{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, inventaire, utilities, perso, affichagemenu;

procedure forgeMenu(joueur:player);//ENTRE DANS LA FORGE
procedure choixmenu(joueur:player;choix:integer);//APPELLER QUAND LE JOUEUR CHOISIE L'ITEM QU'IL VEUT FABRIQUER
procedure createepee(joueur:player;epe:arme);//CREER UNE EPEE
procedure createcasque(joueur:player;epe:armure);//CREER UN CASQUE
procedure createplastron(joueur:player;epe:armure);//CREER UN PLASTRON
procedure createjambiere(joueur:player;epe:armure);//CREER UNE JAMBIERE
procedure createbottes(joueur:player;epe:armure);//CREER DES BOTTES
procedure createbouclier(joueur:player;epe:armure);//CREER UN BOUCLIER

implementation

procedure forgeMenu(joueur:player);
var forgearmure:array[1..19] of armure;
  forgearme:array[1..4] of arme;
begin
  forgearmure[1]:=casquecuire;
  forgearmure[2]:=plastroncuire;
  forgearmure[3]:=jambierecuire;
  forgearmure[4]:=bottescuire;
  forgearmure[5]:=casquefer;
  forgearmure[6]:=plastronfer;
  forgearmure[7]:=jambierefer;
  forgearmure[8]:=bottesfer;
  forgearmure[9]:=bouclierfer;
  forgearmure[10]:=casqueacier;
  forgearmure[11]:=plastronacier;
  forgearmure[12]:=jambiereacier;
  forgearmure[13]:=bottesacier;
  forgearmure[14]:=bouclieracier;
  forgearmure[15]:=casquescale;
  forgearmure[16]:=plastronscale;
  forgearmure[17]:=jambierescale;
  forgearmure[18]:=bottesscale;
  forgearmure[19]:=bouclierscale;
  forgearme[1]:=epeefer;
  forgearme[2]:=epeeacier;
  forgearme[3]:=epeescale;
  forgearme[4]:=epeedemo;
  choixmenu(joueur,afficheForge(forgearmure,forgearme, joueur));
end;
procedure choixmenu(joueur:player;choix:integer);
begin
  case choix of //AGIT SELON LE CHOIX DE L'UTILISATEUR
       0:createepee(joueur,epeefer);
       1:createepee(joueur,epeeacier);
       2:createepee(joueur,epeescale);
       3:createepee(joueur,epeedemo);
       4:createcasque(joueur,casquecuire);
       8:createcasque(joueur,casquefer);
       13:createcasque(joueur,casqueacier);
       18createcasque(joueur,casquescale);
       5:createplastron(joueur,plastroncuire);
       9:createplastron(joueur,plastronfer);
       14:createplastron(joueur,plastronacier);
       19:createplastron(joueur,plastronscale);
       6:createjambiere(joueur,jambierecuire);
       10:createjambiere(joueur,jambierefer);
       15:createjambiere(joueur,jambiereacier);
       20:createjambiere(joueur,jambierescale);
       7:createbottes(joueur,bottescuire);
       11:createbottes(joueur,bottesfer);
       16:createbottes(joueur,bottesacier);
       21:createbottes(joueur,bottesscale);
       12:createbouclier(joueur,bouclierfer);
       17:createbouclier(joueur,bouclieracier);
       22:createbouclier(joueur,bouclierscale);
  end;
end;

procedure createepee(joueur:player;epe:arme);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (i = epe.idmaterial) then
    begin
       if joueur.materiaux[i]>2 then
          joueur.materiaux[i] := joueur.materiaux[i]-2 ;
          comptfer:=2;
    end;
    if (i>length(joueur.materiaux)) then
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
procedure createcasque(joueur:player;epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (i = epe.idmaterial) then
    begin
       if joueur.materiaux[i]>2 then
       begin
        joueur.materiaux[i]:=joueur.materiaux[i] -2 ;
        comptfer:=2;
       end;
    end;
    if (i>length(joueur.materiaux)) then
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
     equipercasque(joueur, epe);
  end
  else
      writeln('La tentative a echouer');
end;
procedure createplastron(joueur:player;epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (i = epe.idmaterial) then
    begin
       if joueur.materiaux[i]>=10 then
       begin
          joueur.materiaux[i]:=joueur.materiaux[i] -10 ;
          comptfer:=2;
       end;
    end;
    if (i>length(joueur.materiaux)) then
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
     equiperplastron(joueur, epe);
  end
  else
      writeln('La tentative a echouer');
end;
procedure createjambiere(joueur:player;epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (i = epe.idmaterial) then
    begin
       if joueur.materiaux[i]>=5 then
       begin
          joueur.materiaux[i]:=joueur.materiaux[i] -5 ;
          comptfer:=2;
       end;
    end;
    if (i>length(joueur.materiaux)) then
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
     equiperjambiere(joueur, epe);
  end
  else
      writeln('La tentative a echouer');
end;
procedure createbottes(joueur:player;epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (i = epe.idmaterial) then
    begin
       if joueur.materiaux[i]>=3 then
       begin
          joueur.materiaux[i]:=joueur.materiaux[i] -3 ;
          comptfer:=2;
       end;
    end;
    if (i>length(joueur.materiaux)) then
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
     equiperbottes(joueur, epe);
  end
  else
      writeln('La tentative a echouer');
end;
procedure createbouclier(joueur:player;epe:armure);
var
  reussie:Boolean;
  i,comptfer:integer;
begin
  comptfer:=0;
  reussie:=True;
  i:=1;
  while comptfer <> 2 do
  begin
    if (i = epe.idmaterial) then
    begin
       if joueur.materiaux[i]>=5 then
       begin
          joueur.materiaux[i]:=joueur.materiaux[i] -5 ;
          comptfer:=2;
       end;
    end;
    if (i>length(joueur.materiaux)) then
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
     equiperbouclier(joueur, epe);
  end
  else
      writeln('La tentative a echouer');
end;

end.

