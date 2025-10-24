## The following line is a default parameter; disabled for replacement with a custom implementation.
### export PS1='[\h]$ '

## TODO ##
# Use -z and enable $1 parameter or CASE
#  Use the export command AND source trhis file.
#        		  Use the CASE statement.
#
#
#

### Defaine Version ###
PS1ProgVersion="0.1.2"

## TODO: Enable Cecho.


### TODO: Move these functions into PS1ConfigTool.bfunc (file exists - append!)

############################################################################################################
# Define Functions #
####################

function DisplayBanner() {
	echo "BASH Prompt Configuration Utility - Version $PS1ProgVersion"
	echo "(c) 2025 TCS Research.  All Rights Reserved."
	echo " "
#	echo " WARNING: Prompts do NOT change with this tool (yet!)."
#	echo " Fix and Retest."
#	echo "Call the function to activte for now."
#	echo " "
}


function zTest() {
        if [ -z "$1" ]
        then
         echo "ERROR: -z Failed!"
        fi
}

function Usage() {
        echo "Please Select a BASH prompt preset to use."
        echo "You can select by running $0 [PRESET], where [PRESET] is one of the following: "
        echo "Default | Basic | MoreInfo | OldDefault | NewDefault "
	echo " "
}


function Usage_TempFix() {
		echo "Please select a BASH prompt to use with one of the following: "
		echo "	PS1Select_Default"
		echo "	PS1Select_Basic"
		echo "	PS1Select_MoreInfo"
		echo "	PS1Select_OldDefault"
		echo "	PS1Select_NewDefault"
		echo " "
}


### WIP - DEFINE MAIN PS1 ###

### FIXME: Syntax Error: Fix and enable line below.
##	var_main=" export PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\] " 


###############################################################################################################
# Main Program #
################

DisplayBanner

##### PS1 Profiles #####

## TODO: Make profile creation easier by:
## 		1) Use Cecho colors to customize BASH prompts.
## 		2) Create variables for various sections, e.g.: $grep_ml_total='/bin/grep -m -l total'
##		3) Store each profile inside its own function.
##		4) Store each profile inside its own profile file? 
##			How to use CASE command if we do this?

## INFO: Possible fix involves removing export, so 'export PS1' is now just PS1.

### Source PS1ConfigTool.bfunc ###
## TODO: Exit if file not found.


function LoadPS1Functions() {
	PS1ConfigTool_FunctionsFile="./PS1ConfigTool.bfunc"
	if [ -f $PS1ConfigTool_FunctionsFile ]; then
		echo -n "Sourcing Functions..."
 		source $PS1ConfigTool_FunctionsFile
###		source ./PS1ConfigTool.bfunc
		echo "Functions Loaded."
		echo " "
	fi
}


## Call our LoadPS1Functions function

LoadPS1Functions

case $1 in 


	Default)	PS1Select_Default 
			echo "BASH Prompt Selected: Default " 
			;;


	Basic)		PS1Select_Basic 
			echo "BASH Prompt Selected: Basic " 
			;;
	
	MoreInfo)	PS1Select_MoreInfo 
			echo "BASH Profile Selected: MoreInfo " 
			;;

	OldDefault) 	PS1Select_OldDefault 
			echo "BASH Profile Selected: OldDefault " 
			;;

	NewDefault)	PS1Select_NewDefault 
			echo "BASH Profile Selected: NewDefault " 
			;;


# DISABLED
# 	*) echo "ERROR: Uknknown Option." >&2 ;;

## DISABLED Until Fix is Found: 
# 	*) Usage >&2 ;;

	*) Usage_TempFix >&2 ;;

esac



