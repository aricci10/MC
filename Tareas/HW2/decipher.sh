#!/bin/bash

cat $1 >> bigenigma2.txt

for (( n=1; n<=10; ++n ))
do
./flip.sh v z bigenigma2.txt > bigenigma3.txt
./flip.sh h y bigenigma3.txt > bigenigma2.txt
./flip.sh p x bigenigma2.txt > bigenigma3.txt
./flip.sh u w bigenigma3.txt > bigenigma2.txt
./flip.sh z v bigenigma2.txt > bigenigma3.txt
./flip.sh s u bigenigma3.txt > bigenigma2.txt
./flip.sh f t bigenigma2.txt > bigenigma3.txt
./flip.sh g s bigenigma3.txt > bigenigma2.txt
./flip.sh x r bigenigma2.txt > bigenigma3.txt
./flip.sh e q bigenigma3.txt > bigenigma2.txt
./flip.sh d p bigenigma2.txt > bigenigma3.txt
./flip.sh r o bigenigma3.txt > bigenigma2.txt
./flip.sh m n bigenigma2.txt > bigenigma3.txt
./flip.sh b m bigenigma3.txt > bigenigma2.txt
./flip.sh j l bigenigma2.txt > bigenigma3.txt
./flip.sh a k bigenigma3.txt > bigenigma2.txt
./flip.sh c j bigenigma2.txt > bigenigma3.txt
./flip.sh y i bigenigma3.txt > bigenigma2.txt
./flip.sh k h bigenigma2.txt > bigenigma3.txt
./flip.sh t g bigenigma3.txt > bigenigma2.txt
./flip.sh q f bigenigma2.txt > bigenigma3.txt
./flip.sh e o bigenigma3.txt > bigenigma2.txt
./flip.sh l d bigenigma2.txt > bigenigma3.txt
./flip.sh w c bigenigma3.txt > bigenigma2.txt
./flip.sh n b bigenigma2.txt > bigenigma3.txt
./flip.sh i a bigenigma3.txt > bigenigma2.txt
done

cat bigenigma2.txt

rm bigenigma2.txt
rm bigenigma3.txt