## The following line is a default parameter; disabled for replacement with a custom implementation.
### export PS1='[\h]$ '

## TODO ##
# Use -z and enable $1 parameter or CASE
#  Use the export command AND source trhis file.
#        		  Use the CASE statement.
#
#
#

## Define Version ###
PS1ProgVersion="0.1.3"

## TODO: Enable Cecho.


### WIP - DEFINE MAIN PS1 ###

### FIXME: Syntax Error: Fix and enable line below.
##	var_main=" export PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\] " 





###############################################################################################################
# Source Config #
#################

ConfigFile="/etc/bash.profile.d/PS1ConfigTool/config/PS1ConfigTool.conf"
# ConfigFile="$(pwd)/config/PS1ConfigTool.conf"
if [ -f $ConfigFile ]; then
   echo "Sourcing Config File: $ConfigFile"	
   source $ConfigFile
fi


###############################################################################################################
# Source Functions #
####################

LoaderFile="/etc/bash.profile.d/PS1ConfigTool/functions/SourceFolderLoader.bfunc"
# LoaderFile="$(pwd)/functions/SourceFolderLoader.bfunc"
if [ -f $LoaderFile ]; then
   echo "Sourcing Config File: $LoaderFile"     
##   source $LoaderFile
fi

# Call SourceFolderLoader
# SourceFolderLoader $FunctionsDir

# Call FunctionsFolderLoader
FunctionsFolderLoader

################################################################################################################
# Source Profiles #
####################

if [ -d $ProfileDir ]; then
   echo "Sourcing Profiles:"     
   # Call SourceFolderLoader
#  SourceFolderLoader $ProfileDir
   ProfileFolderLoader
fi

################################################################################################################




###############################################################################################################
# Main Program #
################

DisplayBanner

##### PS1 Profiles #####

## TODO: Make profile creation easier by:
## 			1) Use Cecho colors to customize BASH prompts.
## 			2) Create variables for various sections, e.g.: $grep_ml_total='/bin/grep -m -l total'
## [IN PROGRESS]	3) Store each profile inside its own function.
## [IN PROGRESS] 	4) Store each profile inside its own profile file? 

## INFO: Possible fix involves removing export, so 'export PS1' is now just PS1.

### Source PS1ConfigTool.bfunc ###
## TODO: Exit if file not found.



