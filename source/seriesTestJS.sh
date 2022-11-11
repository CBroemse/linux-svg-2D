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
	    biN=$(expr $tocalc '>' 1) # to match with binary operator of this function
	    biNderiv1=$(expr $tocalc2 '=' 3) # to match with binary operator of q+1
	    biNderiv2=$(expr $tocalc2 '>' 4) # to match with binary operator of q+1
	    bin2iOne=$(expr $inP3 '>' 1)
            biN2iiOne=$(expr $inP4 '>' 1)
	     if  [ "$tocalc" '==' "1" ] && [ "$fromList" '==' "$calc1" ] &&  [ "$inP3" '==' "1" ] # e.g 10 == 10   
            then 
		 echo ""[[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "] , "" >> "object.js"
		 echo ""[[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "] , ""
         #   elif  [ "$biN" '=' "1" ] && [ "$fromList" '==' "$calc1" ] && [ "$biNderiv1" '=' "1" ] # &&  [ "$inP3" '==' "1" ] # e.g 10 == 10   
          #  then 
	#	 echo ""[[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "] , "" >> "object.js"
	#	 echo ""[[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "] , ""
	#    elif  [ "$tocalc" '==' "1" ] && [ "$fromList" '==' "$calc1" ] && [ "$biNderiv2" '=' "1" ]# && [ "$biNderiv2" '=' "1" ] # try to be be a [ ntest, "number" ]  
         #   then 
	#	 echo ""[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "] , "" >> "object.js"
	#	 echo ""[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "] , ""
     #   elif  [ "$tocalc" '==' "1" ] && [ "$fromList" '==' "$calc1" ] && [ "$tocalc2" '=' "3" ] # try to be be a [ ntest, "number" ]  
      #      then 
#		 echo ""[  \"ntest"$iOne"_"$iiOne\", " " \"$otP\" "] , "" >> "object.js"
#		 echo ""[  \"ntest"$iOne"_"$iiOne"\", " \"$otP\" "] , ""
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
	   else # ########################################################## writing two objects into a [object]
                notNseri=$(echo ""$otP 888 ,"")                   #### into a file e.g unique8.js        
		foInt=$(echo "$notNseri" | wc -w)   ## there can be only one object per file/[object] if it is an ascending series
		tosInt=$(expr $foInt '/' 2)         ## otherwise it will be more then one object written to that file/[object]
		 for ((qq=0;qq<$tosInt;++qq)) do    ## 
		   qqOne=$(expr $qq '+' 1)
		   taker=$(expr $qqOne '*' 1) # 2 to get 2nd column of $notNseri
		   seritP=$(echo "$notNseri" | awk '{print($'$taker')}')
                   # echo $seritP
		   biN2calc=$(expr $tocalc '>' 1)
		   biN2qqOne=$(expr $qqOne '>' 1)
		   if  [ "$tocalc" '==' "1" ] && [ "$qqOne" '==' "1" ] &&  [ "$inP3" '==' "1" ]
		   then
		      echo ""[[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "] , "" >> "object.js"
		      echo ""[[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "] , ""
		   elif  [ "$tocalc" '==' "1" ] && [ "$qqOne" '==' "$1" ] && [ "$qqOne" '==' "$solOng" ] # length qqOne = 1 ?   
                   then 
		      echo ""[[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "] , "" >> "object.js"
		       echo ""[[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "] , ""
		   elif  [ "$biN2calc" '=' "1" ] && [ "$biN2qqOne" '=' "1" ]  && [ "$biN2iOne" '=' "1" ] # all criteria > 1   
                   then 
		      echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "] , "" >> "object.js"
		      echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "] , ""
		  elif  [ "$biN2calc" '=' "1" ] && [ "$biN2qqOne" '=' "1" ]  && [ "$biiN2iOne" '=' "$solOng" ] # all criteria > 1   
                   then 
		      echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "]] , "" >> "object.js"
		      echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "]] , ""
		  elif  [ "$biN2calc" '=' "1" ] && [ "$biN2qqOne" '=' "1" ]  && [ "$biiN2iOne" '=' "$solOng" ] # all criteria > 1   
                   then 
		      echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "]] , "" >> "object.js"
		      echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "]] , ""
		  elif [ "$tocalc" '==' "$solOng" ] # #  && [ "$qqOne" '==' "1" ] &&  [ "$inP3" '==' "1" ]
		   then
		      echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "]] "" >> "object.js"
		      echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "]] ""
		  else 
		     echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "] , "" >> "object.js"
		     echo ""[  \"nint"$iOne"_"$iiOne"\", " \"$seritP\" "] , ""
		  fi 
	   done   
	    fi
      done
     }
seriesTest
