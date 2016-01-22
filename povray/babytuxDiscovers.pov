//------------------------------------------------------------------------------
// Include-Dateien

#include "tux.pov"
#include "soother.pov"
#include "bow.pov"
#include "environment.pov"
#include "textures.inc"
#include "stars.inc"


//------------------------------------------------------------------------------
// Deklarationen

#declare radiusfoot=radiustummy / 2.5;
#declare amplitudeFoot = 15;
#declare StepWidth = 1;
#declare amplitudeWobble = 8;
#declare amplitudeWave = 5;

/*Clock*/
#declare Start    = 0.0;
#declare End      = 10.0;
#declare My_Clock = Start + (End - Start) * clock;

//------------------------------------------------------------------------------
// Tux Assembly

/* Zeiteinheiten
1 - linker flügel hoch
2 - rechter Flügel hoch
3 - beide Flügel runter, zur Mitte schauen
4 - Kamerafahrt nach hinter, Kopf drehen
5 - Schwanz wackelt, zum Schwanz zoomen
6 - raus zoomen
7 - Kamerafahrt nach vorne, Kopf drehen nach unten
8 - linkes Bein heben
9 - rechtes Bein heben,
10- umfallen,
11- Schnuller ausspucken
*/

#declare BabyTux =
union{
  //Head
  object{
    union{
      object{ Head }
      object{
        Bow
        rotate <40, -20, -20>
        scale <0.2, 0.2, 0.2>
        translate <0.15,(radiushead / 2), -0.25>
      }
    }
    translate radiustummy * 2 * y

    #if (My_Clock <= 1)
      /*von Mitte nach links*/
      #declare clock1 = My_Clock;
      rotate <0,clock1*-70,0>

      #elseif(My_Clock <=2)
      /*von links nach rechts*/
      #declare clock2 = My_Clock - 1;
      rotate <0,-70,0>
      rotate <0,clock2*140,0>

      #elseif(My_Clock <=3)
      /*von rechts zur Mitte*/
      #declare clock3 = My_Clock - 2;
      rotate <0,70,0>
      rotate <0,clock3*-70,0>

      #elseif(My_Clock <=4)
      /*nach hinten*/
      #declare clock4 = My_Clock -3;
      rotate <0,clock4*95,0>

      #elseif(My_Clock <=6)
      /*hinten bleiben*/
      rotate <0,95,0>

      #elseif(My_Clock <=7)
      /*nach vorne und unten*/
      #declare clock7 = My_Clock -6;
      rotate <0,95,0>
      rotate <0,clock7*-95,0>
      rotate <clock7*-15,0,0>
      /*Povray macht Quatsch, wenn man das in einer Zeile schreibt*/

      #elseif(My_Clock <=9)
      /*nach unten*/
      rotate <-15,0,0>
    #end
  }

  // Bauch
  object{
    Tummy
    translate radiustummy * y
  }

  // Linker Fluegel
  object{
    Wing
    translate <-wingX, -wingY, 0>
    #if (My_Clock <= 1)
      #declare clock1 = My_Clock;
      rotate <clock1 * 90, 0, sin(clock1 * 2 * pi) * amplitudeWave>

      #elseif (My_Clock <= 2)
      #declare clock2 = My_Clock - 1;
      rotate < 90, 0, sin(2 * pi) * amplitudeWave>

      #elseif (My_Clock <= 3)
      #declare clock3 = My_Clock - 2;
      rotate < 90, 0, sin(2 * pi) * amplitudeWave>
      rotate <-clock3 * 90, 0, sin( 2 * pi) * amplitudeWave>
    #end
    translate <wingX, wingY, 0>
  }

  // Rechter Fluegel
  object{
    Wing
    rotate 180 * y
    translate <-wingX, -wingY, 0>

    #if (My_Clock <=1)
      rotate < 0, 0, 0>

      #elseif (My_Clock <= 2)
      #declare clock2=My_Clock-1;
      rotate <clock2 * 90, 0, sin(clock2 * 2 * pi) * amplitudeWave>

