#Test Case ID: 
#Created by: CSCI 590 DR, Fall 2011, Team RubyTesting
#Team members: Rutvik Hora, Rajveer Brar, Sowmya Rao, Prathyusha Chilagani
#This file should generate:
#	27 Total Lines
#	2 Blank Lines
#	Comments:
#		16 Whole
#		0 Embedded
#	0 Compiler Directives
#	0 Data Declarations
#	9 Executable Instructions
#	9 Logical SLOC
#	9 Physical SLOC

# Get the parts of speech
print "Please enter a past-tense verb: "
verb = gets.chomp
print "Please enter a noun: "
noun = gets.chomp
print "Please enter a proper noun: "
prop_noun = gets.chomp
print "Please enter a an adverb: "
adv = gets.chomp

# Make the sentence.
print "#{prop_noun} got a #{noun} and\n#{verb} #{adv} around the block.\n"