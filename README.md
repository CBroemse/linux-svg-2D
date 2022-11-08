### linux-svg-2D
#### write a routine to determine where to move
###### a working example of a JS object and a SVG witer repo that uses linux in a browser

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
                  columns             |       rows
         *> grep -n ""_1$"" oD1.sh    |   *> grep "Feld1_" oD1.sh
         :                            |   : 
         *> grep ""_6$"" oD1.sh       |   *> grep "Feld6_" oD1.sh
         :                            |   :

#### USAGE:
                            T    OPT * *   T      D     
    *> ./linuxJSobject.sh "Feld" svg 4 3 "Feld" oD1.sh
    *> ./linuxJSobject.sh "Feld" svgSolution 1 3 "Feld" oD1.sh
    *> ./linuxJSobject.sh "TYPE" object 3 3 "TYPE" oD1.sh
    
      Types: DICTIONARY,RAND,VERTEX,AVA,TYPE,WALL,MOVE,TARGET,OPTION                 *1 '*' any INT(NTest) 1 to 9
                |        |    |      |   |    |    |        |    |
               oD1.sh    R   VR  avatar  T    W  f(mov())  TA   OPT     

In this example each field has two vectors and four degrees of liberty(back and forward on each axis)
fields that are at the RAND do have three degrees of liberty
vertices have two degrees of liberty. Only horizontal and vertical moves, no diagonal ones yet. 

              a map 6 x 6 fields     a 6 x 6 with
                                     walls and
                                     avatar (AVA)     (x,y)
      column 1     VR R R R R VR    T  T  W W T AVA     (-222, 91) -317 -412 -507 -602 -697     X
             2     R  T T T T  R    T  T  W T W T        .. 215)
             3     R  T T T T  R    T  T  W T W T           339)
             4     R  T T T T  R    T  T  W T T T           445)
             5     R  T T T T  R    T  T  T T T T           587)
             6     VR R R R R VR   TA  W  W T T T           711)
 
      line          1 2 3 4 5  6    6  5  4 3 2 1             Y
#### GOAL: write a MOVE in svg via linux bash file

       # a MOVE is a string that looks as follows
         in svg
        <animateMotion path="M  0 0 L -280 0" begin="2.1s" dur="0.3s" fill="freeze"/>
        <animateMotion path="M  -280 0 L -280 -123" begin="4.1s" dur="0.3s" fill="freeze"/>
        <animateMotion path="M  -280 -123 L -374 -123" begin="6.1s" dur="0.3s" fill="freeze"/>
        <animateMotion path="M  -374 -123 L -374 -369" begin="8.1s" dur="0.3s" fill="freeze"/>
        <animateMotion path="M  -374 -369 L 0 -369" begin="10.1s" dur="0.3s" fill="freeze"/>
        <animateMotion path="M  0 -369 L 0 -492" begin="12.1s" dur="0.3s" fill="freeze"/>
        
                    numerical
        M    0    0 L -280    0       2.1  0.3
        M -280    0 L -280 -123       4.1  0.3
        M -280 -123 L -374 -123       6.1  0.3
        M -374 -123 L -374 -369       8.1  0.3
        M -374 -369 L    0 -369      10.1  0.3
        M    0 -369 L    0 -492      12.1  0.3
