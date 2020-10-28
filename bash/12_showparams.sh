#!/bin/bash
                                                                                
echo "This script demonstrates function arguments."
echo
                                                                                
echo "Positional parameter 1 for the script is $1."
echo
                                                                                
test ()
{
    echo "Positional parameter 1 in the function is $1."
    RETURN_VALUE=$?
    echo "The exit code of this function is $RETURN_VALUE."
}

pathmunge () {
        if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH=$PATH:$1
           else
              PATH=$1:$PATH
           fi
        fi
}

test other_param

pathmunge /bin/asdf
