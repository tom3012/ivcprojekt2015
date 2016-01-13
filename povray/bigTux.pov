//------------------------------------------------------------------------------
// Include-Dateien

#include "walkingTux.pov"
#include "textures.inc"
#include "stars.inc"
#include "pictureFrame.pov"
//------------------------------------------------------------------------------
// Deklarationen

#declare radiusfoot=radiustummy / 2.5;
#declare amplitudeFoot = 15;
//#declare StepWidth = 1;
#declare amplitudeWobble = 8;

/*Clock*/
#declare Start    = 0.0;
#declare End      = 1.0;
#declare My_Clock = Start + (End - Start) * clock;

//------------------------------------------------------------------------------
// Kameraeinstellungen

camera{
  location <0, 2, -12>
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
  <0,0,0>, 1
  texture{ Starfield1 scale 0.25 }
  scale 10000
}




//------------------------------------------------------------------------------
// Tux Assembly

object{
  WalkingTux
  rotate z * sin(My_Clock * 2 * pi) * amplitudeWobble
}

    
object{
  cone {
    <-10, -5, 0>, 5    // Center and radius of one end
    <10, -5, 0>, 5    // Center and radius of other end
    texture { White_Marble }
  }
  translate <0,5,0>
  rotate x *My_Clock *360
  translate <0,-5,0>
}


//#declare TimeFra = 1 ;
//--------------------------------------------------------------------------------------------------------<<<<
//--------------------------------------------------------------------------------------------------------<<<<
#switch ( My_Clock )
#range (0,0.99)
  #declare clock1=My_Clock;
  object{
    PictureFrame 
    rotate <0,-40,0>
    translate <0,0,-4>
    translate <-2,1.5,4*clock1>
  }
#break
#range (2,2.99)

#break
#range (3,3.99)
 
#end

