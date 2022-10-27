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
function thisAlgo () { 
                 if [ "$iOne" '==' "1" ] && [ "$iiOne" '==' "1" ] && [ $toMatch '=' 1 ] # means : if pingLMight > pingColuMight is true
		 then
			# echo "blob------------------------------"
		       nowX=$(echo "$xtrail2" | tail -$columnNumber | awk '{print($3)}')
		       nowY=$(echo "$xtrail2" | tail -$columnNumber | awk '{print($5)}')
		     #  echo "$nowX" "$nowY"
		       foM1=$(expr 4 '*' 123)
		       foM2=$(expr -492 '+' $foM1)
		       move1=$(echo ""\<animateMotion path=\"M  0 -492 L 0 "$foM2"\" begin=\"14.1s\" dur=\"0.3s\" fill=\"freeze\"\/\>"")
		       echo "" --- Line "$iOne"" until column ""$columnNumber" "" 
		       echo "$move1" 
		       grot=$(echo "$pingLMight" "$pingColuMight")
		       calcC=$(expr "$pingLMight" '+' "$pingColuMight")
		       echo "$calcC" "$grot" >> unique6.sh
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
		       quer=$(echo "$asd" "$fout" | head -2 | tail -1)
		       quer2=$(echo "$asd2" "$fout2") 
		       echo "line: $quer2"
		       echo "column: $quer"
                 elif [ "$iOne" '==' "1" ] && [ "$iiOne" '==' "1" ] && [ $toMatch '=' 0 ] # : if pingLMight <= pingColuMight not true
		 then
		       grot=$(echo "$pingLMight" "$pingColuMight")
		       calcC=$(expr "$pingLMight" '+' "$pingColuMight")
		       echo "$calcC" "$grot" >> unique6.sh
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
