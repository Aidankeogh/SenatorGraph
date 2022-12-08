#!/bin/sh

states=("AL" "AK" "AZ" "AR" "CA" "CO" "CT" "DE" "FL" "GA" "HI" "ID" "IL" "IN" "IA" "KS" "KY" "LA" "ME" "MD" "MA" "MI" "MN" "MS" "MO" "MT" "NE" "NV" "NH" "NJ" "NM" "NY" "NC" "ND" "OH" "OK" "OR" "PA" "RI" "SC" "SD" "TN" "TX" "UT" "VT" "VA" "WA" "WV" "WI" "WY")

echo ${states[@]}

for state in ${states[@]}
do
    echo $state 'S1'
    url="https://www.opensecrets.org/races/contributors.csv?cycle=2022&id=${state}S1&spec=N"
    curl $url -o "${state}S1.csv"

    echo $state 'S2'
    url="https://www.opensecrets.org/races/contributors.csv?cycle=2022&id=${state}S2&spec=N"
    curl $url -o "${state}S2.csv"
done
