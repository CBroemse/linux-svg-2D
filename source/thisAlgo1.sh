#!/usr/bin/env bash
    #              ^^^^- NOT sh; sh does not support [[ ]] or <(...)

iOne=$1
iiOne=$2
toMatch=$3
xtrail2=$4
begin=$5
columnNumber=$6
pingLine=$7
pingColu=$8
pingLMight=$9
pingColuMight=$10
# function below has two purposes    a) add avatar if ava = Feld1_1
  #                                    b) from 1_1 decide which is more mighty
  #                                       pingLine vs pingColuLine
  #                    a || b if a1 <= b1 then eval pingColu
  #   with every              else             eval pingLine

  # [ "$iOne" '==' "1" ] ::= for every new pingLine
  # [ "$iiOne" '==' "1" ] ::= for every new pingColu
function thisAlgo () {
	pingLine=$(grep ""Feld$iOne"" unique4.sh) # choose longer one pingLine OR
	pingLMight=$(echo "$pingLine" | wc -w) ##
	pingColu=$(grep ""_$iOne$"" unique4.sh) # choose longer one pingColumn
	pingColuMight=$(echo "$pingColu" | wc -w) ##
	# path
        # pingColumn
	columnCHECK=$( grep "7" <<< $(sort -t ',' -k1,4 unique6.sh | head -4))
	correcSleter=6 # $ofsleters # $(echo | expr $ofsleters - 1)
	toMatch=$(expr $pingLMight '>' $pingColuMight) #
                 if [ "$iOne" '==' "1" ] && [ "$iiOne" '==' "1" ] && [ $toMatch '=' 1 ] # means : if pingLMight > pingColuMight is true
		 then
			# echo "blob------------------------------"
		       echo "" --- Line "$iOne"" until column ""$columnNumber" "" 
		       grot=$(echo "$pingLMight" "$pingColuMight")
		       calcC=$(expr "$pingLMight" '+' "$pingColuMight")
		       echo "$calcC" "$grot" >> unique6.sh
		       echo "$grot"
		       echo " line -----------------selected line XXX "
		       echo "$pingLine"
	               echo " column ---------------" 
		       echo "$pingColu" # "$xtrail2" | tail -$columnNumber # pingLine
                       insertAt=$(grep -n "freeze" svgTail | tail -1 | cut -d : -f1)
		       prepAt=$(expr $insertAt + 1)
		       headD=$(head -n $insertAt svgTail)
		       echo "$headD" "$move1" ""\<\/g\> \<\/g\> \<\/svg\>"" >> unique7.sh
		       wert= read asd fout <<< $(echo $(./seriesTest.sh ""_1$"" unique4.sh))
                       wert2= read asd2 fout2 <<< $(echo $(./seriesTest.sh "Feld1" unique4.sh))
		       echo "----------------------------- SERIES N ? "
		       quer=$(echo "$asd" "$fout")
		       quer2=$(echo "$asd2" "$fout2") 
		       echo "line: $quer2"
		       echo "column: $quer"
                 elif [ "$iOne" '==' "1" ] && [ "$iiOne" '==' "1" ] && [ $toMatch '=' 0 ] # : if pingLMight <= pingColuMight not true
		 then
		       grot=$(echo "$pingLMight" "$pingColuMight")
		       calcC=$(expr "$pingLMight" '+' "$pingColuMight")
		       echo "$calcC" "$grot" >> unique6.sh
		       echo "$grot"
		       echo " line -----------------selected column YYY "
		       echo "$pingLine"
		       echo " column ---------------"
		       echo "$pingColu"
		       wert= read asd fout <<< $(echo $(./seriesTest.sh ""_1$"" unique4.sh))
		       echo "----------------------------- SERIES N ? "
		       quer=$(echo "$asd" "$fout")
		       wert2= read asd2 fout2 <<< $(echo $(./seriesTest.sh "Feld1" unique4.sh))
		       quer2=$(echo "$asd2" "$fout2")
                       echo "line: $quer2"
		       echo "column: $quer" 
	        
	       elif [ "$iiOne" '==' "1" ] && [ `expr $iOne % 2` '=' 1 ] && [ $toMatch '=' 1 ] # : if iOne even number and match true 
		 then
		       grot=$(echo "$pingLMight" "$pingColuMight")
		       calcC=$(expr "$pingLMight" '+' "$pingColuMight")
		       echo "$calcC" "$grot" >> unique6.sh
		        echo "$grot"
		       echo " line -----------------selected line XXX "
	               echo "$pingLine"
		       echo " column ---------------"
		       echo "$pingColu"
		       wert= read asd fout <<< $(echo $(./seriesTest.sh ""_$iOne$"" unique4.sh))
		       echo "----------------------------- SERIES N ? "
		       quer=$(echo "$asd" "$fout")
		       wert2= read asd2 fout2 <<< $(echo $(./seriesTest.sh "Feld$iOne" unique4.sh))
		       quer2=$(echo "$asd2" "$fout2")
		       echo "line: $quer2"
		       echo "column: $quer"
	          elif [ "$iiOne" '==' "1" ] && [ `expr $iOne % 2` '=' 1 ] && [ $toMatch '=' 0 ] # : if line number even and match not true
		  then
		       grot=$(echo "$pingLMight" "$pingColuMight")
                       echo "$grot"
		       calcC=$(expr "$pingLMight" '+' "$pingColuMight")
		       echo "$calcC" "$grot" >> unique6.sh
		       echo " line -----------------selected column YYY "
		       echo "$pingLine"
		       echo " column ---------------"
		       echo "$pingColu"
		       wert= read asd fout <<< $(echo $(./seriesTest.sh ""_$iOne$"" unique4.sh))
		       echo "----------------------------- SERIES N ? "
		       quer=$(echo "$asd" "$fout")
		       wert2= read asd2 fout2 <<< $(echo $(./seriesTest.sh "Feld$iOne" unique4.sh))
		       quer2=$(echo "$asd2" "$fout2")
		       echo "line: $quer2"
		       echo "column: $quer"
	         elif [ "$iiOne" '==' "1" ] && [ `expr $iOne % 2` '=' 0 ] && [ $toMatch '=' 1 ] # : if iOne odd number and match true
		 then
		      grot=$(echo "$pingLMight" "$pingColuMight")
                      echo "$grot"
		      calcC=$(expr "$pingLMight" '+' "$pingColuMight")
		      echo "$calcC" "$grot" >> unique6.sh
		      echo " line -----------------selected line XXX "
	              echo "$pingLine"
		      echo " column ---------------"
		      echo "$pingColu"
		      wert= read asd fout <<< $(echo $(./seriesTest.sh ""_$iOne$"" unique4.sh))
		      echo "----------------------------- SERIES N ? "
	              quer=$(echo "$asd" "$fout")
		      wert2= read asd2 fout2 <<< $(echo $(./seriesTest.sh "Feld$iOne" unique4.sh))
		      quer2=$(echo "$asd2" "$fout2")
		      echo "line: $quer2"
		      echo "column: $quer"
	         elif [ "$iiOne" '==' "1" ] && [ `expr $iOne % 2` '=' 0 ] && [ $toMatch '=' 0 ] # : if iOne odd number and match not true
	         then
		      grot=$(echo "$pingLMight" "$pingColuMight")
		      echo "$grot"
		      calcC=$(expr "$pingLMight" '+' "$pingColuMight")
		      echo "$calcC" "$grot" >> unique6.sh
		      echo " line -----------------selected column YYY "
		      echo "$pingLine"
                      echo " column ---------------"
		      echo "$pingColu"
		      wert= read asd fout <<< $(echo $(./seriesTest.sh ""_$iOne$"" unique4.sh))
		      echo "----------------------------- SERIES N ? "
		      quer=$(echo "$asd" "$fout")
		      wert2= read asd2 fout2 <<< $(echo $(./seriesTest.sh "Feld$iOne" unique4.sh))
		      quer2=$(echo "$asd2" "$fout2")
	              echo "line: $quer2"
		      echo "column: $quer"
		 fi
       }
thisAlgo
