#!/usr/bin/env bash

# BRCD-Loader v6

### NOTE: As of BRCD-Loader v5, PS1ConfigTool is now a separate program to be called by BRCD-Loader via AdvPreLoader.sh.

## --- TODO For v6 --- ##
# - Enable Cecho [ TESTABLE ]
# - Setup Colorized Status Messages via ColorStatus. [ Needs Development ]
# - Use Correct PreLoader
# - Use EchoCmd.conf to control output



####################################################################################################
# Main Program #                                                                                   #
####################################################################################################

# Switch to BRCD folder
cd /etc/bashrc.d || return 1

# Launch PreLoader
sh AdvPreLoader.sh


## TODO: Ensure BLING is loaded.

LoadCecho # Should be updated to correct BLING function
EnableExportHack
DefineFileArray
LoadFileArray
# PerformPromptChange
DisableExportHack

# Revert to root folder once completed.
cd ... || return 1
