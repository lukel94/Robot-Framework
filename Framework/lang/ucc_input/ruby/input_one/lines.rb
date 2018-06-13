#Test Case ID: 
#Created by: CSCI 590 DR, Fall 2011, Team RubyTesting
#Team members: Rutvik Hora, Rajveer Brar, Sowmya Rao, Prathyusha Chilagani
#This file should generate:
#	23 Total Lines
#	1 Blank Lines
#	Comments:
#		14 Whole
#		0 Embedded
#	0 Compiler Directives
#	0 Data Declarations
#	5 Executable Instructions
#	5 Logical SLOC
#	8 Physical SLOC

a = 10
b = a +
	10
c = [ 5, 4, 
	10 ]
d = [ a ] \
	+ c
print "#{a} #{b} [", c.join(" "), "] [", d.join(" "), "]\n";