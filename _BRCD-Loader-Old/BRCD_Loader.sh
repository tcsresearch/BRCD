# BRCD_Loader - Confirms Program Exists Before Running
#

# FIXME: if $Program is not found, the error message doesn't display.
#
Program="$1"

 RunBRCD_Loader() {
                if [ -f `which $Program ` ]; then
                  $Program
		else
			cecho red "ERROR: $Program Not Found...exiting."
			exit 1
                fi
        }


# if not enough args displayed, display an error and die
## [ $# -eq 0 ] && cecho blue "Usage: $0 filename"

if [ -z "$1" ]; then
  echo "Usage: $Program [filename] "
else
	RunBRCD_Loader
fi


