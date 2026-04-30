#!/usr/bin/env bash

# As of Jan 11, 2026, this is the latest and greatest version of ViewINI.sh
# TODO: Finalize and save as function for BLING

# Define Files and Folders.
CONFIG_DIR="$(pwd)/config"

CONFIG_FILE="BRCD-Loader.ini"

FUNC_DIR="$(pwd)/functions"

FUNC_FILE="lib_ini.bfunc"

# Colors for Cecho-like output
# Cannot find this file!  Falling back to the DefineColors function.
COLORS_FILE="Colors.conf"

# Define ShowINI Variables #
ShowINI_Left="${brightyellow} $key ${brightred}"
ShowINI_Center=" = "
ShowINI_Right="${brightwhite} $value ${reset}"

#######################################################################################

# Source our Color Config
function SourceColorConfig() {
	if [ -f "$CONFIG_DIR/$COLORS_FILE" ]; then
		source "$CONFIG_DIR/$COLORS_FILE"
	else
		echo "ERROR: $CONFIG_DIR/$COLORS_FILE Not Found!"
	fi
}


### This section is depricated and can be removed after testing.
function DefineColors() {
# Define Our Colors
# Define color variables
  black="$(tput setaf 0)"
  red="$(tput setaf 1)"
  green="$(tput setaf 2)"
  yellowbrown="$(tput setaf 3)"
  blue="$(tput setaf 4)"
  magenta="$(tput setaf 5)"
  cyan="$(tput setaf 6)"
  whitelightgray="$(tput setaf 7)"
  whitelightgrey="$(tput setaf 7)"
  brightblack_darkgray="$(tput setaf 8)"
  brightblack_darkgrey="$(tput setaf 8)"
  brightred="$(tput setaf 9)"
  brightgreen="$(tput setaf 10)"
  brightyellow="$(tput setaf 11)"
  brightblue="$(tput setaf 12)"
  brightmagenta="$(tput setaf 13)"
  brightcyan="$(tput setaf 14)"
  brightwhite="$(tput setaf 15)"
  reset="$(tput sgr0)" # Reset to default 
}


## Call our SourceColorConfig function 
 SourceColorConfig

## Call our DefineColors Function (DEPRICATED by Colors.conf)
# DefineColors

# Define Left Column Width
L_Column_Width="25"


# Message Function
# Define a function to print aligned messages
## FIXME: This needs work!

print_INI() {
    local keycolor="$1"
    local keyname="$2"
    local valuecolor="$3"
    local value_data="$4"
    local width="40" # Total width of the line

    # Calculate padding needed. We use printf's width specifier.
    # The format string ensures the message is left-aligned in a field
    # that accounts for the length of the status message.

    # We can use a simple trick with printf for alignment:
    # First, print the message left-aligned to a specific width.
    printf "%-35s" "$keyname"
    # Then print the status message.
    printf "%s\n" "$value_data"
}

# Source our INI Library
source "$FUNC_DIR/$FUNC_FILE"


# Show name of config file.
echo "${brightyellow}Config File: ${brightblue}$CONFIG_FILE ${reset}"
echo " "

# List sections and keys
echo "${brightyellow}Available sections: ${reset}"
echo "${brightyellow}-------------------${reset}"
echo " "

## PENDING_DELETE: If code fix below works, remove the code below.
	# ini_list_sections "$CONFIG_DIR/$CONFIG_FILE" | while read section; do
    #   echo "${brightblue} [$section] ${reset}"

	# ini_list_keys "$CONFIG_DIR/$CONFIG_FILE" "$section" | while read key; do
    #   value=$(ini_read "$CONFIG_DIR/$CONFIG_FILE" "$section" "$key")
    #   echo "  - ${brightyellow} $key ${brightred} = ${brightwhite} $value ${reset}"



ini_list_sections "$CONFIG_DIR/$CONFIG_FILE" | while read -r section; do
       echo "${brightblue} [$section] ${reset}"
		done
		
ini_list_keys "$CONFIG_DIR/$CONFIG_FILE" "$section" | while read -r key; do
       value=$(ini_read "$CONFIG_DIR/$CONFIG_FILE" "$section" "$key")
       echo "  - ${brightyellow} $key ${brightred} = ${brightwhite} $value ${reset}"
	   done


# Display Output #
# echo "$ShowINI_Left $ShowINI_Center $ShowINI_Right" | column -t -s ':' -o '='
## echo "$ShowINI_Left $ShowINI_Center $ShowINI_Right" | column -c 20 -s ':' -o '='


#####  These need development ##########
##	This one almost works.
#	printf "%-*s %s\n" $L_Column_Width   " - ${brightyellow} $key " "${brightred}     = "      "${brightwhite} $value ${reset}"

#	print_INI ${brightyellow} "$key" $(brightred) " = " ${brightwhite} "$value ${reset}"
	done
echo " "

done


