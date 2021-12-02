program mh;

uses menuUnit,perso,inventaire;

var joueur:player;

begin
  joueur:=createjoueur('pol','homme');
  afficheinv(joueur);
  readln;
end.

