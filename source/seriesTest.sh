#!/usr/bin/env bash
    #              ^^^^- NOT sh; sh does not support [[ ]] or <(...)

inP=$1     # e.g "Feld1" for lines
           # or  ""_1$"" for columns
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
	    calc2=$(echo "$fromList" | awk '{print($1)}')
	    # colinear=$(echo | expr $(echo | expr $(echo | expr $calc2 '-' $q ) '/' 6) '+' 1)
	    if [ "$fromList" '==' "$calc1" ] || [ "$tocalc" '==' "$solang" ] # e.g 10 == 10
	    then 
		grep "$inp" $inP2 | head -$tocalc | tail -1 | cut -f1 -d:
	    else 
                echo ""$tocalc 888""
	    fi
      done
     }
seriesTest
