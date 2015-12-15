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
#declare End      = 10.0;
#declare My_Clock = Start + (End - Start) * clock;


//-----------------------------------------------------------------------------
//Assembly

#if (My_Clock <= 1)
  object{
    Egg
    scale <0.9, 0.9, 0.9>
    translate <0, 0.7, 0>
    rotate <0, 0, sin(My_Clock * 2 * pi) * 20>
  }

#elseif (My_Clock <= 2)
  #declare My_Clock = My_Clock - 1;

  object{
    Egg
    scale <0.9, 0.9, 0.9>
    translate <0, 0.7, 0>
  }

#elseif (My_Clock <= 3)
  #declare My_Clock = My_Clock - 2;
  object{
    Egg
    scale <0.9, 0.9, 0.9>
    translate <0, 0.7, 0>
    rotate <0, 0, sin(My_Clock * 2 * pi) * 15>
  }

#elseif (My_Clock <= 4)
  #declare My_Clock = My_Clock - 3;

  object{
    Egg
    scale <0.9, 0.9, 0.9>
    translate <0, 0.7, 0>
  }

#elseif (My_Clock <= 5)
  #declare My_Clock = My_Clock - 4;

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
      scale <My_Clock + 1.2, 1, My_Clock + 1.2>
    }
  }

  object{ BabyTux }

#elseif (My_Clock <= 6)
  #declare My_Clock = My_Clock - 5;

  object{
    Egg_upperpart_empty
    rotate <My_Clock * 90, 0, 0>
    translate <0, 0.7 + My_Clock, My_Clock>
  }

  object {
    Egg_lowerpart_empty
    translate <0, 0.7, 0>
  }

  object{ BabyTux }

#elseif (My_Clock <= 7)
  #declare My_Clock = My_Clock - 6;

  object{
    Egg_lowerpart_empty
    translate <0, 0.7, 0>
  }
  object{ DiscoveringTux }

#else
  #declare My_Clock = My_Clock - 7;
  union{
    object {
      Egg_lowerpart_empty
      translate <0, 0.7, 0>
    }
    object{ BabyTux }
    rotate <0, 0, sin(My_Clock * 2 * pi) * 20>
  }
#end

