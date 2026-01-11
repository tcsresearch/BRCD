#!/bin/bash

# BRCD-Loader v5

### NOTE: As of BRCD-Loader v5, PS1ConfigTool is now a seperate program to be called by BRCD-Loader via AdvPreLoader.sh.

## --- TODO For v5 --- ##
# - Enable Cecho [ TESTABLE ]
# - Setup Colorized Status Messages via ColorStatus. [ Needs Development ]


# Define what EchoCmd command does.
EchoCmd="echo" # This can be changed to Cecho inside the script if needed.

# Configure whether to run PS1ConfigTool From Here.
RunPS1ConfigTool="0"


####################################################################################################
# Define Folder Paths / File Names #                                                               #
####################################################################################################

# ----- Folder Paths ----- #
BRCDPath="/etc/bashrc.d"
CechoPath="/etc/BLING/functions"

# ----- File Names ----- #
Cecho_FileName="Cecho.bfunc"

####################################################################################################
# Define Functions #                                                                               #
####################################################################################################

# ----- Load Cecho ----- #

function LoadCecho() {
# Load Cecho w/ Sanity Check
## TODO: Switch to new function in BLING with Cecho Sanity Checker and Cecho_Alias.
	if [ ! -f "$CechoPath/$Cecho_FileName" ]; then
	  echo "ERROR: $CechoPath/$Cecho_FileName Not Found!"
	  break
  	else
	  source $CechoPath/$Cecho_FileName
	  cecho blue "Cecho Enabled."
	  alias echo="cecho" # Make 'echo' use 'cecho'
	fi
}


# ----- File Array ----- #

function DefineFileArray() {
# Define an array of files to check
## TODO: Populate array based on a config file: PS1ConfigTool.conf.
	Files_to_check=(
		"FilePath/01_bash-aliases.brcd"
    		# "$BRCDPath/05_New-Custom-bash-prompt4.brcd"
    		"$BRCDPath/10_cecho.brcd"
    		# $BRCDPath/PS1ConfigTool/functions/PS1ConfigTool.bfunc"
    		"$BRCDPath/20_BLING_Loader.brcd"
    		"$BRCDPath/80_powerline.brcd"
    		"$BRCDPath/90_fastfetch.brcd"
    		"$BRCDPath/97_tmux.brcd"
	) # Close Array.
}


function LoadFileArray() {
# Loop through each file in the array
for file in "${files_to_check[@]}"; do
    # Check if the file exists and is a regular file
    if [ -f "$file" ]; then
       cecho "Sourcing File: $file"
       # Optional: Source the file if it's a configuration or script
       source "$file"
    else
       cecho "ERROR: File does NOT exist: $file"
    fi
done
}


# ----- Export Hack ----- #

function EnableExportHack() {
##### Set Export Hack #####
	set -a  # Enable automatic exporting of all subsequent variable assignments
}

function DisableExportHack() {
##### Unset Export Hack #####
	set +a  # Disble automatic exporting of all subsequent variable assignments
}




# ----- Manual Source ----- #

function ManualSource() {
	source ./01_bash-aliases.brcd

	# source ./05_New-Custom-bash-prompt4.brcd

	source ./10_cecho.brcd

	# PS1ConfigTool Not Finished Yet - Workaround
#	source ./PS1ConfigTool/functions/PS1ConfigTool.bfunc
#	PS1Select_OldDefault

	source ./20_BLING_Loader.brcd

	# source ./80_powerline.brcd.sh

	source ./90_fastfetch.brcd

	source ./97_tmux.brcd
}


# ----- Perform Prompt Change ----- #

function PerformPromptChange() {
# Change BASH Prompt via PS1ConfigTool
# TODO: Enable Profile Selection Via CASE Statement.
	echo "Changing BASH Prompt..."
	PS1Select_OldDefault
}



# Revert Cecho Alias
alias echo="echo"

####################################################################################################
# Main Program #                                                                                   #
####################################################################################################

LoadCecho
EnableExportHack
DefineFileArray
LoadFileArray
# PerformPromptChange
DisableExportHack


## Loader Fix ##
cd /etc/bashrc.d
sh AdvPreLoader.sh
cd -


