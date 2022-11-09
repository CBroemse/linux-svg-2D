#!/usr/bin/env bash
    #              ^^^^- NOT sh; sh does not support [[ ]] or <(...)

inP=$1  # e.g "Feld1" for lines works on ascending rows of line numbers
        # or  ""_1$"" for columns
	   #          the export of this function is not complete
	   #  _1         2 fst digit correct
	   #  _2 .. _5   correct but missing last digit
	   #  _6         fst digit correct
inP2=$2    # e.g unique4.sh
inP3=$3 # $iOne
inP4=$4 # iiOne => more options
function seriesTest () {
      list=$(grep "$inP" $inP2 | awk '{print($1)}' | cut -f1 -d:)
      solOng=$(echo "$list" | wc -w)
      for ((q=0;q<$solOng;++q)) do	
	    tocalc=$(echo | expr "$q" '+' 1)
            tocalc2=$(echo | expr "$q" '+' 2)
            fromList=$(grep "$inP" $inP2 | head -$tocalc | tail -1 | cut -f1 -d:)
            fromList2=$(grep "$inP" $inP2 | head -$tocalc2 | tail -1 | cut -f1 -d:)
	    calc1=$(expr $fromList2 '-' 1) 
	    calc2=$(echo "$fromList")
	    coli=$(expr $calc2 '-' $q)
	    co2=$(expr "$coli" '/' 6) 
	    co3=$(expr "$co2" '+' 1)
	    otP=$(grep "$inP" $inP2 | head -$tocalc | tail -1 | cut -f1 -d:)
	    biN=$(expr $tocalc '>' 1) # to match with binary operator
	     if  [ "$tocalc" '==' "1" ] && [ "$fromList" '==' "$calc1" ] &&  [ "$inP3" '==' "1" ] # e.g 10 == 10   
            then 
		 echo ""[[[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "] , "" >> "object.js"
		 echo ""[[[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "] , ""
	    elif  [ "$tocalc" '==' "1" ] && [ "$fromList" '==' "$calc1" ] # e.g 10 == 10   
            then 
		 echo ""[[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "] , "" >> "object.js"
		 echo ""[[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "] , ""
       #     elif [ "$fromList" '==' "$calc1" ] && [ "$iiOne" '==' "1" ]
	#    then
	#	 echo ""[[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "] , "" >> "object.js"
	#	 echo ""[[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "] , "" 
           elif [ "$fromList" '==' "$calc1" ] && [ "$biN" '=' "1" ] # e.g 10 == 10
	    then
		 echo ""[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "] , "" >> "object.js"
		 echo ""[  \"ntest"$iOne"_"$iiOne\", " "  \"$otP\" "] , ""
         #  elif [ "$fromList" '==' "$calc1" ] || [ "$tocalc" '==' "$solOng" ] # e.g 10 == 10
	  #  then
	#	 echo ""[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "]] , "" >> "object.js"
	#	 echo ""[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "]] , ""  
           elif [ "$fromList" '==' "$calc1" ] || [ "$inP4" '==' "$solOng" ] && [ "$inP3" '==' "$solOng" ]
	   then
		 echo ""[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "]] , "" >> "object.js"
		 echo ""[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "]] , ""
           elif [ "$fromList" '==' "$calc1" ] || [ "$inP4" '==' "$solOng" ]
	   then
		 echo ""[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "]] , "" >> "object.js"
		 echo ""[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "]] , ""
	   else 
                notNseri=$(echo ""$otP 888 ,"")
		foInt=$(echo "$notNseri" | wc -w)
		tosInt=$(expr $foInt '/' 2)
		 for ((qq=0;qq<$tosInt;++qq)) do
		   qqOne=$(expr $qq '+' 1)
		   taker=$(expr $qqOne '*' 1) 
		   seritP=$(echo "$notNseri" | awk '{print($'$taker')}')
                   # echo $seritP
		   echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "]] , ""
	   done   
	    fi
      done
     }
seriesTest
