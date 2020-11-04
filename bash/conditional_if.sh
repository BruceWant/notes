if [ "first" == "second" ]; then
	echo "true"
elif [ "first" != "second" ]; then
	echo "false"
else 
	echo "nothing"
fi

if [ "10" -gt "5" ]
then echo ; echo "you"
    echo ;
fi

#Rule of thumb: Use -a and -o inside square brackets, && and || outside.
#
#It's important to understand the difference between shell syntax and the syntax of the [ command.
#
#&& and || are shell operators. They are used to combine the results of two commands. Because they are shell syntax, they have special syntactical significance and cannot be used as arguments to commands.
#
#[ is not special syntax. It's actually a command with the name [, also known as test. Since [ is just a regular command, it uses -a and -o for its and and or operators. It can't use && and || because those are shell syntax that commands don't get to see.
#
#But wait! Bash has a fancier test syntax in the form of [[ ]]. If you use double square brackets, you get access to things like regexes and wildcards. You can also use shell operators like &&, ||, <, and > freely inside the brackets because, unlike [, the double bracketed form is special shell syntax. Bash parses [[ itself so you can write things like [[ $foo == 5 && $bar == 6 ]].
#
#https://stackoverflow.com/questions/20449680/boolean-operators-a-o-in-bash
#
#[ "$1" = 'yes' ] && [ -r $2.txt ]
#[ "$1" = 'yes' -a $2 -lt 3 ]
#[[ $1 == yes && -r $2.txt ]]
