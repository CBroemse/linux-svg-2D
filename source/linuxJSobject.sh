#!/usr/bin/env bash
    #              ^^^^- NOT sh; sh does not support [[ ]] or <(...)

<<COMMENT
USAGE
   grobi :: String ; give new NAME(s) unique1.sh fst line
   object :: String ; if object then
                              write object.sh
   4 :: Int ; select column from Dict1.sh
   2 :: Int ; select column from unique1.sh
   "node" :: String ; search lines in aDict1.sh
                         and write to unique4.sh

./linuxJSobject.sh "grobi" object 4 2 "node" oD1.sh #aDict1.sh

OVERVIEW
  mapping functions to read out of file

  MAP aDict1.sh write/and insert in 
    - unique1 ,2 ,3 .sh
    - object, 1 .sh
  INDICATORS
    - variables used below that are Ints (length of input)
    - lengde: length of $ 1 the fst input String
              how many NAME to be processed in one RUN
	      ca. line: 30 of this file
    - kob: length of an element of a list of different 
           NAMES of a grep RUN
	   kob = [NAMES] = ? bak ?
    - bak: n elements of occurance0 of Name in aDict1.sh
        used in functions readInputSTRING
          

# usage e.g *>  ./linuxJSobject.sh "peter" 1 2 4 "node" aDict1.sh
COMMENT
#read fst word
poe=$1
readOp=$2 ############################################## write OBJECT OR NOT
edger=$6
lengde=$(echo $1 | wc -w)    ################## take length of input $1
#<<COMMENT                   ########### e.g "Hans Gabe PEter Peter"
rm "object1.sh"
touch "object1.sh"

readInputSTRING() {
for ((i=0;i<$lengde;++i)) do
 zeroplus=$(echo | expr $i + 1)
 parS=$(echo "$poe" | awk '{print($'$zeroplus')}') #parse NAMEString one by one
 #$parS
 #search name x in file
 myGrep=$(grep -n "$parS" $edger) #get whole line from file
 takeSteps=$(echo $(grep -n "$parS" $edger | cut -d : -f1))   # just line numbers of
 bak=$(echo "$takeSteps" | wc -w)
 #if [ "$i" '==' "$nameMATCHES" ]
 #then
    for ((m=0;m<$bak;++m)) do
      zeropl2=$(echo | expr $m + 1)
      parS2=$(echo "$takeSteps" | awk '{print($'$zeropl2')}')
      getWhole=$(echo "$myGrep" | awk '{print($'$zeropl2')}')
      cde=$(echo "got s.th ii '$m $parS $bak'")
      #	echo '$poe' | awk  '{print $2}'
      #echo "will pivot on stacks now"
      #echo " in english: define column names"
      # e.g   echo "Mits" "TITS" "HITS" "SITS" > "unique1.sh"
           #echo "Mits" "TITS" "HITS" "SITS" > "unique1.sh"
      echo "$cde line $parS2 ACTION $getWhole" >> "object1.sh"
      #echo "$parS2" >> "object1.sh"
    done
# else
#      echo " "$i" \"fl$i\" "name" "NOTHING"" >> "object1.sh"
# fi
done
}

#COMMENT
readInputSTRING
#and get length of file

gelesen=$(wc -l $edger)
solong= read kob _ <<< $gelesen    # kob is the length of aDict1.sh

$solong
bebob=$1

rm unique1.sh                     #clear to use files just as 'Zwischenspeicher'
touch unique1.sh                  #write fst file
list2Object() { 
    for ((i=0;i<$kob;++i)) do
#	    tX=$(echo $(awk '{ print($2) }' <<< $(head -n "$i" $6 | tail -1))) #get fst word of each lne of $6 e.g oD1.sh
#	    tY=$(echo $(awk '{ print($4) }' <<< $(head -n "$i" $6 | tail -1))) #get 3rd word ..
            myGrep=$(grep -n "Feld" $edger) #get X coordinate o field
           # takeSteps=$(echo $(grep -n "$parS" $edger | cut -d : -f1))   # just line numbers of
           # bak=$(echo "$takeSteps" | wc -w)

           # tX=$(echo "$myGrep" | awk '{ print($5) }') # <<< $(head -n "$i" $6 | tail -1)) #get fst word of each lne of $6 e.g oD1.sh
         #  tY=$(awk '{ print($4) }' <<< $(head -n "$i" $6 | tail -1)) #get 3rd word ..

        if [ "$i" '==' "0" ]
        then

         #  tY=$(awk '{ print($4) }' <<< $(head -n "$i" $6 | tail -1)) #get 3rd word ..

           echo "got s.th"
           echo "will pivot on stacks now"
           echo " in english: define column names"
      # e.g   echo "Mits" "TITS" "HITS" "SITS" > "unique1.sh"
           #echo "Mits" "TITS" "HITS" "SITS" > "unique1.sh"           
	   echo "$bebob" > "unique1.sh"
        else
	   foOd=5 # selet collum in DICTIONARY e.g oD1.sh COLUMN 5
	   tK=$(echo "$myGrep" | awk '{ print $'$foOd' }' | head -n "$i" $6 | tail -1) 
           echo " "$i" \"fl$i\" "$tK" "name" "NOTHING"" >> "unique1.sh"
        fi

    done
}

