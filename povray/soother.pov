//------------------------------------------------------------------------------
// Include-Dateien

#include "colors.inc"


//------------------------------------------------------------------------------
//Schnuller
#declare Soother=
union{
  sphere{ 0, 0.08
     scale<1.5,1,0.2>
  }
  torus{ 0.1,0.01
    rotate <-40,0,0>
    translate <0,-0.05,-0.1>
  }
  pigment{DarkPurple}
}
