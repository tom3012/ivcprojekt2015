//------------------------------------------------------------------------------
// Include-Dateien

#include "tux.pov"
#include "textures.inc"
#include "stars.inc"
//#include "environment.pov"


//------------------------------------------------------------------------------
// Deklarationen

#declare radiusfoot=radiustummy / 2.5;
#declare amplitudeFoot = 15;
#declare StepWidth = 1;
#declare amplitudeWobble = 8;


//------------------------------------------------------------------------------
// Tux Assembly

#declare WalkingTux =
union{
  object{
    Head
    translate radiustummy * 2 * y
  }
  object{
    Tummy
    translate radiustummy * y
  }

  // Linker Fluegel
  object{
    Wing
  }

  // Rechter Fluegel
  object{
    Wing
    rotate 180 * y
  }

  // Linker Fuss
  object{
    Foot
    translate <0, 0, -radiusfoot>
    rotate -x * amplitudeFoot * sin(clock * 2 * pi + 20)
    translate <-radiustummy / 2, 0, 0>
  }

  // Rechter Fuss
  object{
    Foot
    translate <0, 0, -radiusfoot>
    rotate x * amplitudeFoot * sin(clock * 2 * pi + 20)
    translate <radiustummy / 2, 0, 0>
  }

  //Schwanz
  object{ Tail }
}

/*object{
  WalkingTux
  //translate <0, 0, -StepWidth * clock>
  rotate z * sin(clock * 2 * pi) * amplitudeWobble
}*/

