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
// Kameraeinstellungen

camera{
  location <0, 2, -10>
  look_at <0, 0, 0>
  angle 36
  //rotate 360 * clock * y
}

light_source{
  <500, 500, -1000>
  White
}


//------------------------------------------------------------------------------
// Umgebung

//background{ Blue_Sky2 }
sphere{
  <0, 0, 0>, 1
  texture{ Starfield1 scale 0.25 }
  scale 10000
}

plane {
  <0, 1, 0>, -0.01
  texture{ EMBWood1 }
}

//------------------------------------------------------------------------------
// Tux Assembly
#declare BabyTux =
union{
  union{
    sphere{
      0,  radiushead
      pigment{  Gray10 }
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
      object{ Beak }
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
    //translate <0, 0, -radiusfoot>
    //rotate -x * amplitudeFoot * sin(clock * 2 * pi + 20)
    translate <-radiustummy / 2, 0, 0>
  }

  // Rechter Fuss
  object{
    Foot
    //translate <0, 0, -radiusfoot>
    //rotate x * amplitudeFoot * sin(clock * 2 * pi + 20)
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

object{ BabyTux }

