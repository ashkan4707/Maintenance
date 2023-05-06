#!/bin/bash

# Define the log file
log_file="kontekasiflogs"

# Define the config file
config_file="kontekasifconfig"

# Check if the config file exists
if [ -f "$config_file" ]; then
  # Load the configuration data from the config file
  . "$config_file"
else
  # Read the configuration data from the user
  read -p "Enter the time interval in seconds: " time_interval
  read -p "Enter domain1: " domain1
  read -p "Enter domain2: " domain2
  read -p "Enter domain3: " domain3
  read -p "Enter zone identifier: " zone_identifier
  read -p "Enter cname identifier: " cname_identifier
  read -p "Enter email: " email
  read -p "Enter API secret ID: " api_secret_id

  # Write the configuration data to the config file
  cat << EOF > "$config_file"
time_interval=$time_interval
domain1=$domain1
domain2=$domain2
domain3=$domain3
zone_identifier=$zone_identifier
cname_identifier=$cname_identifier
email=$email
api_secret_id=$api_secret_id
EOF
fi

# Add script to startup
(crontab -l 2>/dev/null; echo "@reboot /path/to/script.sh") | crontab -

# Infinite loop
while true; do
  # Get the system time
  system_time=$(date '+%Y-%m-%d %H:%M:%S')

  # Create the curl for domain1
  curl_domain1=$(cat << EOF
curl --request PUT \
  --url https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$cname_identifier \
  --header 'Content-Type: application/json' \
  --header 'X-Auth-Email: $email' \
  --header 'X-Auth-Key: $api_secret_id' \
  --data '{
  "content": "$domain1",
  "name": "bridge",
  "proxied": false,
  "type": "CNAME",
  "comment": "Last change $system_time",
  "ttl": 1
}'
EOF
)

  # Log the curl command for domain1
  echo "[$system_time] Executing curl command for domain1: $curl_domain1" >> "$log_file"

  # Execute the curl command for domain1 and log the response
  curl_response_domain1=$(eval "$curl_domain1")
  echo "[$system_time] Response for domain1: $curl_response_domain1" >> "$log_file"

  # Wait for the time interval
  sleep "$time_interval"

# Get the system time
  system_time=$(date '+%Y-%m-%d %H:%M:%S')

  # Create the curl for domain2
  curl_domain2=$(cat << EOF
curl --request PUT \
  --url https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$cname_identifier \
  --header 'Content-Type: application/json' \
  --header 'X-Auth-Email: $email' \
  --header 'X-Auth-Key: $api_secret_id' \
  --data '{
  "content": "$domain2",
  "name": "bridge",
  "proxied": false,
  "type": "CNAME",
  "comment": "Last change $system_time",
  "ttl": 1
}'
EOF
)

  # Log the curl command for domain2
  echo "[$system_time] Executing curl command for domain2: $curl_domain2" >> "$log_file"

  # Execute the curl command for domain2 and log the response
  curl_response_domain2=$(eval "$curl_domain2")
  echo "[$system_time] Response for domain2: $curl_response_domain2" >> "$log_file"

  # Wait for the time interval
  sleep "$time_interval"

# Get the system time
  system_time=$(date '+%Y-%m-%d %H:%M:%S')

  # Create the curl for domain3
  curl_domain3=$(cat << EOF
curl --request PUT \
  --url https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$cname_identifier \
  --header 'Content-Type: application/json' \
  --header 'X-Auth-Email: $email' \
  --header 'X-Auth-Key: $api_secret_id' \
  --data '{
  "content": "$domain3",
  "name": "bridge",
  "proxied": false,
  "type": "CNAME",
  "comment": "Last change $system_time",
  "ttl": 1
}'
EOF
)

  # Log the curl command for domain3
  echo "[$system_time] Executing curl command for domain3: $curl_domain3" >> "$log_file"

  # Execute the curl command for domain3 and log the response
  curl_response_domain3=$(eval "$curl_domain3")
  echo "[$system_time] Response for domain3: $curl_response_domain3" >> "$log_file"

  # Wait for the time interval
  sleep "$time_interval"
done >> kontekasiflogs 2>&1 &
