//------------------------------------------------------------------------------
// Include-Dateien

#include "colors.inc"


//------------------------------------------------------------------------------
//Schleife

#declare  PartBow =
cone{
  <1, 1, 0>, 0.7
  <0.05, 1, 0>, 0.1
}

#declare Bow =
union{
  object{ PartBow }
  object{
    PartBow
    rotate 180 * y
  }
  sphere{ <0, 1, 0>, 0.3 }
  scale <1, 1, 0.3>
  pigment{ DarkPurple }
}

