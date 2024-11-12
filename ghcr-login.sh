#!/bin/bash

# Go to https://github.com
# Click on your profile icon at the top right corner of the page
# Go to  "Settings"
# Navigate to "Developer settings" at the bottom of the left column
# Then, go to "Personal access tokens" -> "Tokens (classic)"
# click on "Generate new token" button
# copy the token and replace "ghp_YOUR_TOKEN" in the script
# Click "Configure SSO" and authorize (if org)

export CR_PAT=ghp_YOUR_TOKEN
echo $CR_PAT | docker login ghcr.io -u iaupkg --password-stdin
