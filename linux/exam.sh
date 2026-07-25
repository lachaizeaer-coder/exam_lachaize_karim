#!/bin/bash

#########this script collects data from graphic card sales##########
#define a function to copy data to sales.txt
function to_data () {
a=$1
echo "$a" >> sales.txt
}

#save date to file
to_data "$(date)"

#set a list of graphic cards to consider
graphic_cards=(rtx3060 rtx3070 rtx3080 rtx3090 rx6700)

#loop through the graphic cards list
for x in "${graphic_cards[@]}"
do
value=$(curl "http://0.0.0.0:5000/$x")
to_data $x:"$value"
done
