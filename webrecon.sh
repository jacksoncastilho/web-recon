#!/bin/bash

# Define an array of common User-Agent strings to use for making HTTP requests
user_agents=(
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36"
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15"
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0"
    "Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36"
    "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Mobile/15E148 Safari/604.1"
    "Mozilla/5.0 (Linux; Android 9; Mi A1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36"
    "Mozilla/5.0 (iPad; CPU OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Mobile/15E148 Safari/604.1"
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Edge/91.0.864.59 Safari/537.36"
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36"
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36"
    "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Mobile/15E148 Safari/604.1"
    "Mozilla/5.0 (Linux; U; Android 11; en-US; SM-A515F Build/RP1A.200720.012) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.105 Mobile Safari/537.36"
)

# Function to perform an HTTP request to a given URL using a random User-Agent
_curl() {
    local url=$1  # URL to be checked
    local user_agent=${user_agents[$(( RANDOM % ${#user_agents[@]} ))]}  # Select a random User-Agent string

    # Make a curl request to the URL with the selected User-Agent and store the HTTP status code
    local status_code=$(curl -k -s -o /dev/null -w "%{http_code}" -H "User-Agent: $user_agent" $url)

    # If the status code is 200 (OK), print the URL
    if [ "$status_code" == "200" ]; then
        echo $url
    fi
}

# Check if the first argument (target URL) is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 http://site.com wordlist.txt [optional_extension]"
    exit 1
fi

# Check if the second argument (wordlist file) exists and is a valid file
if [[ ! -f $2 ]]; then 
    echo "Please provide a valid wordlist file"
    exit 1 
fi

# Read each word from the provided wordlist file
while read -r word; do
    # Call _curl function with the URL constructed from the base URL and word
    _curl "$1/$word/"
    
    # If a third argument (file extension) is provided, construct URLs with the extension and call _curl
    if [[ -n "$3" ]]; then
        _curl "$1/$word.$3"
    fi
done < "$2"  # Read from the wordlist file provided in the second argument

# Exit script successfully
exit 0
