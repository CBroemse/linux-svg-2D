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

./linuxJSobject.sh "grobi" object 4 2 "node" oD1.sh 

OVERVIEW
  mapping functions to read out of file

  MAP $edger write/and insert in 
    - unique1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 .sh
    - object, 1 .sh
 
FUNCTIONS              purpose
js/ svg: mapUniques      via functions:  changeSVGanim , write js objects
     stride          test move                 
     weakesLink      write 2 moves
needs two computations still to realise changes in code in browser.
Due to the early use of 'unique7.sh' - under development
js   :	
          

# usage e.g *>  ./linuxJSobject.sh "Feld" svg 3 3 "Feld" oD1.sh
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
# else./linuxJSobject.sh "peter" 1 2 4 "node" aDict1.sh
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
#	    tX=$(echo $(awk '{ print($2) }' <<< $(head -n "$i" $6 | tail -1))) #get fst word of each lne of $6 e.g $edger
#	    tY=$(echo $(awk '{ print($4) }' <<< $(head -n "$i" $6 | tail -1))) #get 3rd word ..
            myGrep=$(grep -n "Feld" $edger) #get X coordinate o field
           # takeSteps=$(echo $(grep -n "$parS" $edger | cut -d : -f1))   # just line numbers of
           # bak=$(echo "$takeSteps" | wc -w)

           # tX=$(echo "$myGrep" | awk '{ print($5) }') # <<< $(head -n "$i" $6 | tail -1)) #get fst word of each lne of $6 e.g $edger
         #  tY=$(awk '{ print($4) }' <<< $(head -n "$i" $6 | tail -1)) #get 3rd word ..

        if [ "$i" '==' "0" ]
        then

         #  tY=$(awk '{ print($4) }' <<< $(head -n "$i" $6 | tail -1)) #get 3rd word ..

           echo "got s.th"
           echo "searchin TYPE vs WALL ?"
           echo " check column in DICTIONARY"
	   echo "$bebob" > "unique1.sh"  # search $5 
        else
	   foXY=5 # select collum in DICTIONARY e.g $edger COLUMN 5
	   foTYPE=2
	   tKi=$(echo "$myGrep" | awk '{ print $'$foXY' }' | head -n "$i" $6 | tail -1) # set for X or Y coodinate ..
           tKii=$(echo "$myGrep" | awk '{ print $'$foTYPE' }' | head -n "$i" $6 | tail -1) # set for TYPE or WALL collumn

           echo " "$i" \"fl$i\" "$tKi" "$tKii" "NOTHING"" >> "unique1.sh"
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

