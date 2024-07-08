#!/bin/bash
sops --decrypt --input-type json --output-type json secrets.json > secrets.decrypted.json
