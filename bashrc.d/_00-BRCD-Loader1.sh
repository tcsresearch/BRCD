#!/bin/bash

echo "BRCD Loader. Version 0.1"

BRCD_Folder="/etc/bashrc.d"
echo "BRCD Folder: $BRCD_Folder"
echo " "

if [ -d "$BRCD_Folder" ]; then
#	cd $BRCD_Folder
	echo " Loading Custom BASH Prompt..."
	./PS1ConfigTool.sh OldDefault
	echo "Processing BRCD Library File: "
  # Folder exists, start the for loop
  for BRCD_LibraryFile in "$BRCD_Folder"/*.brcd; do
    # cecho blue "Processing BRCD Library: "
    echo -e "$BRCD_LibraryFile"
    source $BRCD_LibraryFile
  done
#  cd -
else
  echo "Folder does not exist: $BRCD_Folder"
fi
