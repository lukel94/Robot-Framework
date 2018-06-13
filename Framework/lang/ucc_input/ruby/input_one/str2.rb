#Test Case ID: 
#Created by: CSCI 590 DR, Fall 2011, Team RubyTesting
#Team members: Rutvik Hora, Rajveer Brar, Sowmya Rao, Prathyusha Chilagani
#This file should generate:
#	31 Total Lines
#	6 Blank Lines
#	Comments:
#		17 Whole
#		0 Embedded
#	0 Compiler Directives
#	0 Data Declarations
#	8 Executable Instructions
#	8 Logical SLOC
#	8 Physical SLOC

s = "Hi there.  How are you?"
print s.length, " [" + s + "]\n"

# Selecting a character in a string gives an integer ascii code.
print s[4], "\n"
printf("%c\n", s[4])

# The [n,l] substring gives the starting position and length.  The [n..m]
# form gives a range of positions, inclusive.
print "[" + s[4,4] + "] [" + s[6..15] + "]\n"

print "Wow " * 3, "\n"

print s.index("there"), " ", s.index("How"), " ", s.index("bogus"), "\n"

print s.reverse, "\n"