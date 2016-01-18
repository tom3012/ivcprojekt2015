//------------------------------------------------------------------------------
// Include-Dateien

#include "pictureFrame.pov"


#declare Gallery=
union{
    object{
      PictureFrame("pictures/wikimedia_eiffelturm.jpg" )
      rotate <0,-40,0>
      translate <-2.5,1.5,-8>
    }
    object{
      PictureFrame("pictures/wikimedia_freiheitsstatue.jpg" )
      rotate <0,40,0>
      translate <2.5,1.5,-13>
    }
    object{
      PictureFrame("pictures/wikimedia_All_Gizah_Pyramids.jpg" )
      rotate <0,-40,0>
      translate <-2.5,1.5,-18>
    }
    object{
      PictureFrame("pictures/wikimedia_china.jpg" )
      rotate <0,40,0>
      translate <2.5,1.5,-23>
    }
    object{
      PictureFrame("pictures/wikimedia_seychellen.jpg" )
      rotate <0,-40,0>
      translate <-2.5,1.5,-28>
    }
    object{
      PictureFrame("pictures/wikimedia_pisa.jpg" )
      rotate <0,40,0>
      translate <2.5,1.5,-33>
    }
}
