# ------------------------------------------------------------------------------
# Notes:
# - Versitile makefile for c++ or c projects. Assumes the following
#   director structure by default:
# / --|
#     bin/ ------|
#                main executable
#     build/ ----|
#		 .o files
#     include/ --|
#                .h files
#     src/ ------|
#                .cpp files
#     Makefile

# - This is the default but it can be easily changed.
# - To change the makfile all you really need to do is change these variables!
# -----------------------------------------------------------------------------

# Compiler:
CXX = g++
# Compiler flags:
CXXFLAGS = -Wall -g -std=c++11
# Source file type. So it can be easily changed from cpp to c.
SRCTYPE = cpp
# Folders for .cpp/.c, .o, .h, and binaries respectively.
SRCDIR = src
OBJDIR = build
HDIR = include
BINDIR = bin
# List of .cpp/.c files.
SOURCES = $(addprefix $(SRCDIR)/,main.cpp insertion_sort.cpp)
# List of .o file.
OBJECTS = $(addprefix $(OBJDIR)/,main.o insertion_sort.o)
# Executable target and location.
EXECUTABLE = bin/main

# vpath tells make to look for files that meet the pattern on the left in
# the folder on the right.
# I don't know if all of them are necessary but I have them here just in case.
vpath %.$(SRCTYPE) $(SRCDIR)
vpath %.h $(HDIR)
vpath %.o $(OBJDIR)
vpath % $(BINDIR)

# Default target. Can be run by just calling "make" by itself.
all: $(SOURCES) $(EXECUTABLE)

# Some .h file magic I got from Dr. Talega's video: https://ceas.mediaspace.kaltura.com/media/Multi-file+compilation+via+Make+%26+Programs+in+memory/1_9v5036dw/32599202
# Dr. Talega got it from here: http://stackoverflow.com/questions/2394609/makefile-header-dependencies
# It gets all the dependencies for a file, lists them in ./.depend and then
# includes ./.depend in this file.
depend: .depend

.depend: $(SOURCES)
	rm -f ./.depend
	$(CXX) $(CXXFLAGS) -MM $^ >> ./.depend

include .depend
# End of .h file magic

# Link the .o files to create the binary.
$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(EXECUTABLE) $(OBJECTS)

# Build the .o files from the source files.
# $@ seems to specify the target and $< the dependencies?
$(OBJDIR)/%.o : %.$(SRCTYPE)
	$(CXX) $(CXXFLAGS) -o $@ -c $<

# Deletes the binary file and all the .o files.
# Use it and then rebuild to ensure you aren't getting errors from using
# old .o files.
clean:
	rm -rf build/*.o bin/*
	rm -f ./.depend
