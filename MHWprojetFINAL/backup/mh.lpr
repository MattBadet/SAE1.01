program mh;

uses menuUnit,perso;

var joueur:player;

begin
  joueur:=createjoueur('pol','homme');
  writeln(joueur.nom);
  readln;
end.