list2Object
vart1= list2Object >> unique1.sh #parse
rm unique2.sh                     #clear
$vart1

# --------------------------------------------------- Cache op Nederlands
touch unique2.sh                  #write 2nd file
grip=$3 #input e.g 1
function takefstCollumnOfWordsFile {
    while read input;
        do
           echo "$input"
	   pog=$(awk '{print($'$grip')}')
	   echo "$pog" >> "unique2.sh"
        done
} < "$edger"


takefstCollumnOfWordsFile
mp=$4
function fstCol {
    while read input;
        do
           echo "$input"
           pog=$(awk '{print($'$mp')}')
           echo "$pog" >> "unique3.sh"
        done
} < "unique1.sh"

##redirection_in
rm unique3.sh
touch unique3.sh

fstCol  ############################### NAMELIST in unique3.sh
rm object.sh
rm object.js

mapUniques() {
 for ((pm=0;pm<$lengde;++pm)) do
 zeroplus=$(echo | expr $pm + 1) # to write vim starts with lin no. 1 not 0 therefore + 1
 parS=$(echo "$poe" | awk '{print($'$zeroplus')}') #parse NAMEString one by one
 #$parS
 #search name x in file
 myGrep=$(grep -n "$parS" $edger) #get whole line(s) from DICTIONARY
 takeSteps=$(echo $(grep -n "$parS" $edger | cut -d : -f1))   # just line numbers of search's MATCHES
 bak=$(echo "$takeSteps" | wc -w)

   for ((i=0;i<$bak;++i)) do  ############ change bak OR kob
	   #bak to write iteration and kob for an object == length aDict1.sh
	zeropl2=$(echo | expr $i + 1) ###################### length of NAME in input from lines of MATCHES in INPUT
   
        getInput=$(head -n $zeropl2 unique3.sh | tail -1)
        getInput2=$(head -n $zeropl2 unique2.sh | tail -1)
	kbt=$(echo | expr $kob - 1)
	ups=$(echo | expr $i + 1)
	zeropl2=$(echo | expr $i + 1) ###################### length of NAME in input from lines of MATCHES in INPUT
      parS2=$(echo "$takeSteps" | awk '{print($'$zeropl2')}') #----------------------- parser get Line number of MATCHES
      getWhole=$(echo "$myGrep" | awk '{print($'$zeropl2')}')
      cde=$(echo "got s.th ii '$i $parS $bak'")
      # echo '$poe' | awk  '{print $2}'
      someBob=$(echo | expr $bak + 1)
      function drama() {
           #for ((i=0;i<$bak;++i))
              #   rm object.svg
               #  touch object.svg
	    if [ "$readOp" '==' "svg" ]
            then
                 if [ "$i" '==' "0" ]
                 then
         # input1= e.g feld1_1 222 91
                     somein=$(cat svgHeader)
                     mesReady=" <rect name = \"$i\" class= \"room wall\" width = \"94\" height=\"123\" x=\"$getInput2\" y=\"$getInput\"/>"
                     echo "$somein" >> "object.svg"
                 elif [ "$zeropl2" '==' "$bak" ] && [ "$zeroplus" '==' "$lengde" ]    ######################## Writing object to file
                 then
                         moIn=$(echo $(cat svgTail))
                    echo " writn svg tail to object.svg"
           #   foinput=$(echo "[ " $getInput ", " \"$getInput2\" "]]]; ")
                    echo "$moIn" >> "object.svg"
                 else
                    mesReady=" <rect name = \"$i\" class= \"room wall\" width = \"94\" height=\"123\" x=\"$getInput2\" y=\"$getInput\"/>"
                    echo "$mesReady" >> object.svg
                fi
           fi
	   }

        
	if [ "$zeroplus" '==' "1" ] && [ "$zeropl2" '==' "1" ] #&& [ "$ups" '==' "1" ]
        then
           #echo " writn OBJECT [[[ at fst line of INPUT"
	   aInpu0=$(echo "var dBLitoSolu = ") 
	   foinput=$(echo "[[[ " $getInput ", " \"$getInput2\" "] , ")
           echo "$aInpu0" "$foinput" > "object.js"
           drama
        elif [ "$ups" '==' "1" ]
        then
           echo " writn OBJECT [[ at fst line "
           #foinput=$(echo "[[ " $getInput ", " $getInput2 "] , ")
           #echo "$foinput" > "object.sh"

        elif [ "$zeroplus" '>' "1" ] && [ "$i" '==' "1" ]
        then
           #echo " writn OBJECT [[[ at fst line "
           foinput=$(echo "[[ " $getInput ", " \"$getInput2\" "] , ")
           echo "$foinput" >> "object.js"

        elif [ "$i" '==' "$kbt" ]    ################### printing object in terminal
        then
           echo " writn OBJECT ]]] at last line "
          # foinput=$(echo "[ " $getInput ", " $getInput2 "]]] ")
       

        elif [ "$zeropl2" '==' "$bak" ] && [ "$zeroplus" '==' "$lengde" ]    ######################## Writing object to file
        then
           echo " writn OBJECT ]]] at VERy last line "
           foinput=$(echo "[ " $getInput ", " \"$getInput2\" "]]]; ")

           echo "$foinput" >> "object.js"
           drama

           
	elif [ "$zeropl2" '==' "$bak" ]    ######################## Writing object to last line of file
        then
           echo " writn OBJECT ]] at WITHIN last line "
           foinput=$(echo "[ " $getInput ", " \"$getInput2\" "]] , ")

           echo "$foinput" >> "object.js"  

        else
	   echo " writn OBJECT normal line "
           foinput=$(echo "[ " $getInput ", " \"$getInput2\" "] , ")
           echo "$foinput" >> "object.js"
	   drama
	fi
    done
 done
}
<<COMMENT
     # a MOVE is a string that looks as follows:
     #  <animateMotion path="M 0 0 L -280 0" begin="2.1s" dur="0.3s" fill="freeze"/>
        <animateMotion path="M -280 0 L -280 -123" begin="4.1s" dur="0.3s" fill="freeze"/>
        <animateMotion path="M -280 -123 L -374 -123" begin="6.1s" dur="0.3s" fill="freeze"/>
        <animateMotion path="M -374 -123 L -374 -369" begin="8.1s" dur="0.3s" fill="freeze"/>
        <animateMotion path="M -374 -369 L 0 -369" begin="10.1s" dur="0.3s" fill="freeze"/>
         <animateMotion path="M 0 0 L -280 0" begin="2.1s" dur="0.3s" fill="freeze"/> <animateMotion path="M -280 0 L -280 -123" begin="4.1s" dur="0.3s" fill="freeze"/> <animateMotion path="M -280 -123 L -374 -123" begin="6.1s" dur="0.3s" fill="freeze"/> <animateMotion path="M -374 -123 L -374 -369" begin="8.1s" dur="0.3s" fill="freeze"/> <animateMotion path="M -374 -369 L 0 -369" begin="10.1s" dur="0.3s" fill="freeze"/> <animateMotion path="M 0 -369 L 0 -482" begin="12.1s" dur="0.3s" fill="freeze"/><animateMotion path="M 0 -369 L 0 -482" begin="12.1s" dur="0.3s" fill="freeze"/>
