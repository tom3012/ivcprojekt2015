//------------------------------------------------------------------------------
// Include-Dateien

#include "tux.pov"
#include "babytux.pov"
#include "egg.pov"
#include "environment.pov"
#include "crack.pov"
#include "babytux_discovers.pov"
#include "textures.inc"
#include "stars.inc"


//------------------------------------------------------------------------------
// Deklarationen

#declare radiusfoot=radiustummy / 2.5;
#declare amplitudeFoot = 15;
#declare StepWidth = 1;
#declare amplitudeWobble = 8;
#declare Start    = 0.0;
#declare End      = 14.0;
#declare My_Clock = Start + (End - Start) * clock;

#declare v0 = <5,5,0>;       // Anfangsgeschwindigkeit
#declare g = <0,-10,0> ;     // Fallbeschleunigung

//-----------------------------------------------------------------------------
//Assembly
/* Zeiteinheiten
 1 - 

 10- hochspringen
 11- salto
 12- runterspringen
 13- Kamera zurück fahren
*/

#if (My_Clock <= 1)
  #declare clock1 = My_Clock;
  object{
    Egg
    scale <0.9, 0.9, 0.9>
    translate <0, 0.7, 0>
    rotate <0, 0, sin(clock1 * 2 * pi) * 20>
  }

#elseif (My_Clock <= 2)

  object{
    Egg
    scale <0.9, 0.9, 0.9>
    translate <0, 0.7, 0>
  }

#elseif (My_Clock <= 3)
  #declare clock3 = My_Clock - 2;
  object{
    Egg
    scale <0.9, 0.9, 0.9>
    translate <0, 0.7, 0>
    rotate <0, 0, sin(clock3 * 2 * pi) * 15>
  }

#elseif (My_Clock <= 4)

  object{
    Egg
    scale <0.9, 0.9, 0.9>
    translate <0, 0.7, 0>
  }

#elseif (My_Clock <= 5)
  #declare clock5 = My_Clock - 4;

  difference{
    union{
      object{
        Egg_upperpart_empty
        translate <0, 0.7, 0>
      }
      object{
        Egg_lowerpart_empty
        translate <0, 0.7, 0>
      }
    }
    object{
      Crack
      translate <0, 0.7, 0>
      scale <clock5 + 1.2, 1, clock5 + 1.2>
    }
  }

  object{ BabyTux }

#elseif (My_Clock <= 6)
  #declare clock6 = My_Clock - 5;

  object{
    Egg_upperpart_empty
    rotate <clock6 * 90, 0, 0>
    translate <0, 0.7 + clock6, clock6>
  }

  object {
    Egg_lowerpart_empty
    translate <0, 0.7, 0>
  }

  object{ BabyTux }

#elseif (My_Clock <= 7)

  object{
    Egg_lowerpart_empty
    translate <0, 0.7, 0>
  }
  object{ DiscoveringTux }

#elseif (My_Clock <= 10)
  #declare clock8 = My_Clock - 7;
  union{
    object {
      Egg_lowerpart_empty
      translate <0, 0.7, 0>
    }
    object{ BabyTux }
    rotate <0, 0, sin(clock8 * 2 * pi) * 20>
  }
#elseif(My_Clock <=11)
  #declare clock11 = My_Clock - 10;
  union{
    object {
      Egg_lowerpart_empty
      translate <0, 0.7, 0>
    }
    object{ 
      BabyTux 
      translate <0,clock11*1.5,-clock11*1>
      //rotate <My_Clock*90,0,0>
    }
  }
#elseif(My_Clock <=12)
  #declare clock12 = My_Clock - 11;
  union{
    object {
      Egg_lowerpart_empty
      translate <0, 0.7, 0>
    }
    object{ 
      BabyTux 
      translate <0,-0.5,0>
      rotate <clock12*-360,0,0>
      translate <0,2,-1>
    }
  }
#elseif(My_Clock <=13)
  #declare clock13 = My_Clock - 12;
  union{
    object {
      Egg_lowerpart_empty
      translate <0, 0.7, 0>
    }
    object{ 
      BabyTux 
      translate <0,1.5,-1>
      translate <0,-clock13*1.5,-clock13*1>
      //rotate <My_Clock*90,0,0>
    }
  }
#elseif(My_Clock <=14)
  
  union{
    object {
      Egg_lowerpart_empty
      translate <0, 0.7, 0>
    }
    object{ 
      BabyTux 
      translate <0,0,-2>
      //translate <0,-clock13*1.5,-clock13*1>
      //rotate <My_Clock*90,0,0>
    }
  }

#end

camera{
  location <0, 2, -8>
  look_at <0, 1, 0>
  angle 36
  //rotate 360 * clock * y
  #if(My_Clock <= 8)
    /*do nothing*/
  #elseif(My_Clock <= 9)
    #declare clock9 = My_Clock - 8;
    translate <0,clock9*1,-clock9*4>
    rotate <0,30*clock9,0>
  #elseif (My_Clock <= 13)
    translate <0,1,-4>
    rotate 30 *y
    /*do something*/
  #elseif (My_Clock <= 14)
    #declare clock14 = My_Clock -13;
    translate <0,1,-4>
    rotate 30 * y
    rotate -30 * y * clock14
    translate <0,-1*clock14,2*clock14>
  #end
}

