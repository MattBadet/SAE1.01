unit utilities;
//Le role de cette unité est d'initialiser tous les objets du jeu.
//J'ai fais cela car celui ci prend beaucoup de place dans une autre unité.
{$mode objfpc}{$H+}
{$codepage UTF8}
interface

uses
  Classes, SysUtils;

type
  //RECORD BOMBE
  bombe = packed record
    nom:string;
    desc:string;
    degat:integer;
    prix:integer;
    id:integer;
  end;
  //RECORD POTION
  potion = packed record
    nom:string;
    desc:string;
    effet:integer;
    prix:integer;
    id:integer;
  end;
  //RECORD OBJET
  objet = packed record
    nom:string;
    desc:string;
    stack:integer;
  end;
  //RECORD ARME
  arme = packed record
    nom:string;
    desc:string;
    degat:integer;
    material:string;
    idmaterial: integer;
    id: integer;
  end;
  //RECORD ARMURE
  armure = packed record
    nom:string;
    desc:string;
    partie:string;
    def:integer;
    material:string;
    idmaterial: integer;
    id: integer;
  end;

var
  //INVENTAIRES
  invarme:array[1..15] of arme;
  invarmure:array[1..15] of armure;
  invpotion:array[1..5] of potion;
  invbombe:array[1..3] of bombe;
  choix,i:integer;
const
  //ARMURE
  nullarmure: armure = (
              nom:'null';
              desc:'null';
              partie:'null';
              def:0;
              material:'null';
              idmaterial: 0;
              id: 0;
  );
//CUIRE
  casquecuire: armure = (
               nom:'casque en cuire';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:25;
               material:'cuire';
               idmaterial: 1;
               id: 1;
  );
  plastroncuire: armure = (
               nom:'plastron en cuire';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:100;
               material:'cuire';
               idmaterial: 1;
               id: 2;
  );
  jambierecuire: armure = (
               nom:'jambiere en cuire';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:50;
               material:'cuire';
               idmaterial: 1;
               id: 3;
  );
  bottescuire: armure = (
               nom:'bottes en cuire';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:25;
               material:'cuire';
               idmaterial: 1;
               id: 4;
  );
//FER
  casquefer: armure = (
               nom:'casque en fer';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:100;
               material:'fer';
               idmaterial: 2;
               id: 5;
  );
  plastronfer: armure = (
               nom:'plastron en fer';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:300;
               material:'fer';
               idmaterial: 2;
               id: 6;
  );
  jambierefer: armure = (
               nom:'jambiere en fer';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:200;
               material:'fer';
               idmaterial: 2;
               id: 7;
  );
  bottesfer: armure = (
               nom:'bottes en fer';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:100;
               material:'fer';
               idmaterial: 2;
               id: 8;
  );
  bouclierfer: armure = (
               nom:'bouclier en fer';
               desc:'pour se protéger';
               partie:'bouclier';
               def:150;
               material:'fer';
               idmaterial: 2;
               id: 9;
  );
//ACIER
casqueacier: armure = (
               nom:'casque en acier';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:150;
               material:'acier';
               idmaterial: 3;
               id: 10;
  );
  plastronacier: armure = (
               nom:'plastron en acier';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:600;
               material:'acier';
               idmaterial: 3;
               id: 11;
  );
  jambiereacier: armure = (
               nom:'jambiere en acier';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:300;
               material:'acier';
               idmaterial: 3;
               id: 12;
  );
  bottesacier: armure = (
               nom:'bottes en acier';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:150;
               material:'acier';
               idmaterial: 3;
               id: 13;
  );
  bouclieracier: armure = (
               nom:'bouclier en fer';
               desc:'pour se protéger';
               partie:'bouclier';
               def:200;
               material:'acier';
               idmaterial: 3;
               id: 14;
  );
//ECAILLE DE DRAGON
casquescale: armure = (
               nom:'casque en écaille de dragon';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:250;
               material:'scale';
               idmaterial: 4;
               id: 15;
  );
  plastronscale: armure = (
               nom:'plastron en écaille de dragon';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:1000;
               material:'scale';
               idmaterial: 4;
               id: 16;
  );
  jambierescale: armure = (
               nom:'jambiere en écaille de dragon';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:500;
               material:'scale';
               idmaterial: 4;
               id: 17;
  );
  bottesscale: armure = (
               nom:'bottes en écaille de dragon';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:250;
               material:'scale';
               idmaterial: 4;
               id: 18;
  );
  bouclierscale: armure = (
               nom:'bouclier en écaille de dragon';
               desc:'pour se protéger';
               partie:'bouclier';
               def:350;
               material:'scale';
               idmaterial: 4;
               id: 19;
  );
  //BOMBE
  nullbombe: bombe = (
             nom:'null';
             desc:'null';
             degat:0;
             prix:0;
             id:0;
  );
  bombepetite: bombe = (
         nom:'bombe petite';
         desc:'une bombe qui explose';
         degat:100;
         prix:3;
         id:1;
  );
  bombemoyenne: bombe = (
                nom:'bombe grande';
                desc:'une bombequi explose plus fort';
                degat:300;
                prix:7;
                id:2;
  );
  //POTION
  nullpotion: potion = (
              nom:'null';
              desc:'null';
              effet:0;
              prix:0;
              id:0;
  );
  petitepotion: potion = (
                nom:'petite';
                desc:'petite potion';
                effet:10;
                prix:5;
                id:3;
  );
  moyennepotion: potion = (
                nom:'moyenne';
                desc:'moyenne potion';
                effet:20;
                prix:10;
                id:4;
  );
  grandepotion: potion = (
                nom:'grande';
                desc:'grande potion';
                effet:30;
                prix:15;
                id:5;
  );
  //EPEE
  nullarm: arme = (
        nom:'null';
        desc:'null';
        degat:0;
        material:'null';
        idmaterial:0;
        id: 0;
  );
  epeebois: arme = (
         nom:'epee en bois';
         desc:'pour le combat';
         degat:25;
         material: 'bois';
         idmaterial: 7;
         id: 20;
  );
  epeefer: arme = (
         nom:'epee en fer';
         desc:'pour le combat';
         degat:50;
         material: 'fer';
         idmaterial: 2;
         id: 21;
  );
  epeeacier: arme = (
         nom:'epee en acier';
         desc:'pour le combat';
         degat:100;
         material: 'acier';
         idmaterial: 3;
         id: 22;
  );
  epeescale: arme = (
         nom:'epee en écaille de dragon';
         desc:'pour le combat';
         degat:200;
         material: 'scale';
         idmaterial: 4;
         id: 23;
  );
  epeedemo: arme = (
         nom:'epee en reste démoniaque';
         desc:'pour le combat';
         degat:250;
         material: 'reste';
         idmaterial:5;
         id: 24;
  );

implementation

end.
