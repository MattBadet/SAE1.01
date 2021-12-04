{ Dans cette Unité, nous pouvons trouver les différentes procédures qui
  permettent de procéder à l’affichage des objets et monstres utilisés par
  l’unité précédente. La dernière procédure appelle les autres procédures en
  fonction du string placé en paramètre, ceci permet de n'avoir qu'une procédure
  en interface. }
unit affichageObjet;
{$codepage UTF8}
{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, GestionEcran;
procedure affichage(x,y:Integer;objet:string); // lance l'affichage de l'objet/monstre demandé

implementation

procedure epee(x,y:Integer); // Affichage du symbole "épée" ligne par ligne
begin
    ecrireEnPositionXY(x+29,y,'___');
    ecrireEnPositionXY(x+28,y+1,'( ((');
    ecrireEnPositionXY(x+29,y+2,') ))');
    ecrireEnPositionXY(x+2,y+3,'.::.                    / /(');
    ecrireEnPositionXY(x+1,y+4,'''M .-;-.-.-.-.-.-.-.-.-/| ((::::::::::::::::::::::::::::::::::::::::::::::.._');
    ecrireEnPositionXY(x,y+5,'(J ( ( ( ( ( ( ( ( ( ( ( |  ))   -====================================-      _.>');
    ecrireEnPositionXY(x+1,y+6,'`P `-;-`-`-`-`-`-`-`-`-\| ((::::::::::::::::::::::::::::::::::::::::::::::''');
    ecrireEnPositionXY(x+2,y+7,'`::''                    \ \(');
    ecrireEnPositionXY(x+29,y+8,') ))');
    ecrireEnPositionXY(x+28,y+9,'(_((');
end;

procedure croix(x,y:Integer); // Affichage du symbole "croix" ligne par ligne
begin
    ecrireEnPositionXY(x,y,'___        ___');
    ecrireEnPositionXY(x,y+1,'\  \      /  /');
    ecrireEnPositionXY(x+1,y+2,'\  \    /  /');
    ecrireEnPositionXY(x+2,y+3,'\  \  /  /');
    ecrireEnPositionXY(x+3,y+4,'\  \/  /');
    ecrireEnPositionXY(x+4,y+5,'|    |');
    ecrireEnPositionXY(x+3,y+6,'/  /\  \');
    ecrireEnPositionXY(x+2,y+7,'/  /  \  \');
    ecrireEnPositionXY(x+1,y+8,'/  /    \  \');
    ecrireEnPositionXY(x,y+9,'/__/      \__\');
end;

procedure lit(x,y:Integer); // Affichage du symbole "lit" ligne par ligne
begin
    ecrireEnPositionXY(x+12,y,'___');
    ecrireEnPositionXY(x+8,y+1,',-""___""-.');
    ecrireEnPositionXY(x+7,y+2,'.;""''| |`"":.');
    ecrireEnPositionXY(x+7,y+3,'|| | | | | ||');
    ecrireEnPositionXY(x+7,y+4,'||_|_|_|_|_||');
    ecrireEnPositionXY(x+6,y+5,'//          /|');
    ecrireEnPositionXY(x+5,y+6,'/__         //|');
    ecrireEnPositionXY(x+1,y+7,',-""___""-.    //||');
    ecrireEnPositionXY(x,y+8,'.;""''| |`"":.  //');
    ecrireEnPositionXY(x,y+9,'||/| | | | || //');
    ecrireEnPositionXY(x,y+9,'||_|_|_|_|_||//');
    ecrireEnPositionXY(x,y+10,'||_________||/');
    ecrireEnPositionXY(x,y+11,'||         ||');
    ecrireEnPositionXY(x,y+12,'''''         ''''');
end;

procedure grLit(x,y:Integer); // Affichage du lit de la chambre
begin
  ecrireEnPositionXY(x+18,y,'()              ()');
  ecrireEnPositionXY(x+11,y+1,'(      ||______________||      )');
  ecrireEnPositionXY(x+10,y+2,'(_)     |                |     (_)');
  ecrireEnPositionXY(x+10,y+3,'|`|     |     Dormir     |     |`|');
  ecrireEnPositionXY(x+5,y+4,'()_  | |     |_______  _______|     | |  _()');
  ecrireEnPositionXY(x+7,y+5,'_\_|_|_/_  {_______}{_______}  _\_|_|_/_');
  ecrireEnPositionXY(x+8,y+6,'|__~__|___%%%%%%%%%%%%%%%%%%___|__~__|');
  ecrireEnPositionXY(x+5,y+7,'___|_____|__%%%%%%%%%%%%%%%%%%%%__|_____|___');
  ecrireEnPositionXY(x+8,y+8,'|     | %%%%%%%%%%%%%%%%%%%%%% |     |');
  ecrireEnPositionXY(x+9,y+9,'`=====%%%%%%%%%%%%%%%%%%%%%%%%=====`');
  ecrireEnPositionXY(x+8,y+10,'`=====%%%%%%%%%%%%%%%%%%%%%%%%%%=====`');
  ecrireEnPositionXY(x+7,y+11,'`=====%%%%%%%%%%%%%%%%%%%%%%%%%%%%=====`');
  ecrireEnPositionXY(x+6,y+12,'`=====/||||||||||||||||||||||||||||\=====`');
  ecrireEnPositionXY(x+5,y+13,'`======||||||||||||||||||||||||||||||======`');
  ecrireEnPositionXY(x+4,y+14,'`=======||||||||||||||||||||||||||||||=======`');
  ecrireEnPositionXY(x+3,y+15,'`==============================================`');
  ecrireEnPositionXY(x+2,y+16,'`================================================`');
  ecrireEnPositionXY(x+1,y+17,'`==================================================`');
  ecrireEnPositionXY(x,y+18,'`====================================================`');
end;

procedure coffre(x,y:Integer); // Affichage du symbole "coffre" ligne par ligne
begin
    ecrireEnPositionXY(x+2,y,'__________');
    ecrireEnPositionXY(x+1,y+1,'/\____;;___\');
    ecrireEnPositionXY(x,y+2,'| /         /');
    ecrireEnPositionXY(x,y+3,'`._________.');
    ecrireEnPositionXY(x+1,y+4,'|\         \');
    ecrireEnPositionXY(x+1,y+5,'| |---------|');
    ecrireEnPositionXY(x+1,y+6,'\ |    °    |');
    ecrireEnPositionXY(x+2,y+7,'\|_________|');
end;

procedure grCoffre(x,y:Integer); // Affichage du coffre pour la chambre
begin
  ecrireEnPositionXY(x+4,y,'___________________');
  ecrireEnPositionXY(x,y+1,' /\                  \');
  ecrireEnPositionXY(x,y+2,'/  \_________;;_______\');
  ecrireEnPositionXY(x,y+3,'|  /                  /');
  ecrireEnPositionXY(x,y+4,'| /                  /');
  ecrireEnPositionXY(x,y+5,'`;__________________;''');
  ecrireEnPositionXY(x+1,y+6,'|\                  \');
  ecrireEnPositionXY(x+1,y+7,'| \                  \');
  ecrireEnPositionXY(x+1,y+8,'|  |------------------|');
  ecrireEnPositionXY(x+1,y+9,'\  |                  |');
  ecrireEnPositionXY(x+2,y+10,'\ |        °°        |');
  ecrireEnPositionXY(x+3,y+11,'\|__________________|');
end;

procedure enclume(x,y:Integer); // Affichage du symbole "enclume" ligne par ligne
begin
    ecrireEnPositionXY(x+1,y,'.-------..___');
    ecrireEnPositionXY(x+1,y+1,'''-._     :_.-''');
    ecrireEnPositionXY(x+5,y+2,')   (');
    ecrireEnPositionXY(x+4,y+3,'/_____\');
end;

procedure marchand(x,y:Integer); //affiche le bust du marchand
begin
    ecrireEnPositionXY(x,y,'            ,#####,');
    ecrireEnPositionXY(x,y+1,'            #_   _#');
    ecrireEnPositionXY(x,y+2,'            |a` `a|');
    ecrireEnPositionXY(x,y+3,'            |  u  |');
    ecrireEnPositionXY(x,y+4,'            \  =  /');
    ecrireEnPositionXY(x,y+5,'            |\___/|');
    ecrireEnPositionXY(x,y+6,'   ___ ____/:     :\____ ___');
    ecrireEnPositionXY(x,y+7,' .''   `.-===-\   /-===-.`   ''.');
    ecrireEnPositionXY(x,y+8,'/      .-"""""-.-"""""-.      \');

end;

procedure decoCelt(x,y:Integer); // affiche un symbol celt pour déco le menu principal
begin
    ecrireEnPositionXY(x,y,'    /\    /\');
    ecrireEnPositionXY(x,y+1,'   /  \  /  \');
    ecrireEnPositionXY(x,y+2,'  / /\ \/ /\ \');
    ecrireEnPositionXY(x,y+3,' / /  \/ /  \ \');
    ecrireEnPositionXY(x,y+4,'/ / /\ \/\/\ \ \');
    ecrireEnPositionXY(x,y+5,'\ \ \/\/\ \/ / /');
    ecrireEnPositionXY(x,y+6,' \ \/ / /\/ / /');
    ecrireEnPositionXY(x,y+7,'  \ \/\/\ \/\/');
    ecrireEnPositionXY(x,y+8,'  /\/\ \/\/\ \');
    ecrireEnPositionXY(x,y+9,' / / /\  / /\ \');
    ecrireEnPositionXY(x,y+10,'/ / /\ \/ /\ \ \');
    ecrireEnPositionXY(x,y+11,'\ \/  \  /  \ \/');
    ecrireEnPositionXY(x,y+12,'/\ \   \/   /\ \');
    ecrireEnPositionXY(x,y+13,'\ \/        \ \/');
    ecrireEnPositionXY(x,y+14,'/\ \        /\ \');
    ecrireEnPositionXY(x,y+15,'\ \/        \ \/');
    ecrireEnPositionXY(x,y+16,'/\ \        /\ \');
    ecrireEnPositionXY(x,y+17,'\ \/   /\   \ \/');
    ecrireEnPositionXY(x,y+18,'/\ \  /  \  /\ \');
    ecrireEnPositionXY(x,y+19,'\ \ \/ /\ \/ / /');
    ecrireEnPositionXY(x,y+20,' \ \/ /  \/ / /');
    ecrireEnPositionXY(x,y+21,'  \ \/\/\ \/\/');
    ecrireEnPositionXY(x,y+22,'  /\/\ \/\/\ \');
    ecrireEnPositionXY(x,y+23,' / / /\/ / /\ \');
    ecrireEnPositionXY(x,y+24,'/ / /\ \/\/\ \ \');
    ecrireEnPositionXY(x,y+25,'\ \ \/\/\ \/ / /');
    ecrireEnPositionXY(x,y+26,' \ \  / /\  / /');
    ecrireEnPositionXY(x,y+27,'  \ \/ /\ \/ /');
    ecrireEnPositionXY(x,y+28,'   \  /  \  /');
    ecrireEnPositionXY(x,y+29,'    \/    \/');
end;

procedure hero(x,y:Integer); // affiche le héro
begin
    couleurTexte(LightGray);
    ecrireEnPositionXY(x+5,y,'_,.');
    ecrireEnPositionXY(x+4,y+1,',` -.)');
    ecrireEnPositionXY(x+3,y+2,'( _/-\\-._');
    ecrireEnPositionXY(x+2,y+3,'/,|`--._,-^|            ,');
    ecrireEnPositionXY(x+2,y+4,'\_| |`-._/||          ,''|');
    ecrireEnPositionXY(x+4,y+5,'|  `-, / |         /  /');
    ecrireEnPositionXY(x+4,y+6,'|     || |        /  /');
    ecrireEnPositionXY(x+5,y+7,'`r-._||/   __   /  /');
    ecrireEnPositionXY(x+1,y+8,'__,-<_     )`-/  `./  /');
    ecrireEnPositionXY(x,y+9,'''  \   `---''   \   /  /');
    ecrireEnPositionXY(x-1,y+10,'|    |           |./  /');
    ecrireEnPositionXY(x-1,y+11,'|    /           //  /');
    ecrireEnPositionXY(x,y+12,'\_/'' \         |/  /');
    ecrireEnPositionXY(x+1,y+13,'|    |   _,^-''/  /');
    ecrireEnPositionXY(x+1,y+14,'|    , ``  (\/  /');
    ecrireEnPositionXY(x+2,y+15,'\,.->._    \X-=/^');
    ecrireEnPositionXY(x+2,y+16,'(  /   `-._//^`');
    ecrireEnPositionXY(x+3,y+17,'`Y-.____(__}');
    ecrireEnPositionXY(x+4,y+18,'|     {__)');
    ecrireEnPositionXY(x+10,y+19,'()');
    couleurTexte(LightMagenta);
    ecrireEnPositionXY(x+5,y,'_,.');
    ecrireEnPositionXY(x+4,y+1,',` -.)');
    ecrireEnPositionXY(x+3,y+2,'( _/');
    ecrireEnPositionXY(x+2,y+3,'/,');
    ecrireEnPositionXY(x+2,y+4,'\_');
end;

procedure armure(x,y:Integer); // affiche une armure à l'endroit souhaité
begin
  ecrireEnPositionXY(x+8,y,'{}');
  ecrireEnPositionXY(x+7,y+1,'.--.');
  ecrireEnPositionXY(x+6,y+2,'/.--.\');
  ecrireEnPositionXY(x+6,y+3,'|====|');
  ecrireEnPositionXY(x+6,y+4,'|`::`|');
  ecrireEnPositionXY(x+2,y+5,'.-;`\..../`;-.');
  ecrireEnPositionXY(x+1,y+6,'/  |...::...|  \');
  ecrireEnPositionXY(x,y+7,'|   /''''''::''''''\   |');
  ecrireEnPositionXY(x,y+8,';--''\   ::   /\--;');
  ecrireEnPositionXY(x,y+9,'<__>,>._::_.<,<__>');
  ecrireEnPositionXY(x,y+10,'|  |/   ^^   \|  |');
  ecrireEnPositionXY(x,y+11,'\::/|        |\::/');
  ecrireEnPositionXY(x,y+12,'|||\|        |/|||');
  ecrireEnPositionXY(x,y+13,''''''' |___/\___| ''''''');
  ecrireEnPositionXY(x+5,y+14,'\_ || _/');
  ecrireEnPositionXY(x+5,y+15,'<_ >< _>');
  ecrireEnPositionXY(x+5,y+16,'|  ||  |');
  ecrireEnPositionXY(x+5,y+17,'|  ||  |');
  ecrireEnPositionXY(x+4,y+18,'_\.:||:./_');
  ecrireEnPositionXY(x+3,y+19,'/____/\____\');
end;

procedure griffon(x,y:Integer);    // affiche le griffon pour les combats
begin
  CouleurTexte(Brown);
  ecrireEnPositionXY(x+14,y,'//           //');
  ecrireEnPositionXY(x+13,y+1,'///          ///');
  ecrireEnPositionXY(x+12,y+2,'////         ////');
  ecrireEnPositionXY(x+11,y+3,'|////       /////');
  ecrireEnPositionXY(x+10,y+4,'|))//;     /)))//;');
  ecrireEnPositionXY(x+9,y+5,'/)))))/;   /)))))/;');
  ecrireEnPositionXY(x+5,y+6,'.---`,))))/;  /)))))))/;');
  ecrireEnPositionXY(x+1,y+7,'__--\/6-  \`))/; |)))))))/;');
  ecrireEnPositionXY(x,y+8,'(----/    \\\``;  |))))))/;');
  ecrireEnPositionXY(x+3,y+9,'~/-\  \\\\\``   \))))))/;');
  ecrireEnPositionXY(x+7,y+10,'\\\\\\\\`    |)))))/;');
  ecrireEnPositionXY(x+7,y+11,'|\\\\\\\\___/))))))/;__-------.');
  ecrireEnPositionXY(x+7,y+12,'//////|  %%_/))))))/;           \___,');
  ecrireEnPositionXY(x+6,y+13,'|||||||\   \%%%%)));:              \_. \');
  ecrireEnPositionXY(x+6,y+14,'|\\\\\\\\\                        |  | |');
  ecrireEnPositionXY(x+7,y+15,'\\\\\\\                          |  | |');
  ecrireEnPositionXY(x+8,y+16,'|\\\\               __|        /   / /');
  ecrireEnPositionXY(x+8,y+17,'| \\__\     \___----  |       |   / /');
  ecrireEnPositionXY(x+8,y+18,'|    / |     >     \   \      \  / /');
  ecrireEnPositionXY(x+8,y+19,'|   /  |    /       \   \      >/ /  ,,');
  ecrireEnPositionXY(x+8,y+20,'|   |  |   |         |   |    // /  //,');
  ecrireEnPositionXY(x+8,y+21,'|   |  |   |         |   |   /| |   |\\,');
  ecrireEnPositionXY(x+5,y+22,'_--''   _--''   |     _---_---''  |  \ \__/\|/');
  ecrireEnPositionXY(x+4,y+23,'(-(-===(-(-(===/    (-(-=(-(-(==/   \____/');
  couleurTexte(White); // chagement de couleur pour passer l'avant du griffon en blanc
  ecrireEnPositionXY(x+5,y+6,'.---`,');
  ecrireEnPositionXY(x+1,y+7,'__--\/6-  \');
  ecrireEnPositionXY(x,y+8,'(----/    \\\');
  ecrireEnPositionXY(x+3,y+9,'~/-\  \\\\\');
  ecrireEnPositionXY(x+7,y+10,'\\\\\\\\');
  ecrireEnPositionXY(x+7,y+11,'|\\\\\\\\');
  ecrireEnPositionXY(x+7,y+12,'//////|');
  ecrireEnPositionXY(x+6,y+13,'|||||||\');
  ecrireEnPositionXY(x+6,y+14,'|\\\\\\\\\');
  ecrireEnPositionXY(x+7,y+15,'\\\\\\\');
  ecrireEnPositionXY(x+8,y+16,'|\\\\');
  ecrireEnPositionXY(x+8,y+17,'| \\__\     \___');
  ecrireEnPositionXY(x+8,y+18,'|    / |     >');
  ecrireEnPositionXY(x+8,y+19,'|   /  |    /');
  ecrireEnPositionXY(x+8,y+20,'|   |  |   |');
  ecrireEnPositionXY(x+8,y+21,'|   |  |   |');
  ecrireEnPositionXY(x+5,y+22,'_--''   _--''   |');
  ecrireEnPositionXY(x+4,y+23,'(-(-===(-(-(===/');
end;
procedure phoenix(x,y:Integer);   // affiche le phoenix
begin
  couleurTexte(Red);
  ecrireEnPositionXY(x+16,y,'(                           )');
  ecrireEnPositionXY(x+10,y+1,') )( (                           ( ) )( (');
  ecrireEnPositionXY(x+7,y+2,'( ( ( )  ) )                     ( (   (  ) )(');
  ecrireEnPositionXY(x+6,y+3,') )     ,,\\\                     ///,,       ) (');
  ecrireEnPositionXY(x+3,y+4,'(  ((    (\\\\//                     \\////)      )');
  ecrireEnPositionXY(x+4,y+5,') )    (-(__//                       \\__)-)     (');
  ecrireEnPositionXY(x+3,y+6,'(((   ((-(__||                         ||__)-))    ) )');
  ecrireEnPositionXY(x+2,y+7,') )   ((-(-(_||           ```\__        ||_)-)-))   ((');
  ecrireEnPositionXY(x+2,y+8,'((   ((-(-(/(/\\        ''; 9.- `      //\)\)-)-))    )');
  ecrireEnPositionXY(x+3,y+9,')   (-(-(/(/(/\\      '';;;;-\~      //\)\)\)-)-)   (   )');
  ecrireEnPositionXY(x,y+10,'(  (   ((-(-(/(/(/\======,:;:;:;:,======/\)\)\)-)-))   )');
  ecrireEnPositionXY(x+4,y+11,')  ''(((-(/(/(/(//////:%%%%%%%:\\\\\\)\)\)\)-)))`  ( (');
  ecrireEnPositionXY(x+3,y+12,'((   ''((-(/(/(/(''uuuu:WWWWWWWWW:uuuu`)\)\)\)-))`    )');
  ecrireEnPositionXY(x+5,y+13,'))  ''((-(/(/(/(''|||:wwwwwwwww:|||'')\)\)\)-))`    ((');
  ecrireEnPositionXY(x+2,y+14,'(   ((   ''((((/(/(''uuu:WWWWWWWWW:uuu`)\)\))))`     ))');
  ecrireEnPositionXY(x+8,y+15,'))   '':::UUUUUU:wwwwwwwww:UUUUUU:::``     ((   )');
  ecrireEnPositionXY(x+10,y+16,'((      ''''''''''''''\uuuuuuuu/``````         ))');
  ecrireEnPositionXY(x+11,y+17,'))            `JJJJJJJJJ`           ((');
  ecrireEnPositionXY(x+13,y+18,'((            LLLLLLLLLLL         ))');
  ecrireEnPositionXY(x+15,y+19,'))         ///|||||||\\\       ((');
  ecrireEnPositionXY(x+17,y+20,'))      (/(/(/(^)\)\)\)       ((');
  ecrireEnPositionXY(x+18,y+21,'((                           ))');
  ecrireEnPositionXY(x+20,y+22,'((                       ((');
  ecrireEnPositionXY(x+22,y+23,'( )( ))( ( ( ) )( ) (()');
end;
procedure dragon1(x,y:Integer);  // affiche le 1er dragon
begin
  couleurTexte(Yellow);
  ecrireEnPositionXY(x+3,y,'(  )   /\   _                 (');
  ecrireEnPositionXY(x+4,y+1,'\ |  (  \ ( \.(               )                      _____');
  ecrireEnPositionXY(x+2,y+2,'\  \ \  `  `   ) \             (  ___                 / _   \');
  ecrireEnPositionXY(x+1,y+3,'(_`    \+   . x  ( .\            \/   \____-----------/ (o)   \_');
  ecrireEnPositionXY(x,y+4,'- .-               \+  ;          (  O                           \____');
  ecrireEnPositionXY(x+24,y+5,')        \_____________  `              \  /');
  ecrireEnPositionXY(x,y+6,'(__                +- .( -''.- <. - _  VVVVVVV VV V\                 \/');
  ecrireEnPositionXY(x,y+7,'(_____            ._._: <_ - <- _  (--  _AAAAAAA__A_/               |');
  ecrireEnPositionXY(x+2,y+8,'.    /./.+-  . .- /  +--  - .     \______________//_              \_______');
  ecrireEnPositionXY(x+2,y+9,'(__ '' /x  / x _/ (                                  \___''          \     /');
  ecrireEnPositionXY(x+1,y+10,', x / ( ''  . / .  /                                      |           \   /');
  ecrireEnPositionXY(x+4,y+11,'/  /  _/ /    +                                      /              \/');
  ecrireEnPositionXY(x+3,y+12,'''  (__/                                             /                  \');
  couleurTexte(LightRed); // changement de couleur pour colorier les flammes en rouges
  ecrireEnPositionXY(x+3,y,'(  )   /\   _');
  ecrireEnPositionXY(x+4,y+1,'\ |  (  \ ( \.(');
  ecrireEnPositionXY(x+2,y+2,'\  \ \  `  `   ) \');
  ecrireEnPositionXY(x+1,y+3,'(_`    \+   . x  ( .\');
  ecrireEnPositionXY(x,y+4,'- .-               \+  ;');
  ecrireEnPositionXY(x+24,y+5,')`');
  ecrireEnPositionXY(x,y+6,'(__                +- .( -''.- <. - _ ');
  ecrireEnPositionXY(x,y+7,'(_____            ._._: <_ - <- _');
  ecrireEnPositionXY(x+2,y+8,'.    /./.+-  . .- /  +--  - .');
  ecrireEnPositionXY(x+2,y+9,'(__ '' /x  / x _/ (');
  ecrireEnPositionXY(x+1,y+10,', x / ( ''  . / .  /');
  ecrireEnPositionXY(x+4,y+11,'/  /  _/ /    +');
  ecrireEnPositionXY(x+3,y+12,'''  (__/ ');

end;
procedure dragon2(x,y:Integer); // affiche le 2e dragon
begin
  couleurTexte(Blue);
  ecrireEnPositionXY(x+13,y,'(');
  ecrireEnPositionXY(x+11,y+1,')  )        \/');
  ecrireEnPositionXY(x+9,y+2,'(   ) @       /^');
  ecrireEnPositionXY(x+7,y+3,')  )) @@  )    /  ^');
  ecrireEnPositionXY(x+6,y+4,'( ( ) )@@      /    ^');
  ecrireEnPositionXY(x+4,y+5,'))  ( @@ @ )    /      ^');
  ecrireEnPositionXY(x+3,y+6,'( ( @@@@@(@     /       |\_/|,');
  ecrireEnPositionXY(x+2,y+7,')  )@@@(@@@     /      _/~/~/~|C');
  ecrireEnPositionXY(x,y+8,'((@@@(@@@@@(     /     _(@)~(@)~/\C');
  ecrireEnPositionXY(x+2,y+9,'))@@@(@@)@@   /     /~/~/~/~/`\~`C');
  ecrireEnPositionXY(x+3,y+10,')@@@@(@@)@@@(     (o~/~o)^,) \~ \C');
  ecrireEnPositionXY(x+4,y+11,'( (@@@)@@@(@@@@@@_~^~^~,-/\~ \~ \C/');
  ecrireEnPositionXY(x+6,y+12,'@ )@@@(@@@@@@@   \^^^/  (`^\.~^ C');
  ecrireEnPositionXY(x+7,y+13,'(@ (@@@@(@@      `''  (( ~  .` .');
  ecrireEnPositionXY(x+11,y+14,'@@@@@             (((` ~ .-~');
  ecrireEnPositionXY(x+10,y+15,'/                 /~((((` . ~');
  ecrireEnPositionXY(x+9,y+16,'/                 /~-((((((`.\');
  ecrireEnPositionXY(x+8,y+17,'/                 /-~-/(((((((`');
  ecrireEnPositionXY(x+7,y+18,'/                 /~-~/  `((((((');
  ecrireEnPositionXY(x+6,y+19,'/              ___/-~-/     `""""');
  ecrireEnPositionXY(x+5,y+20,'/         _____/  /~-~/');
  ecrireEnPositionXY(x+4,y+21,'/    _____/        ((((');
  ecrireEnPositionXY(x+4,y+22,'\___/');
  couleurTexte(LightBlue); // changement de couleur pour colorier les flammems en bleu clair
  ecrireEnPositionXY(x+13,y,'(');
  ecrireEnPositionXY(x+11,y+1,')  ) ');
  ecrireEnPositionXY(x+9,y+2,'(   ) @');
  ecrireEnPositionXY(x+7,y+3,')  )) @@  )');
  ecrireEnPositionXY(x+6,y+4,'( ( ) )@@');
  ecrireEnPositionXY(x+4,y+5,'))  ( @@ @ )');
  ecrireEnPositionXY(x+3,y+6,'( ( @@@@@(@');
  ecrireEnPositionXY(x+2,y+7,')  )@@@(@@@');
  ecrireEnPositionXY(x,y+8,'((@@@(@@@@@(');
  ecrireEnPositionXY(x+2,y+9,'))@@@(@@)@@');
  ecrireEnPositionXY(x+3,y+10,')@@@@(@@)@@@(');
  ecrireEnPositionXY(x+4,y+11,'( (@@@)@@@(@@@@@@');
  ecrireEnPositionXY(x+6,y+12,'@ )@@@(@@@@@@@');
  ecrireEnPositionXY(x+7,y+13,'(@ (@@@@(@@');
  ecrireEnPositionXY(x+11,y+14,'@   @');
end;

procedure plancher();  // affiche l'arrière plan de la chambre
begin
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |');
  writeln('                  |__________________________________________________________________________________________________________________________________');
  writeln('                 /|__________________________________________________________________________________________________________________________________');
  writeln('                / /\     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \   ');
  writeln('               / /  \     \     \     \     \_____\     \     \     \     \     \     \     \     \_____\     \     \     \     \_____\     \_____\  ');
  writeln('              / /    \_____\     \     \     \     \     \     \     \_____\     \     \     \     \     \     \     \_____\     \     \     \     \_');
  writeln('             / /\     \     \     \_____\     \     \     \_____\     \     \     \     \     \_____\     \     \     \     \     \     \_____\     \');
  writeln('            / /  \     \     \_____\     \     \     \_____\     \     \     \_____\     \     \     \     \_____\     \     \     \     \     \     ');
  writeln('           / /    \_____\     \     \     \_____\     \     \     \_____\     \     \     \_____\     \     \     \     \     \     \     \     \    ');
  writeln('          / /\     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \_____\     \_____\     \     \   ');
  writeln('         / /  \     \     \     \     \     \     \     \     \     \     \     \     \_____\     \     \     \     \     \     \     \     \     \__');
  writeln('        / /    \     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \_____\     \     \     \     \_____\     \ ');
  writeln('       / /\     \     \     \_____\     \     \     \_____\     \     \     \_____\     \     \     \     \     \     \     \_____\     \     \     \');
  writeln('      / /__\     \_____\     \     \     \     \     \     \     \     \     \     \     \     \     \_____\     \     \     \     \_____\     \_____');
  writeln('     / /    \     \     \     \     \_____\     \_____\     \     \     \     \     \_____\     \     \     \     \     \     \     \     \     \    ');
  writeln('    / /\     \_____\     \     \     \     \_____\     \     \     \_____\     \     \     \     \     \     \     \_____\     \     \     \     \   ');
  writeln('   / /__\     \     \     \     \     \     \     \     \     \     \     \     \     \     \     \_____\     \     \     \     \     \     \     \  ');
  writeln('  / /    \_____\     \     \     \     \     \     \     \     \_____\     \     \     \     \     \     \     \     \     \_____\     \     \_____\ ');
  writeln(' / /\     \     \     \     \_____\     \_____\     \     \     \     \     \_____\     \     \     \     \_____\     \     \     \     \_____\     \');
  writeln('/ /  \     \     \     \     \     \     \     \     \_____\     \     \     \     \     \_____\     \     \     \_____\     \     \     \     \     ');
end;

procedure burger(x,y:Integer); // affiche le burger
begin
  ecrireEnPositionXY(x+4,y,'_..----.._');
  ecrireEnPositionXY(x+2,y+1,'.''     o    ''.');
  ecrireEnPositionXY(x+1,y+2,'/   o       o  \ ');
  ecrireEnPositionXY(x,y+3,'|o        o     o|');
  ecrireEnPositionXY(x,y+4,'/''-.._o     __.-''\');
  ecrireEnPositionXY(x,y+5,'\      `````     /');
  ecrireEnPositionXY(x,y+6,'|``--........--''`|');
  ecrireEnPositionXY(x+1,y+7,'\              /');
  ecrireEnPositionXY(x+2,y+8,'`''----------''`');
  end;
procedure frite(x,y:Integer); // affiche les frites
begin
  ecrireEnPositionXY(x+1,y,'|\ /| /|_/|');
  ecrireEnPositionXY(x-1,y+1,'|\||-|\||-/|/|');
  ecrireEnPositionXY(x,y+2,'\\|\|//||///');
  ecrireEnPositionXY(x,y+3,'|\/\||//||||');
  ecrireEnPositionXY(x,y+4,'|||\\|/\\ ||');
  ecrireEnPositionXY(x,y+5,'|||\\|/\\ ||');
  ecrireEnPositionXY(x,y+6,'| ''./\_/.'' |');
  ecrireEnPositionXY(x,y+7,'|          |');
  ecrireEnPositionXY(x,y+8,'|          |');
  ecrireEnPositionXY(x,y+9,'|          |');
  ecrireEnPositionXY(x+1,y+10,'''.______.''');
end;
procedure biere(x,y:Integer); // affiche la biere
begin
  ecrireEnPositionXY(x-1,y,'.   *   ..  . *  *');
  ecrireEnPositionXY(x-3,y+1,'*  * @()Ooc()*   o  .');
  ecrireEnPositionXY(x+1,y+2,'(Q@*0CG*O()  ___');
  ecrireEnPositionXY(x,y+3,'|\_________/|/ _ \');
  ecrireEnPositionXY(x,y+4,'|  |  |  |  | / | |');
  ecrireEnPositionXY(x,y+5,'|  |  |  |  | | | |');
  ecrireEnPositionXY(x,y+6,'|  |  |  |  | | | |');
  ecrireEnPositionXY(x,y+7,'|  |  |  |  | | | |');
  ecrireEnPositionXY(x,y+8,'|  |  |  |  | | | |');
  ecrireEnPositionXY(x,y+9,'|  |  |  |  | \_| |');
  ecrireEnPositionXY(x,y+10,'|  |  |  |  |\___/');
  ecrireEnPositionXY(x,y+11,'|\_|__|__|_/|');
  ecrireEnPositionXY(x+1,y+12,'\_________/');
  end;

procedure affichage(x,y:Integer;objet:string); // lance l'affichage de l'objet/monstre demandé
begin
  case objet of
  'plancher':plancher();
  'griffon':griffon(x,y);
  'phoenix':phoenix(x,y);
  'dragon1':dragon1(x,y);
  'dragon2':dragon2(x,y);
  'armure':armure(x,y);
  'hero':hero(x,y);
  'decoCelt':decoCelt(x,y);
  'marchand':marchand(x,y);
  'epee':epee(x,y);
  'croix':croix(x,y);
  'lit':lit(x,y);
  'coffre':coffre(x,y);
  'grCoffre':grCoffre(x,y);
  'enclume':enclume(x,y);
  'grLit':grLit(x,y);
  'burger':burger(x,y);
  'frite':frite(x,y);
  'biere':biere(x,y);
  end;
end;

end.
