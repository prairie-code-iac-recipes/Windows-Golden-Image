#!/bin/bash

# -----------------------------------------------------------------------------
# Setup Environment
# -----------------------------------------------------------------------------
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ -f "$DIR/env.sh" ]; then
  . $DIR/env.sh
fi

# -----------------------------------------------------------------------------
# Populate Environment-Specific Values in Installation Answers File
# -----------------------------------------------------------------------------
sed "s/ADMINISTRATOR_PASSWORD_PLACEHOLDER/$ADMINISTRATOR_PASSWORD_PLACEHOLDER/g" $DIR/../files/boot/autounattend_template.xml > $DIR/../files/boot/autounattend.xml

if [[ $(uname -s) == 'Linux' ]]; then
  sed -i "s/COMPUTER_NAME_PLACEHOLDER/$COMPUTER_NAME_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i "s/TIMEZONE_PLACEHOLDER/$TIMEZONE_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i "s/PACKER_USERNAME_PLACEHOLDER/$PACKER_USERNAME_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i "s/PACKER_PASSWORD_PLACEHOLDER/$PACKER_PASSWORD_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i "s/PACKER_DISPLAYNAME_PLACEHOLDER/$PACKER_DISPLAYNAME_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i "s/OS_IMAGE_SELECTION_PLACEHOLDER/$OS_IMAGE_SELECTION_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i "s/OWNER_ORGANIZATION_PLACEHOLDER/$OWNER_ORGANIZATION_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i "s/OWNER_FULLNAME_PLACEHOLDER/$OWNER_FULLNAME_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
else
  # Mac
  sed -i '' "s/COMPUTER_NAME_PLACEHOLDER/$COMPUTER_NAME_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i '' "s/TIMEZONE_PLACEHOLDER/$TIMEZONE_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i '' "s/PACKER_USERNAME_PLACEHOLDER/$PACKER_USERNAME_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i '' "s/PACKER_PASSWORD_PLACEHOLDER/$PACKER_PASSWORD_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i '' "s/PACKER_DISPLAYNAME_PLACEHOLDER/$PACKER_DISPLAYNAME_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i '' "s/OS_IMAGE_SELECTION_PLACEHOLDER/$OS_IMAGE_SELECTION_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i '' "s/OWNER_ORGANIZATION_PLACEHOLDER/$OWNER_ORGANIZATION_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
  sed -i '' "s/OWNER_FULLNAME_PLACEHOLDER/$OWNER_FULLNAME_PLACEHOLDER/g" $DIR/../files/boot/autounattend.xml
fi

packer build  -on-error=ask $DIR/../packer.json

# -----------------------------------------------------------------------------
# Clean-up Environment-Specific Files
# -----------------------------------------------------------------------------
rm $DIR/../files/boot/autounattend.xml