      #elseif (My_Clock <=3)
      #declare clock3=My_Clock - 2;
      rotate < 90, 0, sin(2 * pi) * amplitudeWave>
      rotate < 90*-clock3, 0, sin(2 * pi) * amplitudeWave>
    #end
    translate <wingX, wingY, 0>
  }

  // Linker Fuss
  object{
    Foot
    translate <-radiustummy / 2, 0, -radiusfoot>

    #if(My_Clock <=7)
      /*do nothing*/

      #elseif(My_Clock <=8)
      #declare clock8 = My_Clock-7;
      rotate <clock8*15,0,0>

      #elseif(My_Clock <= 10)
      rotate <15,0,0>
    #end
  }

  // Rechter Fuss
  object{
    Foot
    translate <radiustummy / 2, 0, -radiusfoot>

    #if(My_Clock <=8)
      /*do nothing*/

      #elseif(My_Clock <=9)
      #declare clock9 = My_Clock-8;
      rotate <clock9*8,0,0>

      #elseif(My_Clock <= 10)
      #declare clock10 = My_Clock-9;
      rotate <8,0,0>
      rotate <clock10*7,0,0>
    #end
  }

  //Schwanz
  object{
    Tail
    rotate <0, sin(My_Clock*100*pi)*10,0>
  }
}

camera{
  location <0, 2, -8>
  look_at <0, 1, 0>
  angle 36

  #if (My_Clock <=3)
    /*do nothing!*/

    #elseif(My_Clock <=4)
    #declare clock4 = My_Clock -3;
    rotate 130 * clock4 *y

    #elseif (My_Clock <=5)
    #declare clock5=My_Clock -4;
    rotate 130 *y
    translate <clock5*3, clock5*-1, clock5*-1.5>

    #elseif (My_Clock <= 6)
    #declare clock6 =My_Clock - 5;
    rotate 130 *y
    translate <3, -1, -1.5>
    translate <clock6*-3, clock6*1, clock6*1.5>
    //translate <3, -1, -1.5>
    //location <0, 2, -8>

    #elseif (My_Clock <=7)
    #declare clock7=My_Clock -6;
    rotate 130 *y
    rotate 260 * clock7 *y

    #elseif (My_Clock <= 10)
    rotate 30 * y

    #elseif (My_Clock >10)
    rotate 30*y
  #end
}

object{
  BabyTux

  #if (My_Clock <= 9)
    /*do nothing*/

    #elseif(My_Clock <= 10)
    #declare clock10 = My_Clock - 9;
    rotate <clock10*60,0,clock10*45>
    translate <0,clock10*0.25,0>

    #elseif (My_Clock <= 11)
    rotate <60,0,45>
    translate <0,0.25,0>
  #end
}

object{
  Soother
  translate <0, -0.25, -radiushead - 0.15 >
  translate radiustummy * 2 * y

  #if (My_Clock <= 1)
    /*von Mitte nach links*/
    #declare clock1 = My_Clock;
    rotate <0,clock1*-70,0>

    #elseif(My_Clock <=2)
    /*von links nach rechts*/
    #declare clock2 = My_Clock - 1;
    rotate <0,-70,0>
    rotate <0,clock2*140,0>

    #elseif(My_Clock <=3)
    /*von rechts zur Mitte*/
    #declare clock3 = My_Clock - 2;
    rotate <0,70,0>
    rotate <0,clock3*-70,0>

    #elseif(My_Clock <=4)
    /*nach hinten*/
    #declare clock4 = My_Clock -3;
    rotate <0,clock4*95,0>

    #elseif(My_Clock <=6)
    /*hinten bleiben*/
    rotate <0,95,0>

    #elseif(My_Clock <=7)
    /*nach vorne und unten*/
    #declare clock7 = My_Clock -6;
    rotate <0,95,0>
    rotate <0,clock7*-95,0>
    rotate <clock7*-15,0,0>
    /*Povray macht Quatsch, wenn man das in einer Zeile schreibt*/

    #elseif(My_Clock <=9)
    /*nach unten*/
    rotate <-15,0,0>

    #elseif (My_Clock <= 10)
    #declare clock10 =My_Clock -9;
    translate <0,clock10*-(radiustummy*2-0.35),0>
  #end
}
