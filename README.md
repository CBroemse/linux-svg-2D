# linux-svg-2D
a working example of the 3A3S repo that uses linux in a browser 

write routine to determine where to move
check currant position          ------------------------->  need a write/replce new AVA into DICTIONARY
       *> grep "AVA" oD1.sh
e.g *> Feld1_1R AVA -222 10 91 -444 0

      Types: DICTIONARY,RAND,VERTEX,AVA,TYPE,WALL, 
                |        |    |      |   |    |
               oD1.sh    R   VR  avatar  T    W        
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
