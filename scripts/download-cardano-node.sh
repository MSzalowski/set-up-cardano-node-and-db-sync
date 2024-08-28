#!/bin/bash

# Prompt the user for the version
read -p "Enter the version: " VERSION

# Prompt the user for the platform (linux or macos)
read -p "Enter the platform (linux, macos): " PLATFORM

# Validate the platform input
if [[ "$PLATFORM" != "linux" && "$PLATFORM" != "macos" ]]; then
  echo "Invalid platform. Please enter either 'linux' or 'macos'."
  exit 1
fi

# Construct the download URL
URL="https://github.com/IntersectMBO/cardano-node/releases/download/${VERSION}/cardano-node-${VERSION}-${PLATFORM}.tar.gz"

curl -L $URL >../cardano-node/cardano-node-${VERSION}-${PLATFORM}.tar.gz

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download the file. Please check the version and platform."
  exit 1
fi

# Use tar to unpack the binary
tar -xzf ../cardano-node/cardano-node-${VERSION}-${PLATFORM}.tar.gz

# Check if the extraction was successful
if [ $? -ne 0 ]; then
  echo "Failed to unpack the file."
  exit 1
fi

echo "Download and unpacking completed successfully."

# Remove the downloaded .tar.gz
rm -rf ../cardano-node/cardano-node-${VERSION}-${PLATFORM}.tar.gz

echo "Cleanup done"
