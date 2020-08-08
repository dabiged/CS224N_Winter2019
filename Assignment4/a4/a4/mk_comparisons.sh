#!/bin/bash

for i in $(seq 1 10); 
do 
	linenum=$(echo "8064*$RANDOM/32768" | bc ); 
	echo -n "Original Spanish:        "
	awk -v LN=$linenum 'NR==LN{print$0}' en_es_data/test.es 
	echo -n "Reference Translation:   "
	awk -v LN=$linenum 'NR==LN{print$0}' en_es_data/test.en 
	echo -n "This Work's Translation: "
	awk -v LN=$linenum 'NR==LN{print$0}' outputs/test_outputs.txt 

	echo ""; 
done

