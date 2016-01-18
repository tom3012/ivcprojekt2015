//------------------------------------------------------------------------------
// Include-Dateien


#include "f-lohmueller/Plane_00.inc"
#include "textures.inc"
#include "colors.inc"

camera{
  location <50, 2, -30>
  look_at <0, 1, 0>
  angle 36
  //rotate 360 * clock * y
}

light_source{
  <500, 500, -1000>
  White
}

//------------------------------------------------------------------------------
// Deklarationen

//#declare radiusfoot=radiustummy / 2.5;
//#declare amplitudeFoot = 15;
//#declare StepWidth = 1;
//#declare amplitudeWobble = 8;
#declare APlane_Outside_Texture =       
    texture { pigment{color Silver}
              finish { phong 1} }

#declare APlane_Wings_Texture =          
    texture { pigment{color Silver}
              finish { phong 1} } 
 
#declare  APlane_Inside_Texture=                
    texture { pigment{color White}
              finish { phong 1} }

#declare Window___Glass =                       
     texture{  NBbeerbottle }    
            
#declare Blades_Texture =                     
    texture { Chrome_Metal
              finish { phong 1}}

#declare Engine_Texture =                      
    texture { APlane_Outside_Texture }

#declare Undercarriage_Metal =                   
    texture { pigment { color Silver}
              finish  { phong 1}}

#declare Pneu_Texture = 
    texture { pigment{ color Gray40}         
              finish { phong 1}}


//-----------------------------
object{ Plane_00 (  
                    5, // Number_of___Blades,             
                    10,// Rotation_Angle___Right, //
                    15,// Rotation_Angle___Left, //
                    2, // Rotor_On___Right, // activates rotation blur 
                    1, // Rotor_On___Left, // activates rotation blur 
                 
                    Window___Glass,  // glass texture without interior
                    APlane_Outside_Texture, // airplane texture of the outside, 
                    APlane_Inside_Texture, // airplane inside texture

                   
                    Blades_Texture, //
                    Engine_Texture, //
                    Undercarriage_Metal, //
                    Pneu_Texture, //  
                 ) //------------------------------------------------------------ 
        rotate<0,0,10> 
        scale 1
        translate<-30,0.00, 0.00>
 
  translate <0,2*clock,70*clock>
}



