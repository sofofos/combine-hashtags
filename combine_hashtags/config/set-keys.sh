#!usr/bin/env
# Sets your API access token as an environment variable
# run the script: source set-keys.sh

echo "Type your Instagram API access token:"
read access_token
export ACCESS_TOKEN=${access_token}	

echo "All done"
