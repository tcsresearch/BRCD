#!/bin/bash

# BRCD-Loader v4

FilePath="/etc/bashrc.d"
# Define an array of files to check
files_to_check=(
    "$FilePath/01_bash-aliases.brcd"
    # "$FilePath/05_New-Custom-bash-prompt4.brcd"
    "$FilePath/10_cecho.brcd"
    "$FilePath/PS1ConfigTool/PS1ConfigTool.bfunc"
    "$FilePath/20_BLING_Loader.brcd"
    # "$FilePath/80_powerline.brcd"
    "$FilePath/90_fastfetch.brcd"
    "$FilePath/97_tmux.brcd"
)

##### Export Hack #####
set -a  # Enable automatic exporting of all subsequent variable assignments



# Loop through each file in the array
for file in "${files_to_check[@]}"; do
    # Check if the file exists and is a regular file
    if [ -f "$file" ]; then
        echo "Sourcing File: $file"
        # Optional: Source the file if it's a configuration or script
        source "$file" 
    else
        echo "ERROR: File does NOT exist: $file"
    fi
done

# Change BASH Prompt via PS1ConfigTool
echo "Changing BASH Prompt..."
PS1Select_OldDefault



function ManualSource() {
	source ./01_bash-aliases.brcd

	# source ./05_New-Custom-bash-prompt4.brcd

	source ./10_cecho.brcd

	# PS1ConfigTool Not Finished Yet - Workaround
	source ./PS1ConfigTool/PS1ConfigTool.bfunc
	PS1Select_OldDefault

	source ./20_BLING_Loader.brcd

	# source ./80_powerline.brcd.sh

	source ./90_fastfetch.brcd

	source ./97_tmux.brcd

}

##### Unset Export Hack #####
set +a  # Disble automatic exporting of all subsequent variable assignments

