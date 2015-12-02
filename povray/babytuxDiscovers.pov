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
#declare amplitudeWave = 5;


//------------------------------------------------------------------------------
// Kameraeinstellungen

camera{
  location <0, 2, -5>
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
  #declare Start    = 0.0;
  #declare End      = 2.0;
  #declare My_Clock = Start + (End - Start) * clock;
  #if (My_Clock <= 1)
    #declare clock1 = My_Clock;
    #declare clock2 = 0;
  #else
    #declare clock2 = My_Clock - 1;
    #declare clock1 = 1;
  #end

  //Head
  object{
    Head
    translate radiustummy * 2 * y
    rotate y * -40
    rotate sin(clock * pi) * y * 80
  }

  // Bauch
  object{
    Tummy
    translate radiustummy * y
  }

  // Linker Fluegel
  object{
    Wing
    translate <-wingX, -wingY, 0>
    rotate <clock2 * 90, 0, sin(clock2 * 2 * pi) * amplitudeWave>
    translate <wingX, wingY, 0>
  }

  // Rechter Fluegel
  object{
    Wing
    rotate 180 * y
    translate <-wingX, -wingY, 0>
    rotate <clock1 * 90, 0, sin(clock1 * 2 * pi) * amplitudeWave>
    translate <wingX, wingY, 0>
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

  //Schnuller
  object{
    Soother
    translate <0, -0.25, -radiushead - 0.15 >
  }
}

object{ BabyTux }

