#Test Case ID: 
#Created by: CSCI 590 DR, Fall 2011, Team RubyTesting
#Team members: Rutvik Hora, Rajveer Brar, Sowmya Rao, Prathyusha Chilagani
#This file should generate:
#	19 Total Lines
#	1 Blank Lines
#	Comments:
#		14 Whole
#		0 Embedded
#	0 Compiler Directives
#	0 Data Declarations
#	4 Executable Instructions
#	4 Physical SLOC
#	4 Logical SLOC

z = { 'mike' => 75, 'bill' => 18, 'alice' => 32 }
z['joe'] = 44
print z['bill'], " ", z['joe'], " ", z["smith"], "\n"
print z.has_key?('mike'), " ", z.has_key?("jones"), "\n"