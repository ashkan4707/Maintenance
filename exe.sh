#!/bin/bash
echo "entere zone id:"
read ZONE

FILE=records.json
if test -f "$FILE"; then
    rm records.json
	echo "record json removed"
else echo "file not exist"
fi

apt  install jq -y
apt  install nmap -y

curl -o records.json -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE/dns_records?type=A&page=1&per_page=100&order=type&match=all" \
     -H "X-Auth-Email: hesam.imam@gmail.com" \
     -H "X-Auth-Key: e37d986b5aeb10c07af376fd83aa90cf165c8" \
     -H "Content-Type: application/json"


N=$(jq -r '.result | length' records.json)
for i in {0..65}
do

	IP=$(jq -r .result[$i].content records.json) && RE=$(telnet $IP 22)&&echo "$IP Is in progress"

		if [[ " $RE " =~ "Unable to connect" ]]; 
		then
 			echo "$IP removed" && RECORDID=$(jq -r .result[$i].id records.json)&&echo "$RECORDID request sent #1"
		fi
		
		if [[ " $RE " =~ "could not resolve" ]]; 
		then
 			echo "$IP removed" && RECORDID=$(jq -r .result[$i].id records.json)&&echo "$RECORDID request sent #2"
		fi
		exit 1
done
