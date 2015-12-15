// Projekt Baby-Tux


//------------------------------------------------------------------------------
// Include-Dateien

#include "colors.inc"
#include "finish.inc"


//------------------------------------------------------------------------------
// Deklarationen

#declare tuxheight = 2;
#declare tuxwidth = tuxheight / 2;
#declare radiustummy = tuxheight / 4;
#declare radiushead = radiustummy * 0.75;
#declare radiuseye = radiushead * 0.4;
#declare radiusfoot = radiustummy / 2.5;

// Wing Parameter
#declare wingX = 1/3 * radiustummy;
#declare wingY = 4/3 * radiustummy;


//------------------------------------------------------------------------------
// Kopf

#declare Pupil =
intersection{
  sphere{ 0, radiuseye - 0.005 }
  sphere{
    0, radiuseye - 0.005
    scale <0.5, 1.5, 0.25>
    translate <0, 0, -radiuseye - 0.02>
  }
  pigment{ Black }
  finish{ phong 1 }
}

#declare LeftEye =
union{
  object{
    Pupil
    rotate y * -35
  }
  sphere{
    0, radiuseye - 0.005
    pigment{  White }
    finish{ phong 1 }
  }
  scale <1, 1.2, 0.8>
  translate <0, 0, -radiushead + 0.09>
}

#declare RightEye =
union{
  object{
    Pupil
    rotate y * 35
  }
  sphere{
    0, radiuseye - 0.005
    pigment{  White }
    finish{ phong 1 }
  }
  scale <1.2, 1, 0.8>
  translate <0, 0, -radiushead + 0.09>
}

// Schnabel
#declare Beak =
cone{
  <0, 0, -radiushead + 0.5>, 0.15,
  <0, 0, -radiushead - 0.3>, 0.02
  pigment{ Yellow }
  scale <1, 0.6, 0.5>
  rotate -45 * x
  translate -(radiushead + 0.15) * 0.5 * z
}

#declare Head =
union{
  sphere{
    0,  radiushead
    pigment{  Gray10  }
  }
  object{
    LeftEye
    rotate <10, 20, 0>
  }
  object{
    RightEye
    rotate <10, -20, 0>
  }
  object{ Beak }
}

//------------------------------------------------------------------------------
//Körper
#declare Tummy =
union{
  intersection{
    sphere{ 0, radiustummy }
    sphere{
      0, radiustummy
      scale <0.6, 1.5, 0.25>
      translate <0, 0, -radiustummy + 0.1>
    }
    pigment{ White }
  }
  sphere{
    0, radiustummy
    pigment{  Gray10  }
  }
  rotate -15 * x
}

// Flügel
#declare Wing =
difference{
  cone{
    <wingX, wingY, 0>, 0.25,
    <1.5 * radiustummy, 2/3 * radiustummy, 0>, 0.02
    pigment{ Gray10 }
  }
  sphere{
    <1/3 * radiustummy, 1/3 * radiustummy, 0>,
    2/3 * radiustummy
    pigment{ VLightGray }
    scale <1.6, 1.0, 1.0>
  }
}

// Fuesse
#declare Foot =
intersection{
  sphere{
    0, radiusfoot
    pigment{ Yellow }
  }
  box{ <-1, 0, -1>, <1, 1, 1> }
}

// Schwanz
#declare Tail =
cone{
  <0, 0, 1/2 * radiustummy>, 0.2,
  <0, 0, radiustummy + 0.2>, 0.02
  pigment{ Gray10 }
  scale <1, 0.6, 0.5>
  rotate 45 * x
  translate <0, 0.25, 0.15>
}

