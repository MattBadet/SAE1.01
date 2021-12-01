program affichage;
{$codepage UTF8}
uses
    GestionEcran, affichagemenu, affichageObjet;
var
  test:Boolean;

Begin
    changerTailleConsole(150,35);
    //menuPrincipal();
    //menuPartie();
    //readln;
    //chambre();
    //readln;
    //deadMenu();
    //inventaire();
    //forge();
    //combat(1);
    //test:=cantine();
    {affichageObjet.affichage(1,1,'griffon');
    affichageObjet.affichage(50,1,'phoenix');
    affichageObjet.affichage(1,22,'dragon1');
    affichageObjet.affichage(110,10,'dragon2');}
    //creationPerso();
    victoire();
    readln;
End.

