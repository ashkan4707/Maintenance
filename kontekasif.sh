#!/bin/bash

# Create config file if it doesn't exist
if [ ! -f kontekasifconfig ]; then
  touch kontekasifconfig
  read -p "Enter time to wait between requests (in seconds): " time
  read -p "Enter domain1: " domain1
  read -p "Enter domain2: " domain2
  read -p "Enter domain3: " domain3
  read -p "Enter Cloudflare zone identifier: " zone_identifier
  read -p "Enter Cloudflare CNAME identifier: " cname_identifier
  read -p "Enter Cloudflare email: " email
  read -p "Enter Cloudflare API Secret ID: " api_secret_id
  echo "time=$time" > kontekasifconfig
  echo "domain1=$domain1" >> kontekasifconfig
  echo "domain2=$domain2" >> kontekasifconfig
  echo "domain3=$domain3" >> kontekasifconfig
  echo "zone_identifier=$zone_identifier" >> kontekasifconfig
  echo "cname_identifier=$cname_identifier" >> kontekasifconfig
  echo "email=$email" >> kontekasifconfig
  echo "api_secret_id=$api_secret_id" >> kontekasifconfig
fi

# Read config file
source kontekasifconfig

# Create log file if it doesn't exist
if [ ! -f kontekasiflogs ]; then
  touch kontekasiflogs
fi

# Add script to startup
(crontab -l 2>/dev/null; echo "@reboot /path/to/script.sh") | crontab -

# Infinite loop
while true; do
  # Wait for specified time
  sleep $time
  
  # Get system time
  system_time=$(date +"%Y-%m-%d %H:%M:%S")
  
  # Create and execute curl for domain1
  curl_command=$(echo "curl --request PUT \
    --url https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$cname_identifier \
    --header 'Content-Type: application/json' \
    --header 'X-Auth-Email: $email' \
    --header 'X-Auth-Key: $api_secret_id' \
    --data '{\"content\": \"$domain1.\", \"name\": \"@\", \"proxied\": false, \"type\": \"CNAME\", \"comment\": \"Last change $system_time\", \"ttl\": 1}'")
  curl_response=$(eval $curl_command)
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Domain1 response: $curl_response" >> kontekasiflogs
  
  # Wait for specified time
  sleep $time

  system_time=$(date +"%Y-%m-%d %H:%M:%S")
  
  # Create and execute curl for domain2
  curl_command=$(echo "curl --request PUT \
    --url https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$cname_identifier \
    --header 'Content-Type: application/json' \
    --header 'X-Auth-Email: $email' \
    --header 'X-Auth-Key: $api_secret_id' \
    --data '{\"content\": \"$domain2.\", \"name\": \"@\", \"proxied\": false, \"type\": \"CNAME\", \"comment\": \"Last change $system_time\", \"ttl\": 1}'")
  curl_response=$(eval $curl_command)
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Domain2 response: $curl_response" >> kontekasiflogs
  
  # Wait for specified time
  sleep $time

  system_time=$(date +"%Y-%m-%d %H:%M:%S")
  
  # Create and execute curl for domain3
  curl_command=$(echo "curl --request PUT \
    --url https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$cname_identifier \
    --header 'Content-Type: application/json' \
    --header 'X-Auth-Email: $email' \
    --header 'X-Auth-Key: $api_secret_id' \
    --data '{\"content\": \"$domain3.\", \"name\": \"@\", \"proxied\": false, \"type\": \"CNAME\", \"comment\": \"Last change $system_time\", \"ttl\": 1}'")
  curl_response=$(eval $curl_command)
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Domain3 response: $curl_response" >> kontekasiflogs
  
  # Wait for specified time
  sleep $time
done#!/bin/bash

# Create config file if it doesn't exist
if [ ! -f kontekasifconfig ]; then
  touch kontekasifconfig
  read -p "Enter time to wait between requests (in seconds): " time
  read -p "Enter domain1: " domain1
  read -p "Enter domain2: " domain2
  read -p "Enter domain3: " domain3
  read -p "Enter Cloudflare zone identifier: " zone_identifier
  read -p "Enter Cloudflare CNAME identifier: " cname_identifier
  read -p "Enter Cloudflare email: " email
  read -p "Enter Cloudflare API Secret ID: " api_secret_id
  echo "time=$time" > kontekasifconfig
  echo "domain1=$domain1" >> kontekasifconfig
  echo "domain2=$domain2" >> kontekasifconfig
  echo "domain3=$domain3" >> kontekasifconfig
  echo "zone_identifier=$zone_identifier" >> kontekasifconfig
  echo "cname_identifier=$cname_identifier" >> kontekasifconfig
  echo "email=$email" >> kontekasifconfig
  echo "api_secret_id=$api_secret_id" >> kontekasifconfig
fi

# Read config file
source kontekasifconfig

# Create log file if it doesn't exist
if [ ! -f kontekasiflogs ]; then
  touch kontekasiflogs
fi

# Add script to startup
(crontab -l 2>/dev/null; echo "@reboot /path/to/script.sh") | crontab -

# Infinite loop
while true; do
  # Wait for specified time
  sleep $time
  
  # Get system time
  system_time=$(date +"%Y-%m-%d %H:%M:%S")
  
  # Create and execute curl for domain1
  curl_command=$(echo "curl --request PUT \
    --url https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$cname_identifier \
    --header 'Content-Type: application/json' \
    --header 'X-Auth-Email: $email' \
    --header 'X-Auth-Key: $api_secret_id' \
    --data '{\"content\": \"$domain1.\", \"name\": \"@\", \"proxied\": false, \"type\": \"CNAME\", \"comment\": \"Last change $system_time\", \"ttl\": 1}'")
  curl_response=$(eval $curl_command)
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Domain1 response: $curl_response" >> kontekasiflogs
  
  # Wait for specified time
  sleep $time

  system_time=$(date +"%Y-%m-%d %H:%M:%S")
  
  # Create and execute curl for domain2
  curl_command=$(echo "curl --request PUT \
    --url https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$cname_identifier \
    --header 'Content-Type: application/json' \
    --header 'X-Auth-Email: $email' \
    --header 'X-Auth-Key: $api_secret_id' \
    --data '{\"content\": \"$domain2.\", \"name\": \"@\", \"proxied\": false, \"type\": \"CNAME\", \"comment\": \"Last change $system_time\", \"ttl\": 1}'")
  curl_response=$(eval $curl_command)
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Domain2 response: $curl_response" >> kontekasiflogs
  
  # Wait for specified time
  sleep $time

  system_time=$(date +"%Y-%m-%d %H:%M:%S")
  
  # Create and execute curl for domain3
  curl_command=$(echo "curl --request PUT \
    --url https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$cname_identifier \
    --header 'Content-Type: application/json' \
    --header 'X-Auth-Email: $email' \
    --header 'X-Auth-Key: $api_secret_id' \
    --data '{\"content\": \"$domain3.\", \"name\": \"@\", \"proxied\": false, \"type\": \"CNAME\", \"comment\": \"Last change $system_time\", \"ttl\": 1}'")
  curl_response=$(eval $curl_command)
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Domain3 response: $curl_response" >> kontekasiflogs
  
  # Wait for specified time
  sleep $time
done
