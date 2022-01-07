#!usr/bin/sh
# Set your API credentials as environment variables: set-keys USER_ID ACCESS_TOKEN

echo "Type your Instagram API user ID:"
read user_id
export USER_ID=$user_id

echo "Type your Instagram API access token:"
read access_token
export ACCESS_TOKEN=$access_token

echo "All done"
