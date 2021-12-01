unit utilities;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  bombe = packed record
    nom:string;
    desc:string;
    degat:integer;
    prix:integer;
  end;

  potion = packed record
    nom:string;
    desc:string;
    effet:integer;
    prix:integer;
  end;
  objet = packed record
    nom:string;
    desc:string;
    stack:integer;
  end;
  arme = packed record
    nom:string;
    desc:string;
    degat:integer;
    material:string;
  end;
  armure = packed record
    nom:string;
    desc:string;
    partie:string;
    def:integer;
    material:string;
  end;

var
  invobjet:array[1..15] of objet;
  invarme:array[1..15] of arme;
  invpotion:array[1..5] of potion;
  invbombe:array[1..3] of bombe;
  invarmure:array[1..5] of armure;
  choix,i:integer;
const
  nullarmure: armure = (
              nom:'null';
              desc:'null';
              partie:'null';
              def:0;
              material:'null';
  );
//CUIRE
  casquecuire: armure = (
               nom:'casque en cuire';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:150;
               material:'cuire';
  );
  plastroncuire: armure = (
               nom:'plastron en cuire';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:5;
               material:'cuire';
  );
  jambierecuire: armure = (
               nom:'jambiere en cuire';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:150;
               material:'cuire';
  );
  bottescuire: armure = (
               nom:'bottes en cuire';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:150;
               material:'cuire';
  );
//FER
  casquefer: armure = (
               nom:'casque en fer';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:250;
               material:'fer';
  );
  plastronfer: armure = (
               nom:'plastron en fer';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:250;
               material:'fer';
  );
  jambierefer: armure = (
               nom:'jambiere en fer';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:250;
               material:'fer';
  );
  bottesfer: armure = (
               nom:'bottes en fer';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:250;
               material:'fer';
  );
  bouclierfer: armure = (
               nom:'bouclier en fer';
               desc:'pour se protéger';
               partie:'bouclier';
               def:250;
               material:'fer';
  );
//ACIER
casqueacier: armure = (
               nom:'casque en acier';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:15;
               material:'acier';
  );
  plastronacier: armure = (
               nom:'plastron en acier';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:15;
               material:'acier';
  );
  jambiereacier: armure = (
               nom:'jambiere en acier';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:15;
               material:'acier';
  );
  bottesacier: armure = (
               nom:'bottes en acier';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:15;
               material:'acier';
  );
  bouclieracier: armure = (
               nom:'bouclier en fer';
               desc:'pour se protéger';
               partie:'bouclier';
               def:15;
               material:'acier';
  );
//ECAILLE DE DRAGON
casquescale: armure = (
               nom:'casque en écaille de dragon';
               desc:'à mettre sur la tête';
               partie:'casque';
               def:10;
               material:'scale';
  );
  plastronscale: armure = (
               nom:'plastron en écaille de dragon';
               desc:'à mettre sur le haut du corps';
               partie:'plastron';
               def:10;
               material:'scale';
  );
  jambierescale: armure = (
               nom:'jambiere en écaille de dragon';
               desc:'à mettre sur le bas du corps';
               partie:'jambiere';
               def:10;
               material:'scale';
  );
  bottesscale: armure = (
               nom:'bottes en écaille de dragon';
               desc:'à mettre sur les pieds';
               partie:'bottes';
               def:10;
               material:'scale';
  );
  bouclierscale: armure = (
               nom:'bouclier en écaille de dragon';
               desc:'pour se protéger';
               partie:'bouclier';
               def:10;
               material:'scale';
  );

  nullbombe: bombe = (
             nom:'null';
             desc:'null';
             degat:0;
             prix:0;
  );
  bombepetite: bombe = (
         nom:'bombe petite';
         desc:'une bombe qui explose';
         degat:100;
         prix:3;
  );
  bombemoyenne: bombe = (
                nom:'bombe grande';
                desc:'une bombequi explose plus fort';
                degat:300;
                prix:7;
  );
  nullpotion: potion = (
              nom:'null';
              desc:'null';
              effet:0;
              prix:0;
  );
  petitepotion: potion = (
                nom:'petite';
                desc:'petite potion';
                effet:10;
                prix:5;
  );
  moyennepotion: potion = (
                nom:'moyenne';
                desc:'moyenne potion';
                effet:20;
                prix:10;
  );
  grandepotion: potion = (
                nom:'petite';
                desc:'grande potion';
                effet:30;
                prix:15;
  );
  nullarm: arme = (
        nom:'null';
        desc:'null';
        degat:0;
  );
  epeefer: arme = (
         nom:'epee en fer';
         desc:'pour le combat';
         degat:5;
         material: 'fer';
  );
  epeeacier: arme = (
         nom:'epee en acier';
         desc:'pour le combat';
         degat:5;
         material: 'acier';
  );
  epeescale: arme = (
         nom:'epee en écaille de dragon';
         desc:'pour le combat';
         degat:5;
         material: 'scale';
  );
  epeedemo: arme = (
         nom:'epee en reste démoniaque';
         desc:'pour le combat';
         degat:5;
         material: 'reste';
  );
  nullobj: objet = (
           nom:'null';
           desc:'null';
  );
  fer: objet = (
       nom:'fer';
       desc:'fer';
       stack:1;
  );
  acier: objet = (
       nom:'acier';
       desc:'acier';
       stack:1;
  );
  scale: objet = (
       nom:'scale';
       desc:'scale';
       stack:1;
  );
  reste: objet = (
       nom:'reste';
       desc:'reste démoniaque';
       stack:1;
  );

implementation

end.
