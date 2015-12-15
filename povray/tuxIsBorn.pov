//------------------------------------------------------------------------------
// Include-Dateien

#include "tux.pov"
#include "AssembledTux.pov"
#include "egg.pov"
#include "environment.pov"
#include "textures.inc"
#include "stars.inc"


//------------------------------------------------------------------------------
// Deklarationen

#declare radiusfoot=radiustummy / 2.5;
#declare amplitudeFoot = 15;
#declare StepWidth = 1;
#declare amplitudeWobble = 8;


//------------------------------------------------------------------------------
//Assembly

object{
  Egg_upperpart_empty
  rotate <clock * 90, 0, 0>
  translate <0, 0.7 + clock, clock>
}

object{
  Egg_lowerpart_empty
  translate <0, 0.7, 0>
}

object{ AssembledTux }

