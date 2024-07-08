#!/bin/bash

# Decrypt secrets.json using sops and store it in a variable
decrypted_content=$(sops --decrypt --input-type json --output-type json secrets.json)

# Read the content of secrets.decrypted.json into a variable
current_content=$(cat secrets.decrypted.json)

if [ "$decrypted_content" == "$current_content" ]; then
    if [ "$1" != "--force" ]; then
        echo "Files are identical. No need to reencrypt."
        exit 0
    fi
    echo "Files are identical but --force was passed. Secrets have been reencrypted."
    sops --encrypt --input-type json --output-type json secrets.decrypted.json > secrets.json
    exit 0
fi


echo "Files are different. Showing differences:"
diff <(echo "$decrypted_content") <(echo "$current_content")

# Reencrypt secrets.decrypted.json using the content of secrets.json
sops --encrypt --input-type json --output-type json secrets.decrypted.json > secrets.json