COMMENT
            function stride() {
             randLine=$(grep "R" $6) # whole line of matches of 'Rand'='R' fields
             getRandNumber=$(grep -n "R" $6 | cut -d : f1) # line numbers of Rand
             newI=$(echo "$getRandNumber" | wc -l)
             checkType= $(echo "$randLine" | awk '{print($2)}') # selct 2nd Column TYPE vs WALL
             foAVA=$(grep -n "AVA" oD1.sh)
             avaX=$(echo "$foAVA" | awk '{print($2)}') # get x value of avatar
             avaY=$(echo "$foAVA" | awk '{print($4)}') # get y value of avatar
              
             prep= read aFELD _ <<< $(echo | grep -n "AVA" $6) # grep with -n to match with line numbers
             extractNumer=$(echo "$aFELD" | cut -d : f1) # => e.g "Feld1_1 => 1
                                                          #  =>     "Feld3_3 => 15
             adjustNuer=$(expr $extractNumer / 6) # devide bz 6 due to 6 x6 select the right line
             
             for ((i=0;i<6;++i)) do # set AVa to do 6 MOVES
             insertI= expr $i + 1
	     customGrep0=$(grep "Feld'$adjustNuer'_'$insertI'" $6) # get another FELD depending where AVA is in fst MOVE
	     customCheck=$(echo "$customGrep0" | awk '{print($2)}') # check TYPE
             
             

            if [ "$customCheck" '==' 'TYPE' ]
            then
                echo "RUN TYPES"
	       
<<COMMENT
            function myCheck() {
                 if [ "$customCheck" '==' "TYPE" ]
                 then

                     for ((i�=0;ii<4;++ii) # every field like this one has four degrees of freedom
                     # belowv check if input is even
                     if [ '$ii' -eq 0 ];  # source https://www.unix.com/shell-programming-and-scripting/240237-odd-even-date-bash.html
                     then
                         # get neiighbouring fields
			 checkXbar= $(grep "Feld'$adjustNuer'_'$insertI'" $6)
			 if [ "$adjustNuer" '==' "1" ]
			 then 
			    foExpand= expr $adjustNuer + $i # with each MOVE parse through 6 MOVES = i
			    aBarX=$(grep "Xbar" $6)
                            aBarY=$(grep "Ybar" $6)
			    getRightX= expr 5 + $foExpand
			    xExpand=$(echo "$aBarX" | awk '{print($'$getRightX')}') # get next coordinate from Xbar
			    yExpand=$(echo "$aBarY" | awk '{print($'$getRightX')}') # get next coordinate from Ybar
			    # adding 5 to use oD1.sh Xbar entry
			    # Xbar -222 -444 0.00000000 -222 -317 -411.99988 -507 -602 -697
                            # xExpand  of  Xbar => -222 
                            #for ((iii=0;iii<6;++iii)) # ------------------------------------------ DEFINE HOW MANY MOVES AVA takes
			elif [ "$adjustNuer" '==' "6" ]
			then
			    foExpand= expr $adjustNuer + $i # with each MOVE parse through 6 MOVES = i
                            aBarX=$(grep "Xbar" $6)
                            getRightX= expr 5 + $foExpand
                            xExpand=$(echo "$aBarX" | awk '{print($'$getRightX')}') # get next coordinate from Xbar
			    xExpand                                                # export last X coordinate
			    #driveHand= expr $adjustNuer - 1 
                            #checkXbar= $(grep "Feld'$adjustNuer'_'$insertI'" $6)

                        else
			    foExpand= expr $adjustNuer + $i # with each MOVE parse through 6 MOVES = i
                            aBarX=$(grep "Xbar" $6)
                            getRightX= expr 5 + $foExpand
                            xExpand=$(echo "$aBarX" | awk '{print($'$getRightX')}') # get next coorinate from Xbar

			  
                 }
COMMENT
            else
		 echo "dat"
            fi		 
	    done
            }
<<COMMENT
               rm object.svg
               touch object.svg
               if [] "" **
               #  if [ "$i" '==' "0" ]
               #  then
         # input1= e.g feld1_1 222 91
                     somein=$(cat svgHeader)
                     mesReady=" <rect name = \"$i\" class= \"room wall\" width = \"94\" height=\"123\" x=\"$getInput2\" y=\"$getInput\"/>"
                     echo "$somein" >> "object.svg"
                 elif [ "$zeropl2" '==' "$bak" ] && [ "$zeroplus" '==' "$lengde" ]    ######################## Writing object to file
                 then
                         moIn=$(echo $(cat svgTail))
                    echo " writn svg tail to object.svg"
           #   foinput=$(echo "[ " $getInput ", " \"$getInput2\" "]]]; ")
                    echo "$moIn" >> "object.svg"
                 else
                    mesReady=" <rect name = \"$i\" class= \"room wall\" width = \"94\" height=\"123\" x=\"$getInput2\" y=\"$getInput\"/>"
                    echo "$mesReady" >> object.svg
                 fi
                 }
                     #fi
