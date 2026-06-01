#!/bin/bash

# Disable ShellCheck SC1090
# shellcheck source=/dev/null

# BRCD-Loader v6

### NOTE: As of BRCD-Loader v5, PS1ConfigTool is now a seperate program to be called by BRCD-Loader via AdvPreLoader.sh.

## --- TODO For v6 --- ##
# - Enable Cecho [ TESTABLE ]
# - Setup Colorized Status Messages via ColorStatus. [ Needs Development ]
# - Use Correct PreLoader
# - Use EchoCmd.conf to control output

####################################################################################################
# Define Variables #										   #
####################################################################################################



####################################################################################################
# Define Functions #                                                                               #
####################################################################################################

function Enter_BRCD() {
# Switch to BRCD folder
	# echo "Entering BRCD Folder..." 
	cd /etc/bashrc.d || exit > /dev/null # Added Suppressed Output.
	pwd
}

function ExitBRCD() {
# Revert to root folder once completed.
	#echo "Reverting Out of BRCD Folder..."
	cd - || return > /dev/null # Added Suppressed Output.
	pwd
}


# Launch PreLoader
# sh AdvPreLoader.sh

function SourceBRCDFuncLib() {
	# Since PreLoader didn't work here, source manually #
	BRCD_FuncFile="/etc/bashrc.d/functions/BRCD_Loader.bfunc" 
	## echo "Running Sanity Check: Functions Library"
	## echo "Functions Library Path: $BRCD_FuncFile"

	if [ -f $BRCD_FuncFile ]; then
		## echo "Sourcing Functions Library..."
		source $BRCD_FuncFile
	else
		echo "ERROR! Functions Library $BRCD_FuncFile Not Found.  Exiting..."
		return # Using in lieu of 'break' per ShellCheck.
	fi
}


#######################################################################################
# Main Program #								      #
#######################################################################################

# Run SourceBRCDFuncLib
SourceBRCDFuncLib

## TODO: Ensure BLING is loaded.

# LoadCecho causes an error when running.
# LoadCecho # Should be updated to correct BLING function
# EnableExportHack
DefineFileArray
LoadFileArray
# PerformPromptChange
# DisableExportHack


