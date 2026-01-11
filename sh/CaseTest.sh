case $(id -u) in
    0) # If user is root
        export PS1="\[\e[31m\]\h:\w# \[\e[0m\]" ;;
    *) # For other users
        export PS1="\[\e[34m\]\u@\h:\w\$ \[\e[0m\]" ;;
esac
