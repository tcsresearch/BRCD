function LoadPS1Functions() {
        PS1ConfigTool_FunctionsFile="./PS1ConfigTool.bfunc"
        if [ -f $PS1ConfigTool_FunctionsFile ]; then
                echo -n "Sourcing Functions..."
                source $PS1ConfigTool_FunctionsFile
###             source ./PS1ConfigTool.bfunc
                echo "Functions Loaded."
                echo " "
        fi
}

