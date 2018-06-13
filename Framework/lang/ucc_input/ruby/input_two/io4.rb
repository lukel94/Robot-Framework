#Test Case ID: 
#Created by: CSCI 590 DR, Fall 2011, Team RubyTesting
#Team members: Rutvik Hora, Rajveer Brar, Sowmya Rao, Prathyusha Chilagani
#This file should generate:
#	34 Total Lines
#	3 Blank Lines
#	Comments:
#		17 Whole
#		0 Embedded
#	0 Compiler Directives
#	0 Data Declarations
#	13 Executable Instructions
#	13 Logical SLOC
#	14 Physical SLOC

# Get the parts of speech.
print "Please enter a past-tense verb: "
verb = gets.chomp
print "Please enter a noun: "
noun = gets.chomp
print "Please enter a proper noun: "
prop_noun = gets.chomp
print "Please enter a an adverb: "
adv = gets.chomp

# See where to put it.
print "Please enter a file name: "
fn = gets.chomp
handle = open(fn,"w")

# Go.
printf(handle, "%s got a %s and\n%s %s around the block.\n",
	prop_noun, noun, verb, adv)
handle.close