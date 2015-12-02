//------------------------------------------------------------------------------
// Include-Dateien

#include "tux.pov"
#include "textures.inc"
#include "stars.inc"
#include "WalkingTux.pov"


//------------------------------------------------------------------------------
// Deklarationen

#declare radiusfoot = radiustummy / 2.5;
#declare amplitudeWave = 10;


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
  texture{ Candy_Cane }
}


//------------------------------------------------------------------------------
// Tux Assembly

#declare WavingTux =
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
    translate <-wingX, -wingY, 0>
    rotate z * sin(clock * 2 * pi) * amplitudeWave
    translate <wingX, wingY, 0>
  }

  // Rechter Fluegel
  object{
    Wing
    rotate 180 * y
  }

  // Linker Fuss
  object{
    Foot
    translate <-radiustummy / 2, 0, -radiusfoot>
  }

  // Rechter Fuss
  object{
    Foot
    translate <radiustummy / 2, 0, -radiusfoot>
  }

  //Schwanz
  object{ Tail }
}

object{ WavingTux }

