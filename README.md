# linux-svg-2D
## write a routine to determine where to move
###### a working example of the 3S3T repo that uses linux in a browser

##### check -dictionary

      *> vim oD1.sh
      
 The main input data file for this working example
 '
##### write routine to determine where to move
check currant position          -------------------->  need a write/replce new AVA into DICTIONARY

     e.g *> grep "AVA" oD1.sh
     =>  *> Feld1_1R AVA -222 10 91 -444 0

#### USAGE:

    *> ./linuxJSobject.sh "Feld" svg 3 3 "Feld" oD1.sh

      Types: DICTIONARY,RAND,VERTEX,AVA,TYPE,WALL,MOVE
                |        |    |      |   |    |    |
               oD1.sh    R   VR  avatar  T    W  f(mov())         

each field has two vectors and four degrees of liberty(back and forward on each axis)
fields that are at the RAND do have three degrees of liberty
vertices have two degrees of liberty 

        a map 6 x 6 fields     a 6 x 6 with walls and avatar (AVA)
             VR R R R R VR    T  T  T T T T
             R  T T T T  R    W  T  T T T T  
             R  T T T T  R    W  T  W W W W
             R  T T T T  R    W  T  W T T T
             R  T T T T  R    W  T  W W W W
             VR R R R R VR    T AVA T T T T