COMMENT
# write javascript objects or svg file
function tk1() {
   if [ $readOp '==' "object" ] || [ "$readOp" '==' "svg" ]
   then
      rm object.sh
      rm object.js
      touch object.js
      echo "wrote object.js"
      rm object.svg
      touch object.svg
      echo "wrote object.svg"
      mapUniques #paste unique3.sh unique2.sh >> object.sh

   else
      echo "did not write object.js"
   fi
   }
# make object
# 1. run tk1 -> write object.js
# 2. define a [NAME] e.g 
#     echo {Peter,Hans,Gordon}
# 3.  rm & touch unique4.sh
# 4. run a [grep NAME object.js]
#
rm unique4.sh
touch unique4.sh
nomen="word"
blomen=$5
solong2=$(grep -o "$5" $edger | wc -l)

cout="1"
####################################################################### 2 similar things
### the MATCHES and their position in PREDECESSOR
whole=$(grep -n "$5" $edger)
#posiM=$(grep -n "Node" aDict1.sh | cut -d : -f1i)
######################################################## OBJECTfiles
#rm "object1.sh"
#touch "object1.sh"
tofile4=$(echo "$whole" >> unique4.sh) #object1.sh)
$tofile4
tel=$(echo $(grep -n "$5" $edger | cut -d : -f1))   # just line numbers of 
matchNames= read one _ <<< $tel

paste unique3.sh unique2.sh
tk1
echo "done wrote: unique1.sh unique2.sh unique3.sh unique4.sh object.sh"
echo "posis of" $5 : $tel
echo "its length" $lengde
