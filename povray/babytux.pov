//------------------------------------------------------------------------------
// Include-Dateien

#include "tux.pov"
#include "soother.pov"
#include "bow.pov"
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
#declare BabyTux =
union{
  union{
    sphere{
      0,  radiushead
      pigment{ Gray10 }
    }
    object{
      LeftEye
      rotate <10, 20, 0>
    }
    object{
      RightEye
      rotate <10, -20, 0>
    }
    union{
      object{
        Beak
      }
      //Schnuller
      object{
        Soother
        translate <0, -0.25, -radiushead - 0.15 >
      }
      translate sin(clock * 2 * pi-radiushead - 0.15) * z * 0.02
    }
    translate radiustummy * 2 * y
  }

  // Bauch
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

  //Schleife
  object{
    Bow
    rotate <40, -20, -20>
    scale <0.2, 0.2, 0.2>
    translate <0.15, 2 * radiustummy + (radiushead / 2), -0.25>
  }
}

