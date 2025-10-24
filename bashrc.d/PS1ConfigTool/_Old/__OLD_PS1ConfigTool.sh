## The following line is a default parameter; disabled for replacement with a custom implementation.
### export PS1='[\h]$ '

## TODO ##
# Use -z and enable $1 parameter or CASE
#  Use the export command AND source trhis file.
#        		  Use the CASE statement.
#
#
#

############################################################################################################
# Define Functions #
####################

function DisplayBanner() {
	echo "BASH Prompt Configuration Utility."
	echo "Version 0.1."
	echo "(c) 2025 TCS Research.  All Rights Reserved."
	echo " "
}


function zTest() {
        if [ -z "$1" ]
        then
         echo "ERROR: -z Failed!"
        fi
}

function Usage() {
        echo "Please Select a BASH prompt preset to use."
        echo "You can select by running $0 [PRESET], where [PRESET] is one of the following: "
        echo "Default | Basic | MoreInfo | OldDefault | NewDefault "
	echo " "
}


###############################################################################################################
# Main Program #
################

DisplayBanner

##### PS1 Profiles #####
case $1 in 


	Default)	export PS1="[\h]$ " ;;


	Basic)		export PS1="$(whoami)@$(hostname):$(pwd)$" ;;


	MoreInfo)	export PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]" ;;

	OldDefault) 	export PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]" ;;

	NewDefault)	export PS1="\n\[\033[1;31m\]\u@\h: \[\033[1;34m\] -> \[\033[0;32m\]" ;;


# DISABLED 	*) echo "ERROR: Uknknown Option." >&2 ;;
	*) Usage >&2 ;;

esac



