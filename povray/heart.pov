//------------------------------------------------------------------------------
// Include-Dateien

#include "colors.inc"

//------------------------------------------------------------------------------
// Deklarationen


//------------------------------------------------------------------------------
/* Tux Assembly*/

#declare Heart =
union{
  object{//linke Kugel
    cone{<0.6,2,0>,1
         <0.6,2,1>,1}
  }

  object{ //rechte Kugel
    cone{<-0.6,2,0>,1
         <-0.6,2,1>,1}
  }

  object{
    box{<0,0,0>
        <2,2,1>
      rotate<0,0,45>
    }
  }
  pigment{Red}
  scale <1.5*clock,1.5*clock,0.1>
}

