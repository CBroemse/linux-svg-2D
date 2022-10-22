#!/usr/bin/env bash
    #              ^^^^- NOT sh; sh does not support [[ ]] or <(...)

    inP=$1   
function seriesTest () {
                   list=$(grep "$inP" unique4.sh | awk '{print($1)}' | cut -f1 -d:)
		    solang=$(echo "$list" | wc -w)
		    fstElem=$(echo "$list" | head -1)
		     for ((q=0;q<$solang;++q)) do
			 tocalc=$(echo | expr "$q" '+' 1)
                         tocalc2=$(echo | expr "$q" '+' 2)
			 fromList=$(grep "$inP" unique4.sh | head -$tocalc | tail -1 | cut -f1 -d:)
		     fromList2=$(grep "$inP" unique4.sh | head -$tocalc2 | tail -1 | cut -f1 -d:)
			 calc0=$(expr $tocalc2 '-' 1)
		         calc1=$(expr $fromList2 '-' 1) 
			 if [ "$fromList" '==' "$calc1" ]  # e.g 10 == 10
		         then 
			     # echo "$fromList2" | head -1 | tail -1
			     grep "$inp" unique4.sh | head -$tocalc | tail -1 | cut -f1 -d:
			 else 
		              echo "888888"
			 fi
	             done
     }

seriesTest
