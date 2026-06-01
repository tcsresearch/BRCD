#!/bin/bash

BLING_Libs_Folder="/etc/BLING"

if [ -d "$BLING_Libs_Folder" ]; then
	cecho blue "Processing BLING Library File: "
  # Folder exists, start the for loop
  for BLING_LibraryFile in "$BLING_Libs_Folder"/*.bfunc; do
    # cecho blue "Processing BLING Library: "
    echo -e "$BLING_LibraryFile"
    source $BLING_LibraryFile
  done
else
  cecho red "Folder does not exist: $BLING_Libs_Folder"
fi
