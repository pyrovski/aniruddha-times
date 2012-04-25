#!/bin/sh

for file in `/bin/ls -1 costtab_*`;
do 
	paste -d";" costtab.template $file > costtab; 
	R --no-save -f cost_turna.R; 
	app=`echo ${file} | cut -d "_" -f 2`;
	mv cost_turn.pdf cost_turn_${app}.pdf; 
done
