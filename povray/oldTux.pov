//------------------------------------------------------------------------------
// Include-Dateien


#include "assembledTux.pov"
#include "textures.inc"
#include "stars.inc"
#include "f-lohmueller/Rocker_0.inc"
#include "f-lohmueller/Window_1.inc"
#include "f-lohmueller/Door_1.inc"
#include "f-lohmueller/House_1_0.inc"
#include "f-lohmueller/Fence_1.inc"
#include "runevision/grasstex.inc"
#include "runevision/grasstexa.pov"


//------------------------------------------------------------------------------
// Deklarationen

//#declare radiusfoot=radiustummy / 2.5;
//#declare amplitudeFoot = 15;
//#declare StepWidth = 1;
//#declare amplitudeWobble = 8;
//House
#declare Wall_Texture_Outside = 
      texture { pigment{ color White*1.1}
                normal { bumps 0.5 scale 0.005} 
                finish { phong 1}
              } // end of texture
//--------------------------------------------------------
#declare Wall_Texture_Inside = 
      texture { pigment{ color White*1.1}
                finish { phong 1}
              } // end of texture
//--------------------------------------------------------
#declare Roof_Texture = 
// layered texture!!!
      texture { pigment{ color Scarlet*1.3}
                normal { gradient z scallop_wave scale<1,1,0.15>} 
                finish { phong 1}
              } // end of texture
 
      texture { pigment{ gradient x 
                         color_map{[0.00 color Clear]
                                   [0.90 color Clear]
                                   [0.95 color White*0.1]
                                   [1.00 color White*0.1]}
                          scale 0.25}
                 finish { phong 1}
              } // end of texture

#declare Window_Texture = 
         texture{ pigment{ color rgb< 0.75, 0.5, 0.30>*0.35 } // brown  
                  // pigment{ color White*1.2}
                  finish { phong 0.1}}
// Zaun
#declare Fence_Texture = // (wood structures by default in direction z) 
         texture { pigment{ color rgb<1,1,1>*1.1}// 0.75, 0.5, 0.30>*1.00 } 
                   normal { bumps 0.25 scale 0.005 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 

#declare Fence_Segment = 
object{ Fence_1 ( 0.80, // Fence_Height, 
                    1.90, // Fence_Length_x,
                    13,   // Number_of_Elements_x,
                    0.10, // Element_Length_x, 
                    0.03, // Element_Depth_z, 
                    Fence_Texture) // -------------------------------
                translate<0.05,0.05,0.00> } // end of object{ Fence_1(...) ...}
//-----------------------------------------------------------------------------
#declare Pole = 
box { <-0.05, 0.00, -0.05>,< 0.05, 0.83, 0.05>   
      texture { Fence_Texture }  
    } // end of box --------------------------------------
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
//Clock
#declare Start    = 0.0;
#declare End      = 4.0;
#declare My_Clock = Start + (End - Start) * clock;

//------------------------------------------------------------------------------
// Kameraeinstellungen

camera{
  location <-5, 4, -15>
  look_at <0,3, 0>
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
//Haus
object{ House_1_0(  2.50, // Half_House_Width_X, // >= 2.00
                    5.50, // Total_House_Width_Z,// >= 2.00
                    3.50, // House_Height_Y,     // >= 2.00
                    25,   // Roof___Angle, // ca. 10 ~ 60 degrees
                      
                    Wall_Texture_Outside
                    Wall_Texture_Inside 
                    Window_Texture                                                    
                    Roof_Texture
                   ) //----------------------------------------------------------------//
        scale <1,1,1>*2
        rotate<0,50,0> 
        translate<0.00,0.00, 5.00>}

//Zaun rechts
union{ 
object{ Pole                           translate<0*2.00, 0, 0*2.00>} 
object{ Fence_Segment  rotate<0,  0,0> translate<0*2.00, 0, 0*2.00>}
object{ Pole                           translate<1*2.00, 0, 0*2.00>} 
object{ Fence_Segment  rotate<0,  0,0> translate<1*2.00, 0, 0*2.00>}
object{ Pole                           translate<-1*2.00, 0, 0*2.00>} 
object{ Fence_Segment  rotate<0,  0,0> translate<-1*2.00, 0, 0*2.00>}
object{ Pole                           translate<2*2.00, 0, 0*2.00>}
object{ Fence_Segment  rotate<0,-90,0> translate<2*2.00, 0, 0*2.00>}
object{ Pole                           translate<2*2.00, 0, 1*2.00>} 
object{ Fence_Segment  rotate<0,-90,0> translate<2*2.00, 0, 1*2.00>}
object{ Pole                           translate<2*2.00, 0, 2*2.00>} 
scale <1,1,1> 
rotate<0,50,0>
translate<-2,0,1.5> 
} // end of union

//Zaun links
union{ 
/*object{ Pole                           translate<0*2.00, 0, 0*2.00>} 
object{ Fence_Segment  rotate<0,  0,0> translate<0*2.00, 0, 0*2.00>}
object{ Pole                           translate<1*2.00, 0, 0*2.00>} 
object{ Fence_Segment  rotate<0,  0,0> translate<1*2.00, 0, 0*2.00>}
object{ Pole                           translate<-1*2.00, 0, 0*2.00>} 
object{ Fence_Segment  rotate<0,  0,0> translate<-1*2.00, 0, 0*2.00>}*/
object{ Pole                           translate<2*2.00, 0, 0*2.00>}
object{ Fence_Segment  rotate<0,-90,0> translate<2*2.00, 0, 0*2.00>}
object{ Pole                           translate<2*2.00, 0, 1*2.00>} 
object{ Fence_Segment  rotate<0,-90,0> translate<2*2.00, 0, 1*2.00>}
object{ Pole                           translate<2*2.00, 0, 2*2.00>} 
scale <1,1,1> 
rotate<0,-130,0>
translate<0,0,6.5> 
} // end of union



//Boden
plane{ <0, 1, 0>, 0
  texture{
    pigment{ color rgb <0.35, 0.65, 0.0> * 0.7 }
    normal{ bumps 0.75 scale 0.015 }
  }
}



//------------------------------------------------------------------------------
// Tux Assembly

/*object{
  WalkingTux
  rotate z * sin(My_Clock * 2 * pi) * amplitudeWobble
}*/

/*object{
  cone {
    <-10, -5, 0>, 5    // Center and radius of one end
    <10, -5, 0>, 5    // Center and radius of other end
    texture { White_Marble }
  }*/
  /*translate <0,5,0>
  rotate x *My_Clock *360
  translate <0,-5,0>*/
//}

//#declare TimeFra = 1 ;
//--------------------------------------------------------------------------------------------------------<<<<
//--------------------------------------------------------------------------------------------------------<<<<
#declare Rocking_Angle= 12* sin(My_Clock*2*pi) -2;
union{
  object{ 
    AssembledTux
    rotate < 0,90,Rocking_Angle >
    translate< -(2*pi*1.20)*(Rocking_Angle/360),0.9,0> 
  }
  object{  Rocker_0( Rocking_Angle) // ( Rocking_Angle  )  
         texture { pigment{ color rgb< 0.75, 0.5, 0.30>*0.35 }// very dark brown  
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
         rotate<0,0,0>
         translate<0,0,0>
         scale <2.2,2.2,2.2> 
      } // end of Rocker
  rotate <0,-60,0>
  translate <1,0,1>
}
