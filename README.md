# linux-svg-2D
## write a routine to determine where to move
###### a working example of the 3S3T repo that uses linux in a browser

##### check -dictionary

      *> vim oD1.sh
      
 The main input data file for this working example
 '
##### write routine to determine where to move
check currant position   ------------------> need a write/replace new AVA into DICTIONARY

     e.g *> grep "AVA" oD1.sh
     =>  *> Feld1_1RV AVA -222 10 91 -444 0
         *> grep -n ""E$"" oD1.sh
         => all open MOVES on TYPES 
         *> grep -n ""L$"" oD1.sh
                 collumns             |       rows
         *> grep -n ""_1$"" oD1.sh    |   *> grep "Feld1_" oD1.sh
         :                            |   : 
         *> grep ""_6$"" oD1.sh       |   *> grep "Feld6_" oD1.sh
         :                            |   :


#### USAGE:

    *> ./linuxJSobject.sh "Feld" svg 3 3 "Feld" oD1.sh

      Types: DICTIONARY,RAND,VERTEX,AVA,TYPE,WALL,MOVE
                |        |    |      |   |    |    |
               oD1.sh    R   VR  avatar  T    W  f(mov())         

each field has two vectors and four degrees of liberty(back and forward on each axis)
fields that are at the RAND do have three degrees of liberty
vertices have two degrees of liberty 

              a map 6 x 6 fields     a 6 x 6 with walls and avatar (AVA)
      column 1     VR R R R R VR    T  T  T T T T
             2     R  T T T T  R    W  T  T T T T  
             3     R  T T T T  R    W  T  W W W W
             4     R  T T T T  R    W  T  W T T T
             5     R  T T T T  R    W  T  W W W W
             6     VR R R R R VR    T AVA T T T T
 
      line          6 5 4 3 2  1    6  5  4 3 2 1   
