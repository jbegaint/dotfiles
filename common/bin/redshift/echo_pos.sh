#!/bin/bash

#get ip (yeah i should check for internet connection and stuff...)
IP=$(curl -s icanhazip.com)

#get city
CITY=$(geoiplookup $IP -f GeoLiteCity.dat)

#coordinates
LAT=$(echo "$CITY" | awk -F ',' '{print $7}')
LONG=$(echo "$CITY" | awk -F ', ' '{print $8}')

echo $CITY
echo $LAT
echo $LONG
