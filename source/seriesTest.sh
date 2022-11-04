#!/usr/bin/env bash
    #              ^^^^- NOT sh; sh does not support [[ ]] or <(...)

inP=$1  # e.g "Feld1" for lines works on ascending rows of line numbers
        # or  ""_1$"" for columns
	   #          the export of this function is not complete
	   #  _1         2 fst digit correct
	   #  _2 .. _5   correct but missing last digit
	   #  _6         fst digit correct
inP2=$2    # e.g unique4.sh
function seriesTest () {
      list=$(grep "$inP" $inP2 | awk '{print($1)}' | cut -f1 -d:)
      solang=$(echo "$list" | wc -w)
      for ((q=0;q<$solang;++q)) do
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
	    if [ "$fromList" '==' "$calc1" ] || [ "$tocalc" '==' "$solang" ] # e.g 10 == 10
	    then 
		echo "$otP"
	   else 
                echo ""$otP 888 $co3 ,""
	    fi
      done
     }
seriesTest
