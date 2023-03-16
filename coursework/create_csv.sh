#!/bin/bash
#step 1:set 2 variables to extract data from KML, and save as CSV
kml_input = # path
csv_output = #path

echo "Timestamp,Latitude,Longitude,MinSealevelPressure,MaxIntensity" >$2

echo "Converting report.kml -> storm_info.csv..."

#step2:collect the 5 required data,cut off useless parts than add unit at the end of each line

count = $(grep -E -C "<lat>" $1)
grep "<lat>" $1 |cut -d ">" -f 2 | cut -d "<" -f 1 | sed "s/$/& N/g"> lat.txt
grep "<lon>" $1 |cut -d ">" -f 2 | cut -d "<" -f 1 | sed "s/$/& W/g"> lon.txt
grep "<dtg>" $1 |cut -d ">" -f 2 | cut -d "<" -f 1 | > ts.txt
grep "<intensity>" $1 | cut -d "<" -f 1 |sed "s/$/& knots/g" > inten.txt
grep "<minSea.*>" $1 | cut -d "<" -f 1 |sed "s/$/& mb/g" > press.txt

#step3: Paste data in order , output final data as a CSV file

Paste -d ',' ts.txt lat.txt lon.txt press.txt intern.txt >>$2
 echo "Done!"




