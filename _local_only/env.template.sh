#!/bin/bash

###############################################################################
# Copy this file to env.sh and populate the variables listed below.
###############################################################################
export cluster=
export cpu_cores=2
export CPUs=1
export datacenter=
export datastore=
export disk_size=50000
export host=
export os_iso_checksum=
export os_iso_path=
export RAM=4000
export vm_name=
export vmtools_iso_path=
export vcenter_server=
export vcenter_username=
export vcenter_password=
export winrm_password=
export winrm_username=

# Replacement Values for autounattend.xml file
export COMPUTER_NAME_PLACEHOLDER=$vm_name
export TIMEZONE_PLACEHOLDER=Pacific Standard Time_dstoff
export ADMINISTRATOR_PASSWORD_PLACEHOLDER=$winrm_password
export PACKER_USERNAME_PLACEHOLDER=$winrm_username
export PACKER_PASSWORD_PLACEHOLDER=$winrm_password
export PACKER_DISPLAYNAME_PLACEHOLDER="Packer User"
export OS_IMAGE_SELECTION_PLACEHOLDER=Windows Server 2016 SERVERSTANDARD
export OWNER_ORGANIZATION_PLACEHOLDER=
export OWNER_FULLNAME_PLACEHOLDER=
