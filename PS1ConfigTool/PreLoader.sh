###############################################################################################################
# Source Config #
#################

ConfigFile="$(pwd)/config/PS1ConfigTool.conf"
if [ -f $ConfigFile ]; then
   echo "Sourcing Config File: $ConfigFile"     
   source $ConfigFile
fi


###############################################################################################################
# Source Functions #
####################

LoaderFile="$(pwd)/functions/SourceFolderLoader.bfunc"
if [ -f $LoaderFile ]; then
   echo "Sourcing Config File: $LoaderFile"     
   source $LoaderFile
fi

# Call SourceFolderLoader
SourceFolderLoader


################################################################################################################
# Source Profiles #
####################

if [ -d $ProfileDir ]; then
   echo "Sourcing Profiles:"     
   # Call SourceFolderLoader
   SourceFolderLoader $ProfileDir
fi

################################################################################################################