changeSVGanim() {
   lastPosi=$(grep -n "freeze" svgTail | tail -1) # previous simulation
   lastX=$(awk '{print($7)}' <<< $lastPosi)
   lastY=$(awk '{print($8)}' <<< $lastPosi)
   lastTime="15s"
   echo "$lastX" "$lastY" "$lastTime"
}
# function below searches DICTIONARY
# depending on $3 = $readOP of main input
#              $3 == svg || $3 == object 
mapUniques() {
 for ((pm=0;pm<$lengde;++pm)) do
 zeroplus=$(echo | expr $pm + 1) # to write vim starts with lin no. 1 not 0 therefore + 1
 parS=$(echo "$poe" | awk '{print($'$pm')}') #parse NAMEString one by one
 #$parS
 #search name x in file
 myGrep=$(grep -n "$parS" $edger) #get whole line(s) from DICTIONARY
 takeSteps=$(echo $(grep -n "$parS" $edger | cut -d : -f1))   # just line numbers of search's MATCHES
 bak=$(echo "$takeSteps" | wc -w)
 rectGrep=$(grep -n ""E$"" $edger) #get whole line(s) from DICTIONARY
 rectSteps=$(echo $(grep -n ""E$"" $edger | cut -d : -f1))
   for ((i=0;i<$bak;++i)) do  ############ change bak OR kob
	   #bak to write iteration and kob for an object == length aDict1.sh
	zeropl2=$(echo | expr $i + 1) ###################### length of NAME in input from lines of MATCHES in INPUT
        zeropl3=$(echo | expr $i + 2) ######################
        getInputY=$(head -n $i unique3.sh | tail -1)
        getInputX=$(head -n $i unique2.sh | tail -1)
	kbt=$(echo | expr $kob - 1)
	ups=$(echo | expr $i + 1)
      parS2=$(echo "$takeSteps" | awk '{print($'$i')}') #----------------------- parser get Line number of MATCHES
      getWhole=$(echo "$myGrep" | awk '{print($'$i')}')
      cde=$(echo "got s.th ii '$i $parS $bak'")
      # echo '$poe' | awk  '{print $2}'

      function drama() {
           #for ((i=0;i<$bak;++i))
              #   rm object.svg   a
               #  touch object.svg
            getTYPE=$(head -n $i $edger | tail -1) # | awk '{print($4)}') # get TYPE or WALL
            columnTYPE=$(echo "$getTYPE" | awk '{print($2)}')
      function classProv() {
                if [ "$columnTYPE" '==' "TYPE" ] || [ "$columnTYPE" '==' "AVA" ]
                then
                     echo "room sith"
		elif [ "$columnTYPE" '==' "WALL" ]
		then
		     echo "room wall"
                else 
                     echo "room sith"
                 fi
                 }

	    if [ "$readOp" '==' "svg" ]
            then
                 if [ "$i" '==' "0" ]
                 then
         # input1= e.g feld1_1 222 91
                     somein=$(cat svgHeader)
		     aclas=$(classProv)
                     mesReady=" <rect name = \"$i\" class= \"$aclas\" width = \"94\" height=\"123\" x=\"$getInputX\" y=\"$getInputY\"/>"
                     echo "$somein" >> "object.svg"
                 elif [ "$zeropl2" '==' "$bak" ] && [ "$zeroplus" '==' "$lengde" ]    ######################## Writing object to file
                 then
                         moIn=$(echo $(cat unique7.sh))
                    echo " writn svg tail to object.svg"
           #   foinput=$(echo "[ " $getInput ", " \"$getInput2\" "]]]; ")
                    echo "$moIn" >> "object.svg"
                 else
		    aclas=$(classProv)
                    mesReady=" <rect name = \"$i\" class= \"$aclas\" width = \"94\" height=\"123\" x=\"$getInputX\" y=\"$getInputY\"/>"
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
     # <animateMotion path="M  0 0 L -280 0" begin="2.1s" dur="0.3s" fill="freeze"/>
     <animateMotion path="M  -280 0 L -280 -123" begin="4.1s" dur="0.3s" fill="freeze"/>
     <animateMotion path="M  -280 -123 L -374 -123" begin="6.1s" dur="0.3s" fill="freeze"/>
     <animateMotion path="M  -374 -123 L -374 -369" begin="8.1s" dur="0.3s" fill="freeze"/>
     <animateMotion path="M  -374 -369 L 0 -369" begin="10.1s" dur="0.3s" fill="freeze"/>
     <animateMotion path="M  0 -369 L 0 -492" begin="12.1s" dur="0.3s" fill="freeze"/>
COMMENT
# -------------------------------------------------------- SVG writer
#function writeSVG() {
   # rewrite drama
   # have function seperatly to enahnce readability of function mapUnique
   # } 
pok=$5
function weakesLink() {
     TZPEs=$(grep -n ""E$"" $edger)
     rm unique4.sh
     touch unique4.sh
     echo "$TZPEs" >> unique4.sh
     for ((mi=0;mi<6;++mi)) do
	     iOnem=$(echo | expr $mi + 1)
             xtrailm=$(grep -n "Feld$iOnem" unique4.sh)
             typeLInksWEAKm=$(echo "$xtrailm" | wc -w) # ########################################### MEASURE WEAKEST LINK  
	     echo "$typeLInksWEAKm" "$iOnem" 
     done
       
}

TARGET="Feld6_6"
function moveToWeaks() {
             foAVA=$(grep -n "AVA" $edger)
	     foTARGET=$(grep -n "$TARGET" $edger)
	      echo "    I. write unique6.sh via ./thisAlgo1.sh"
	      echo "        a) Max of Y's in unique5.sh"
	      echo "        B) max of X in unique6.sh via"
	      echo "             $bestConnect (below)"
	      #                   sum of Y and X per line
              echo "    II. decide PATH from"
  	      echo "        a) AVA to weakesLink"
              echo "        b) weakesLink to TARGET"    
	    rm unique5.sh ; touch unique5.sH ; weakesLink ; weakesLink >>  unique5.sh
       	    rm unique6.sh ; touch unique6.sh ; rm unique7.sh ; touch unique7.sh
	    rm unique8.sh ; touch unique8.sh  
         for ((i=0;i<6;++i)) do
	     iOne=$(echo | expr $i + 1)
	     selters=$(echo | sort -nr unique5.sh | tail -$iOne | head -1) # out of columns filter WEAKEST link line number
	     selToTarget=$(head -n $iOne unique5.sh | tail -1) # the order is N of different length
             typeMighty=$(echo | sort -nr unique5.sh | head -1 | tail -1) # reverse selters -> most Mighty TYPE acumulation in lines
	     
	     targOrd=$(awk '{print($1)}' <<< $selToTarget)
	     ofsleters=$(awk '{print($2)}' <<< $selters)  # get column number of weakest link
             stringth=$(awk '{print($1)}' <<< $selters)
	     typeXsMight=$(awk '{print($2)}' <<< $typeMighty)
	     strngh=$(echo | expr $stringth / 7)
	     fomightTarg=$(expr $targOrd / 7)
	     mightTarg=$(echo "$fomightTarg")
	     getLin=$(head -n $i $edger | tail -1)    # get line 
             foMOVE=$(grep -n "Feld$iOne" $edger)
	     targetLin=$(grep -n "$TARGET" $edger | awk '{print($1)}' | cut -f1 -d:) # line number o TARGET in DICTIONARY
             ofTarget=$(awk '{print($3)}' <<< $foTARGET)
             xtrail=$(grep -n "Feld$iOne" unique4.sh) # set to find TARGET -> show line number
	     
             typeLInksWEAK=$(echo "$xtrail" | wc -w) # ########################################### MEASURE WEAKEST LINK
             awk '{ print $1 }' <<< $(head -n $i unique1.sh | tail -1)
             prep=$(grep -n "AVA" $edger) # grep with -n to match with line numbers
	     moprep=$(echo "$prep" | awk '{print($1)}')
	     getInput=$(head -n $zeropl2 unique3.sh | tail -1)
             getInput2=$(head -n $zeropl2 unique2.sh | tail -1)
	     echo "move '"$iOne"': -------------------- " 
	     echo "        a) AVA to weakesLink"     	    
	 #   echo "$selters" # weakesLink 
	     meter=$(echo "length xtrail: $mightTarg") # strngh")
	     if [ "$strngh" '==' "0" ]
	     then 
		  echo " way is blocked at line" "$ofsleters"
		  echo "$meter"
	     elif [ "$strngh" '==' "1" ]
	     then 
		 echo "narrow at" "$ofsleters"
		 echo "$meter" 
	     else
		 echo "walking..."
		 echo "$meter"
	     fi 
	    
	      for ((ii=0;ii<$fomightTarg;++ii)) # ########################################################## ------------ ii
	          do
	         echo "$ii"
		 iiOne=$(echo | expr $ii + 1)
		 iOneff=$(echo | expr $iOne + 2)
		 xtrail2=$(grep ""Feld$iOne"" unique4.sh) # set to find TARGET -> show line number

          # iOne. iiOne. toMatch. xtrail2. 14.1s. columnNumber. pingLine. pingColu. pingLMight. pingColuMight. 
                 ./thisAlgo1.sh "$iOne" "$iiOne" "$toMatch" "$xtrail2" "$begin" "$columnNumber" "$pingLine" "$pingColu" "$pingLMight" "$pingColuMight"
	      done
	     done
 # thisAlgo1 front-end -----------------------##################################### FRONT END: './thisAlgo1.sh'
 # bestConnect:  list of weights y x -> take best 3 of 6
 # step1= length bestConnect n -> map with bestConnectValues n times
 # type: vim -O unique8.sh unique5.sh unique6.sh unique4.sh
 #              |            |           |   
 #     -> weights Y -> weights sum Y X -> source
	     bestConnect=$(echo | sort -nr unique6.sh | head -3) # set to best 3 lines | head -1 | awk '{print($1)}')
	     step1=$(echo "$bestConnect" | wc -l) # count max connected lines
             for ((iii=0;iii<$step1;++iii)) do
	         echo "bo----------------------------bo"
		 jOne=$(echo | expr $iii + 1)
		 jjOne=$(echo | expr $iii + 2)
		 bC=$(echo "$bestConnect" | head -$jOne | tail -1 | awk '{print($1)}')
	#	 echo "$bC" "maximum X + Y" 
                 place3=$(grep -n "$bestConnect" unique6.sh | tail -$iii | head -1) # need $jjOne due to sort ?! 	
		 place=$(grep -n "$bestConnect" unique6.sh | tail -$jOne | head -1) # counter + 1
		 place2=$(grep -n "$bestConnect" unique6.sh | tail -$jjOne | head -1) # need $jjOne due to sort ?!
		 fosTead=$(echo "$bestConnect" | head -1 | awk '{print($1)}') # always search best sum y x -> line 
                 placeSteady=$(grep -n "$fosTead" unique6.sh |  cut -f1 -d:) # always row maximun Y + X
                 itsLine=$(echo "$place" | cut -f1 -d:)
		     oneMinusAVA=$(expr "$itsLine")
		     itsLine2=$(echo "$place2" | cut -f1 -d:)
		     oneMinusAVA2=$(expr "$itsLine2" '-' 1)
		     oneMinusAVA3=$(echo "$place" | cut -f1 -d:) # move on step ahead of counter
		     YorX=$(head -n $jOne unique8.sh)
		     function dojo() { 
			if [ "$YorX" '==' "X" ] 
	                then
			       	echo "123 120"
			else 
				echo "120 123"
			fi }
			dojo1=$(echo dojo | awk '{print($1)}')
		#  dojo2=$(echo dojo | awk '{print($2)}'
		  fom1=$(expr "$oneMinusAVA2" '*' -$dojo1)
                  fom2=$(expr "$fom1" '-' "$fom1")
		  xWEAK2=$(grep -n ""_5$"" unique4.sh | tail -$jOne | head -1)
		  
	     foM1=$(expr "$oneMinusAVA" '*' -123)
	     fofoM2=$(expr "$foM1" '*' -1) 
	     foM2=$(expr "$fofoM2" '+' "$foM1")
	     
                  insertAt=$(grep -n "freeze" svgTail | tail -1 | cut -d : -f1)
                  prepAt=$(expr $insertAt + $iii)
                  headD=$(head -n $prepAt svgTail)
		  echo "$oneMinusAVA2"
		  echo "$oneMinusAVA" "select maximum X or Y "
		  echo "$oneMinusAVA3"
	       # move1: $1 = old x = last val: 0, -> changeSVGanim | awk '{print($1)}'
		  #     $2 = old y = $fom1       ->
		  #     $3 = old time = last sec: 12 -> changeSVGanim | awk '{print($3)}'
		  #     $4 = new x = $fom2
	          #     $5 = new y =                -> changeSVGanim | awk '{print($2)}'	  
   	       # move2: $1 = old x = last val: 0, -> changeSVGanim | awk '{print($1)}'
		  #     $2 = old y = $fom1       ->
		  #     $3 = old time = last sec: 12 -> changeSVGanim | awk '{print($3)}'
		  #     $4 = new x = $fom2
	          #     $5 = new y =                -> changeSVGanim | awk '{print($2)}
		  foTim1=$(expr "$jOne" '*' 2)
		  timeS=$(echo | expr 12 '+' "$foTim1")
		  oldXM1=$(echo $(changeSVGanim | awk '{print($1)}'))
		  oldYM1=$(echo $(changeSVGanim | awk '{print($2)}' | sed 's/"//'))
		   fofoMidle=$(expr "$oneMinusAVA" '*' -1)
			  foMidle1=$(expr 100 '*' "$fofoMidle")
	                  foMidle2=$(expr "$foMidle1" '+' 20) # e.g line: 5 -> -500 +20 -> -480
	#		  fofoMidle2=$(expr "$oneMinusAVA" '*' -$placeSteady)
	#		  foMidle12=$(expr 10 '*' "$fofoMidle2")
	 #                 foMidle22=$(expr "$foMidle12" '-' 20) # e.g line: 5 -> -500 +20 -> -480
		  fofoMM=$(expr "$oneMinusAVA" '*' -1)
			  foMM1=$(expr 100 '*' "$fofoMM")
	                  foMM2=$(expr "$foMM1" '+' 20) # e.g line: 5 -> -500 +20 -> -480
			  fofoMM2=$(expr "$oneMinusAVA3" '*' -$placeSteady)
			  foMM12=$(expr 100 '*' "$fofoMM2")
	                  foMM22=$(expr "$foMM12" '+' 20) # e.g line: 5 -> -500 +20 -> -480 
		  	  
	    function lineOrColumn () {      
	          
		  inp1=$1 ; inp2=$2 ; inp3=$3 ; 
		  if [ "$YorX" '==' "X" ] && [ "$jOne" '==' "1" ]
		  then 	
			 # echo $(""M "$1" "$2" L "$3" "$1""")
			  echo ""\<animateMotion path=\"M "$inp1" "$inp2" L "$inp3" "$inp1"\" begin=\""$timeS".1s\" dur=\"0.3s\" fill=\"freeze\"\/\>""
		  
		  elif [ "$YorX" '==' "Y" ] && [ "jOne" '==' "1" ]
		  then
			#  echo $(""M "$1" "$2" L "$1" "$3""")
			  echo ""\<animateMotion path=\"M "$inp1" "$inp2" L "$inp3" "$inp1"\" begin=\""$timeS".1s\" dur=\"0.3s\" fill=\"freeze\"\/\>""
		  elif [ "$jOne" '==' "$step1" ]
		  then
			#  echo $(""M "$1" "$3" L "$1" "$2""")
			  echo ""\<animateMotion path=\"M "$inp1" "$inp3" L "$inp1" "$inp2"\" begin=\""$timeS".1s\" dur=\"0.3s\" fill=\"freeze\"\/\>""
		  else # [ "$YorX" '==' "Y" ]
			#  echo $(""M "$1" "$2" L "$3" "$1""")
			  echo ""\<animateMotion path=\"M "$inp1" "$inp2" L "$inp3" "$inp2"\" begin=\""$timeS".1s\" dur=\"0.3s\" fill=\"freeze\"\/\>""
	          fi
	          }
	         
                 # lineOrColumn	  
		  if [ "$jOne" '==' "1" ]
		  then 
		    
		     echo "$bC" "maximum X + Y rank:" "$jOne" "$oldXM1" "$oldYM1" 
		     move1=$(echo $(lineOrColumn "$oldXM1" "$oldYM1" "$foM2")) # "$foMidle22")) # "$fom2" "0" "$fom1"))	  
                     echo "$headD" "$move1" >> unique7.sh
		     echo "$place2" "maximum Xrank:" "2"
		     echo "$place2" |  cut -d : -f 
                     echo "$move1"
		  elif [ "$jOne" '==' "$step1" ]
		  then
		     
		     move3=$(echo $(lineOrColumn "$foMM22" "123" "0"))
                     echo "$move3" >> unique7.sh
		     echo "$bC" "maximum X + Y rank:" "$jOne"  
		     echo "$place" "maximum X  rank:" "$iii" 
		     echo ""\<\/g\> \<\/g\> \<\/svg\>"" >> unique7.sh
                     echo "$move3" # due to syntax only need last occurance for all 6		       
                  else
		    	  
		     move2=$(echo $(lineOrColumn "0" "0" "$foMM1"))
                     echo "$move2" >> unique7.sh  
		     echo "$bC" "maximum X + Y rank:" "$jOne" 
		    
		     echo "$place3" "maximum X rank:" "$jOne" 	
	             echo "$move2"		
		  fi
	   done	  
              # echo "$customGrep0" # "$buility" #"$insertI" #"$customGrep"
	       # changeSVGanim
            }

# the function below illustrates some useful parameters that can be used
# to write a move function, a combination of weakesLink and if clauses ...
#  stride -> move => MOVE 
# TARGET = Feld6_6
function stride() {
             randLine=$(grep -n "R" $edger) # whole line of matches of 'Rand'='R' fields
	     getRandNumber=$(echo $(grep -n "R" $edger | cut -d : f1))   # just line numbers of search's MATCHES
             newI=$(echo "$getRandNumber" | wc -w)
             checkType=$(echo "$randLine" | awk '{print($2)}') # selct 2nd Column TYPE vs WALL
             foAVA=$(grep -n "AVA" $edger)
	     foTARGET=$(grep -n "$TARGET" $edger)
             TZPES=$(grep ""E$"" $edger)
	     typeLines=$(echo $(grep -n ""E$"" $edger | cut -d : f1))
	     
	      echo "\nMEASSURE weakest link -----------------------"
	      echo "  - 2 streams of action "
	      echo "    I. get coordinates : AVA, weakesLink, TARGET"
              echo "    II. decide PATH from"
  	      echo "        a) AVA to weakesLink"
              echo "        b) weakesLink to TARGET"    
	    rm unique5.sh
	    touch unique5.sH
	    weakesLink
	    weakesLink >>  unique5.sh
	     echo | sort -nr unique5.sh | tail -1 
	     echo | sort -nr unique5.sh | tail -2 | head -1
	     echo | sort -nr unique5.sh | tail -3 | head -1
	     echo | sort -nr unique5.sh | tail -4 | head -1
	     echo | sort -nr unique5.sh | tail -5 | head -1
	    # awk '{print($2)}' |
       	    rm unique6.sh
            touch unique6.sh   
         for ((i=0;i<6;++i)) do
	     iOne=$(echo | expr $i + 1)
	    
	     selters=$(echo | sort -nr unique5.sh | tail -$iOne | head -1) # function to filter WEAKEST linki
	     selToTarget=$(head -n $iOne unique5.sh | tail -1) #  $(echo | grep -n unique5.sh | tail -$iOne | head -1) # the order is N of different length
             typeMighty=$(echo | sort -nr unique5.sh | head -1 | tail -1) # reverse selters -> most Mighty TYPE acumulation in lines
	        # say if AVA line and a TYPE line are the same
               #      then 
	        #         go to strngh ==  4
		#	 search 
                #         grep -n "Feld$strngh" "unique4.sh"
			 
	     
	     targOrd=$(awk '{print($1)}' <<< $selToTarget)
	     ofsleters=$(awk '{print($2)}' <<< $selters)
             stringth=$(awk '{print($1)}' <<< $selters)
	     typeXsMight=$(awk '{print($2)}' <<< $typeMighty
     )
	     strngh=$(echo | expr $stringth / 7)
	     fomightTarg=$(expr $targOrd / 7)
	     mightTarg=$(echo "$fomightTarg")
	     getLin=$(head -n $i $edger | tail -1)    # get line 
             foMOVE=$(grep -n "Feld$iOne" $edger)
	     targetLin=$(grep -n "$TARGET" $edger | awk '{print($1)}' | cut -f1 -d:) # line number o TARGET in DICTIONARY
             ofTarget=$(awk '{print($3)}' <<< $foTARGET)
	     # targetYs
             # ofT2=$(echo | expr $targetLin / 6) # line number of TARGET in Dictionary	     
	     # different orders for different purposes
	     # e.g ----------------------------------------------- fst level orders:
	     #   TARGET relative to AVA: 6 ..      1 -> 
	     #               weakesLink: 4 2 3 1 5 6 
             #               
             xtrail=$(grep -n "Feld$iOne" unique4.sh) # set to find TARGET -> show line number
	     xWEAK=$(grep -n "Feld$ofsleters" unique4.sh) # set to find weakestLink
             typeLInksWEAK=$(echo "$xtrail" | wc -w) # ########################################### MEASURE WEAKEST LINK
             awk '{ print $1 }' <<< $(head -n $i unique1.sh | tail -1)
	     avaX=$(echo "$foAVA" | awk '{print($3)}') # get x value of avatar
             avaY=$(echo "$foAVA" | awk '{print($5)}') # get y value of avatar
	     avaLine=$(echo "$foAVA" | awk '{print($1)}')
             prep=$(grep -n "AVA" $edger) # grep with -n to match with line numbers
	     moprep=$(echo "$prep" | awk '{print($1)}')
	     getInput=$(head -n $zeropl2 unique3.sh | tail -1)
             getInput2=$(head -n $zeropl2 unique2.sh | tail -1)

	     dub= read some _  <<< "$avaLine"             # ---------------- EXTRACT line with AVATAR
	     otherdat=$(awk '{print($2)}' <<< "$foMOVE") 
	     extractNumer=$(echo "$some" | cut -f1 -d:) # => e.g "Feld1_1 => 1
                                                        #  =>     "Feld3_3 => 15
	     
	    echo "move '"$iOne"': -------------------- " 
	    echo "        a) AVA to weakesLink"     	    
	 #   echo "$selters" # weakesLink 
	    echo "selected line: " "$ofsleters"
	    meter=$(echo "length xtrail: " "$mightTarg") # strngh")
	    if [ "$strngh" '==' "0" ]
	     then 
		  echo " way is blocked at line" "$ofsleters"
		  echo "$meter"
	     elif [ "$strngh" '==' "1" ]
	     then 
		 echo "narrow at" "$ofsleters"
		 echo "$meter" 
	     else
		 echo "walking..."
		 echo "$meter"
	     fi 
	    
	    echo $xtrail
             adjustNuer=$(echo | expr $extractNumer / 6) # devide bz 6 due to 6 x6 select the right line
	     foextr=$(echo | expr $adjustNuer + 1)
		insertI=$(echo | expr $i + 1) 
		buility=$(echo "$poe""$extractNumer""_""$insertI") # ------------------------------- BUILD custom GREP advance functionality of svg
               foastrid=$(echo ""Feld$foextr'_'$insertI"")
               customGrep0=$(grep "$foastrid" $edger) #"\"Feld'$adjustNuer'_'$insertI'\"" $edger) # get another FELD depending where AVA is in fst MOVE
	       customCheck=$(echo "$customGrep0" | awk '{print($2)}') # check TYPE
	      for ((ii=0;ii<$fomightTarg;++ii)) # ########################################################## ------------ ii
	          do
	             echo "$ii"
		     iiOne=$(echo | expr $ii + 1)
		     iiOnef=$(echo | expr $iiOne + 1)
		     iOnef=$(echo | expr $iOne + 1)
		     iOneff=$(echo | expr $iOne + 2)
		     xtrail2=$(grep ""Feld$iOne"" unique4.sh) # set to find TARGET -> show line number
		     xfuture1=$(grep ""Feld$iOnef"" unique4.sh)
		     xfuture2=$(grep ""Feld$iOneff"" unique4.sh)

                 jkAva=(${moprep//:/ })
		  nuAnum=$(echo ${jkAva[0]})
		   nuA=$(echo ${jkAva[1]})                # "1:Feld1_4RV" ->
                 cleanStrFutALi=$(echo "$nuA" | cut -c 7) # "Feld1_4RV -> Feld1_4  -> 4

		 tsg=$(echo "$xtrail" | head -$iiOne | tail -1)
		 moveDif=$(echo $tsg | awk '{print($3)}')  # coordinate ?
                 present=$(echo "$tsg" | awk '{print($1)}')
		 jk0=(${present//:/ })
		 nu0num=$(echo ${jk0[1]})
		 nu0=$(echo ${jk0[2]})                # "1:Feld1_4RV" ->
                 cleanStrFut0Li=$(echo "$nu0" | cut -c 7) # "Feld1_4RV -> Feld1_4  -> 4
	#	 echo $moveDif
	#	 echo $tsg
		 future1=$(echo "$tsg" | head -1)
		 jk1=(${future1//:/ })
		 nu1num=$(echo ${jk1[1]})
		 nu1=$(echo ${jk1[2]})                # "numberX:1:Feld1_4RV" -> 1:Feld1_4RV ->
                 cleanStrFut1Li=$(echo "$nu1" | cut -c 7) # "Feld1_4RV -> Feld1_4  -> 4
		 
		 future2=$(echo "$xfuture2" | head -$iiOne | tail -1 | awk '{print($1)}')
		 jk2=(${future2//:/ })
		 nu2num=$(echo ${jk2[0]})
		 nu2=$(echo ${jk2[1]})                # "1:Feld1_4RV" ->
                 cleanStrFut2Li=$(echo "$nu2" | cut -c 7) # "Feld1_4RV -> Feld1_4  -> 4
		 	pingLine=$(grep ""Feld$iOne"" unique4.sh) # choose longer one pingLine OR
	                 pingLMight=$(echo "$pingLine" | wc -w) ##	
	               pingColu=$(grep ""_$iOne$"" unique4.sh) # choose longer one pingColumn
	               pingColuMight=$(echo "$pingColu" | wc -w) ##	  
	     # path
              # pingColumn
	              columnCHECK=$( grep "7" <<< $(sort -t ',' -k1,4 unique6.sh | head -4))
	              rowCHECK=$(grep ""$iOne"" unique6.sh)
	              correcSleter=$(echo | expr $oflseters - 1)
	              toMatch=$(expr $pingLMight '>' $pingColuMight) # 
  # function below has two purposes    a) add avatar if ava = Feld1_1
  #                                    b) from 1_1 decide which is more mighty
  #                                       pingLine vs pingColuLine
  #                    a || b if a1 > b1 then eval pingLine 
  #   with every       a == odd  do -> pingLine
  #		       a == even do -> pingColuLine  
  #  OR vice versa
  #     also for a = b
  # [ "$iOne" '==' "1" ] ::= for every new pingLine   
  # [ "$iiOne" '==' "1" ] ::= for every new pingColu   
                 if [ "$iOne" '==' "1" ] && [ "$iiOne" '==' "1" ] && [ $toMatch '=' 1 ] # means : if pingLMight > pingColuMight is true
		 then
			# echo "blob------------------------------"
		   #  echo ""\"$""cleanStrFutALi"\""
		        echo "$cleanStrFutALi"", ""$nuAnum"", ""$iOne"", " "ava" >> unique6.sh
	              echo "$pingLMight" "$pingColuMight"
		      echo "pr ------------------------------------ XXX "
	               echo "$xtrail2" | tail -$correcSleter # pingLine
                 elif [ "$iOne" '==' "1" ] && [ "$iiOne" '==' "1" ] && [ $toMatch '=' 0 ] # : if pingLMight <= pingColuMight not true
		 then
		        echo "$cleanStrFutALi"", ""$nuAnum"", ""$iOne"", " "ava" >> unique6.sh
                       echo "pr ------------------------------------ YYY "
		       echo "$pingLMight" "$pingColuMight"
		       echo "$pingColu" | tail -$correcSleter # pingColumn
                 elif [ "$iiOne" '==' "1" ] && [ `expr $iOne % 2` == 0 ] && [ $toMatch '=' 1 ] # : if iOne even number and match true 
		 then
		       echo "pr ------------------------------------ XXX "
	               echo "$xtrail2" | tail -$correcSleter # pingLine
	          elif [ "$iiOne" '==' "1" ] && [ `expr $iOne % 2` == 0 ] && [ $toMatch '=' 0 ] # : if line number even and match not true
		  then
                       echo "pr ------------------------------------ YYY "
		       echo "$pingLMight" "$pingColuMight"
		       echo "$pingColu" | tail -$correcSleter # pingColumn
		  elif [ "$iiOne" '==' "1" ] && [ `expr $iOne % 2` == 1 ] && [ $toMatch '=' 0 ] # : if iOne odd number and match true
		 then
		       echo "pr ------------------------------------ XXX "
	               echo "$xtrail2" | tail -$correcSleter # pingLine
		       echo "$pingLMight" "$pingColuMight"
	       elif [ "$iiOne" '==' "1" ] && [ `expr $iOne % 2` == 1 ] && [ $toMatch '=' 1 ] # : if iOne odd number and match not true
	       then
		      echo "pr ------------------------------------ YYY "
		       echo "$pingLMight" "$pingColuMight"
		       echo "$pingColu" | tail -$correcSleter # pingColumn
	         fi	     
 #                                                                      #############################    SUMMING UP above
 # ends with: 'for the last pingColumn if iOne is even and Match is true' 
 # => send it every new line and new column -> send what
 # => basically a tree with two 'branches' at  the 'root'
 #    branch1: line > column -> odd = line
 #    branch2: line <= column -> even = line        
 # function is called every Feld1_1 Feld2_1 Feld3_1 ... Feld6_1 
 # --------------------------------------------------------------------------------------------------------------------------------------------------		
                # echo "$cleanStrFut0Li" "$nu0num" >> unique6.sh 
		# echo "$cleanStrFutALi" "$nuAnum" "$iOne" "ava" >> unique6.sh
	#	 echo "$moprep"
		 # below prepare for sorting collumns of future1 MOVES
		 # sort
		 topolog=$(echo "$cleanStrFut0Li"", ""$nu0num"", ""$iOne"", ""pres") 
	         echo "$topolog" >> unique6.sh
	#	 echo "$cleanStrFut1Li"
                 topolog2=$(echo "$cleanStrFut1Li"", ""$nu1num"", ""$iOne"", ""fut1")
		 echo "$topolog2" >> unique6.sh
	#	 echo "$xfuture1"
	#	 echo "$cleanStrFut2Li"", ""$nu2num"", ""$iOne"", ""fut2" >> unique6.sh
	#	 echo "$future2"
	            # fi
	      done
	      
               echo "$customGrep0" # "$buility" #"$insertI" #"$customGrep"
	       changeSVGanim
	     done
            }
      
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
     # stride
      moveToWeaks
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
echo "done wrote: unique1.sh unique2.sh unique3.sh unique4.sh unique5.sh unique6.sh object.sh"
echo "posis of" $5 : $tel
echo "its length" $lengde
