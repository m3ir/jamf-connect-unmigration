#!/bin/bash
####################################################
###Unmigrating #Jamf connect from a Local Account###
####written by Meir Elimelech meir@wediggit.co.il###
####################################################

#get current user alias
alias=$(dscl . read $HOME RecordName | awk '{ print substr($0, index($0,$2)) }')

#Unmigrating jamf connect from local user
dscl . delete $HOME RecordName $alias
dscl . delete $HOME dsAttrTypeStandard:NetworkUser
dscl . delete $HOME dsAttrTypeStandard:OIDCProvider
dscl . delete $HOME dsAttrTypeStandard:OktaUser
dscl . delete $HOME dsAttrTypeStandard:AzureUser

echo "Jamf connect unmigrated successfully"

exit
