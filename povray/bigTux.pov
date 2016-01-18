//------------------------------------------------------------------------------
// Include-Dateien

#include "walkingTux.pov"
#include "textures.inc"
#include "stones.inc"
#include "gallery.pov"
#include "movingHeadTux.pov"
#include "movedHeadTux.pov"
#include "pictureFrame.pov"
#include "heart.pov"

//------------------------------------------------------------------------------
// Deklarationen

#declare radiusfoot=radiustummy / 2.5;
#declare amplitudeFoot = 15;
#declare StepWidth = 1;
#declare amplitudeWobble = 8;

/*Clock*/
#declare Start    = 0.0;
#declare End      = 16.0;
#declare My_Clock = Start + (End - Start) * clock;

//------------------------------------------------------------------------------
// Kameraeinstellungen

camera{
  location <0, 2, -12>
  look_at <0, 1, 0>
  angle 36
  #switch ( My_Clock )
  #range(13,14)
    #declare clock13=My_Clock-13;
    rotate <0,-40*clock13,0>
  #break 
  #range(14,16)
    rotate <0,-40,0>
  #end 
  //rotate 360 * clock * y
}

light_source{
  <500, 500, -1000>
  White
}


//------------------------------------------------------------------------------
// Umgebung



//Boden
plane{ <0, 1, 0>, 0
  texture{ T_Stone31 }
  #switch(My_Clock)
  #range(13,14)
    translate <0,0,StepWidth * My_Clock>
  #break
  #end
}


//Himmel
plane{<0,1,0>,1 hollow       
 texture{ pigment {color rgb<0.1,0.3,0.75>*0.7}
   #if (version = 3.7 )  finish {emission 1 diffuse 0}
   #else                 finish { ambient 1 diffuse 0}
   #end 
 } // end texture 1

 texture{ 
   pigment{ bozo turbulence 0.75
            octaves 6  omega 0.7 lambda 2 
     color_map {
       [0.0  color rgb <0.95, 0.95, 0.95> ]
       [0.05  color rgb <1, 1, 1>*1.25 ]
       [0.15 color rgb <0.85, 0.85, 0.85> ]
       [0.55 color rgbt <1, 1, 1, 1>*1 ]
       [1.0 color rgbt <1, 1, 1, 1>*1 ]
     } // end color_map 
     translate< 3, 0,-1>
     scale <0.3, 0.4, 0.2>*3
   } // end pigment
   #if (version = 3.7 )  finish {emission 1 diffuse 0}
   #else                 finish { ambient 1 diffuse 0}
   #end 
 } // end texture 2
 scale 10000
} 


//------------------------------------------------------------------------------
// Insert Pictures

#switch ( My_Clock )
#range (0,13)
  //Tux laeuft an einer Bildergalerie entlang
  object{
    Gallery
    translate <0,0,3*My_Clock>
  }
  object{
    WalkingTux
    rotate z * sin(My_Clock * 2 * pi) * amplitudeWobble
    //translate <0, 0, -StepWidth * clock>
  }
#break
#range (13,14)
  #declare clock13=My_Clock-13;
  //Tux bleibt stehen, Kamera dreht sich, Bild von Kugelmann
  object{
    Gallery
    translate <0,0,3*13>
  }
  object{
    WalkingTux
    rotate z * sin(My_Clock * 2 * pi) * amplitudeWobble
    //translate <0, 0, -StepWidth * clock>
  }  
  /*object{
    PictureFrame("pictures/smiley.jpeg" )
    rotate <0,-140,0>
    translate <-2,1.5,-12>
    translate <0,0,9*clock13>
  }*/
  
#break

#range (14,15)
  //Kopf zum Bild drehen
  object{
    Gallery
    translate <0,0,3*13>
  }
  object{
    MovingHeadTux
  } 
  object{
    PictureFrame("pictures/smiley.jpeg" )
    rotate <0,-80,0>
    translate <-2,1.5,-2>
  }
#break  
#range (15,16)
  //Herz ueber der vorherigen Scene
  object{
    Gallery
    translate <0,0,3*13>
  }
  object{
    MovedHeadTux
  } 
  object{
    PictureFrame("pictures/smiley.jpeg" )
    rotate <0,-80,0>
    translate <-2,1.5,-2>
  }
  object{
    Heart
    rotate <0,-80,0>
    translate <-1,1,-1>
    translate <0,-1*clock,0>
  }
#break
#end

