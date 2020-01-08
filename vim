# beginning of word
/\<
# end of word
/\>

# Using macro, the macro store in register.
qa			# Start recording
# Do something.
q			# End recording
@a			# Using Macro saved in register 'a'.
[count]@a		# Using saved macro 'count' times.


# Access register 'a'
"a
# Access all current defined register.
:reg
# Copy current line into register 'a'
"ayy
# To paste from system clipboard on Linux.
"+p


# yanked text saved on register 0-9
# paste from the latest yanked text.
# register 9 is the oldest yanked text.
"0p


# increase a number in a line
Ctrl + a
# decrease a number in a line
Ctrl + x
