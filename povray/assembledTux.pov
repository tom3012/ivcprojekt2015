//------------------------------------------------------------------------------
// Include-Dateien

#include "tux.pov"
#include "textures.inc"
#include "stars.inc"


//------------------------------------------------------------------------------
// Deklarationen

#declare radiusfoot=radiustummy / 2.5;
#declare amplitudeFoot = 15;
#declare StepWidth = 1;
#declare amplitudeWobble = 8;


//------------------------------------------------------------------------------
// Tux Assembly

#declare AssembledTux =
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
  object{ Wing }

  // Rechter Fluegel
  object{
    Wing
    rotate 180 * y
  }

  // Linker Fuss
  object{
    Foot
    translate <-radiustummy / 2, 0, 0>
  }

  // Rechter Fuss
  object{
    Foot
    translate <radiustummy / 2, 0, 0>
  }

  //Schwanz
  object{ Tail }
}

