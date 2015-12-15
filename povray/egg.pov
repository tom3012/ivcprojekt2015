//------------------------------------------------------
// Include-Dateien

#include "colors.inc"
#include "textures.inc"


//------------------------------------------------------
// Deklarationen

#declare Egg_Tex =
texture{
  pigment{ color White }
  normal{ bumps 0.4 scale 0.01 }
  finish{ phong 0.1 }
}

#declare Egg_upperpart =
intersection{
  sphere{
    <0, 0, 0>, 1
    scale <1, 1.75, 1>
  }
  box{ <-1, 0, -1>, <1, 1.75, 1> }
  texture{ Egg_Tex }
}

#declare Egg_lowerpart =
intersection{
  sphere{
    <0, 0, 0>, 1
    scale <1, 1, 1>
  }
  box{ <-1, -1, -1>, <1, 0, 1> }
  texture{ Egg_Tex }
}

#declare Egg =
union{
  object{ Egg_upperpart }
  object{ Egg_lowerpart }
  texture{ Egg_Tex }
}

#declare Egg_upperpart_empty =
difference{
  object{ Egg_upperpart }
  object{
    Egg_upperpart
    translate <0, -0.2, 0>
    scale <0.9, 0.9, 0.9>
  }
  scale <0.9, 0.9, 0.9>
}

#declare Egg_lowerpart_empty =
difference{
  object{ Egg_lowerpart }
  object{
    Egg_lowerpart
    translate <0, 0.1, 0>
    scale <0.9, 0.9, 0.9>
  }
  scale <0.9, 0.9, 0.9>
}

