#!/bin/bash
####################################################
###Unmigrating #Jamf connect from a Local Account###
####written by Meir Elimelech meir@wediggit.co.il###
####################################################

#variables
homefolder=$(dscl . read $HOME NFSHomeDirectory | awk '{print $2}')
alias=$(dscl . read $HOME RecordName | awk '{ print substr($0, index($0,$2)) }')

#Unmigrating jamf connect from local user
dscl . delete $homefolder RecordName $alias
dscl . delete $homefolder dsAttrTypeStandard:NetworkUser
dscl . delete $homefolder dsAttrTypeStandard:OIDCProvider
dscl . delete $homefolder dsAttrTypeStandard:OktaUser
dscl . delete $homefolder dsAttrTypeStandard:AzureUser

echo "Jamf connect unmigrated successfully"

exit