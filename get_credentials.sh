#!/usr/bin/env bash
​
echo "Enter MFA Code: "
read MFA_CODE
​
echo "Fetching new credentials..."
JSON=$(aws sts get-session-token --profile <MFA PROFILE> --serial-number <YOUR SERIAL NUMBER> --token-code ${MFA_CODE})
​
echo $JSON
​
ACCESS_KEY=$JSON | jq '.Credentials.AccessKeyId'
SECRET_KEY=$JSON | jq '.Credentials.SecretAccessKey'
SESSION_TOKEN=$JSON | jq '.Credentials.SessionToken'
​
echo "Configuring profile credentials..."
​
export AWS_ACCESS_KEY_ID=ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=SECRET_KEY
export AWS_SESSION_TOKEN=SESSION_TOKEN
​
echo "AWS ENVIRONMENT VARIABLES UPDATED."
# you can also print out the keys and token and add them to your credentials manually if needed.
