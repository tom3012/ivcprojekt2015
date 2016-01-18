#include "colors.inc"

//------------------------------------------------------------------------------
// Kameraeinstellungen

camera{
  location <0, 2, -8>
  look_at <0, 1, 0>
  angle 36
  //rotate 360 * clock * y
}

light_source{
  <500, 500, -1000>
  White
}


//------------------------------------------------------------------------------
// Umgebung

sphere{
  <0, 0, 0>, 1 hollow    //keep attention: keep sun lower than sky
  texture{
    pigment{
      gradient <0,1,0>
      color_map{
        [0.0 color White * 0.8]
        [0.8 color rgb <0.1, 0.25, 0.75>]
        [1.0 color rgb<0.1, 0.25, 0.75>]
      }
    }
    #if (version = 3.7 )
      finish { emission 1 diffuse 0 }
    #else
      finish { ambient 1 diffuse 0 }
    #end
  }
  scale 10000
}

plane{ <0, 1, 0>, 0
  texture{
    pigment{ color rgb <0.35, 0.65, 0.0> * 0.7 }
    normal{ bumps 0.75 scale 0.015 }
  }
}

