#Test Case ID: 
#Created by: CSCI 590 DR, Fall 2011, Team RubyTesting
#Team members: Rutvik Hora, Rajveer Brar, Sowmya Rao, Prathyusha Chilagani
#This file should generate:
#	29 Total Lines
#	1 Blank Lines
#	Comments:
#		14 Whole
#		0 Embedded
#	0 Compiler Directives
#	0 Data Declarations
#	15 Executable Instructions
#	15 Logical SLOC
#	14 Physical SLOC

for i in (1..10)
    rno = rand(100) + 1
    msg = case rno
	when 42: "The ultimate result."
	when 1..10: "Way too small."
	when 11..15,19,27: "Sorry, too small"
	when 80..99: "Way to large"
	when 100:
		print "TOPS\n"
		"Really way too large"
	else "Just wrong"
    end
    print "Result: ", rno, ": ", msg, "\n"
end