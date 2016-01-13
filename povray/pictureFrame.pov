#include "textures.inc"
//picked from: http://news.povray.org/povray.text.scene-files/thread/%3Cweb.487d984ae8023c282a42a77a0@news.povray.org%3E/

//global_settings { assumed_gamma 1.5 }



#declare PictureFrame =
union { box { // Pictureframe
      <-0.5, -0.5, -0.05>, <0.5, 0.5, 0.05>
      pigment { rgb <0.309804, 0.192157, 0.156863> }
      normal { boxed
         slope_map { //Definition of the frame-profile
            [ 0 <0, 0> ]
            [ 0.05 <0.5, 0> ]
            [ 0.1 <1, 0> ]
            [ 0.15 <0.75, 0> ]
            [ 0.2 <0.5, 0>  ]
         }
         scale <0.5, 0.5, 1>
      }
      scale <2, 2, 1>
   }

   box { // Picture shown in the pictureframe
      <-0.5, -0.5, -0.001>, <0.5, 0.5, 0.001>
      pigment {
        image_map {
            jpeg "pictures/eiffelturm.jpg"
            map_type 0
         }
         translate <0.5, 0.5, 0>
      }
      finish { Phong_Glossy }
      scale <1.705, 1.705, 1>
      translate z*(-0.04901)
   }
   rotate x*10
}

