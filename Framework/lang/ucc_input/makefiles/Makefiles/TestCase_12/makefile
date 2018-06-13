#-------------------------------------------------------------
# Project.......: makefile
# Author........: Kenneth Cascio
# Version.......: 3.1.4
# Project Repo..: http://github.com/TheDarkTower/makefile
#-------------------------------------------------------------

VERSION := 3.1.4

# Set SHELL to use other than default /bin/sh
#SHELL = /bin/bash

# Set HOME env variable if not supported on build system.
#HOME =

# Define TARGET and TAREXT (target extension for binary - blank if none)
TARGET = hello
TAREXT = .exe

# Define Major, Minor, and Release versions for SHARED Libs / .so
SOMAJ = .1
SOMIN = .0
SOREL = .1

# Default directory tree for project
SRCDIR = ./src/
INCDIR = ./inc/
LIBDIR = ./lib/
BINDIR = ./bin/
LOGDIR = ./log/

# Default install directories
INSTALL_BIN = $(HOME)/bin/TESTBED/bin/
INSTALL_SHA = $(HOME)/bin/TESTBED/lib/
INSTALL_SYM = $(HOME)/bin/TESTBED/lib/
INSTALL_STA = $(HOME)/bin/TESTBED/lib/

# Un-comment to RUN 'make show' with all targets for debugging variables
#SHOW = show

# Designate Project Specific Libraries here.  Appended to LDFLAGS.
# Common:  -lpthread -ldl

LIBS =

# ld -shared, Wl,-soname=, cc -fPIC, AND ar rcsv are automatically added for shared/static targets
# the below flags are appended to any flags passed at the command line
# Common sqlite3 CPP flags: -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_COLUMN_METADATA
# 'R' = RELEASE; 'D' = DEBUG
# Set CPPFLAGS, CXXFLAGS, CFLAGS, LDFLAGS, and LDLIBS for Debug & Release builds.

RCPPFLAGS =
DCPPFLAGS =
RCXXFLAGS = -O2 -Wall -Wextra -Wfloat-equal -Weffc++ -std=c++11
DCXXFLAGS = -g3 -Wall -Wextra -Wfloat-equal -Weffc++ -std=c++11
RCFLAGS = -O2 -Wall -Wextra -Wfloat-equal -std=c99
DCFLAGS = -g3 -Wall -Wextra -Wfloat-equal -std=c99
RLDFLAGS =
DLDFLAGS =
RLDLIBS = $(LIBS)
DLDLIBS = $(LIBS)


############################# DO NOT EDIT BELOW THIS LINE ###############################

FALSE := 0
TRUE := 1

######################### BEGIN FUNCTION DEFINITIONS #########################

fnPREP = \#$(1)\#
fnTEST = $(findstring \#$(1)\#, $(patsubst %, \#%\#, $(2)))
fnUNIQUE = $(words $(findstring \#$(1)\#, $(patsubst %, \#%\#, $(2))))
fnALL = $(words $(findstring _all, $(patsubst %, \_%, $(1))))

######################### END FUNCTION DEFINITIONS #########################


# Load *.c, *.cpp, *.so, and *.a files for processing via make wildcard function
SRCCCC := $(wildcard $(SRCDIR)*.c)
SRCCPP := $(wildcard $(SRCDIR)*.cpp)
SRCSHAR := $(wildcard $(LIBDIR)*.so*)
SRCSTAT := $(wildcard $(LIBDIR)*.a*)

# Resolve SRCSHAR & SRCSTAT results to -lmylib FLAGS for CCC/LD
# Embeded basename calls strip .so/.a and any MAJ MIN REL suffixes
# Resulting LIBSHAR and LIBSTAT are appended to LDLIBS
# Any .so or .a will automatically be added to LDLIBS by default

# TESTING ONLY - remove # to override wildcard pulls and test LIBSHAR & LIBSTAT values
#SRCSHAR := $(LIBDIR)libmysharedlib1.so.1.0.1 $(LIBDIR)libmysharedlib2.so.1.0.2
#SRCSTAT := $(LIBDIR)libmystaticlib1.a.1.0.1 $(LIBDIR)libmystaticlib2.a.1.0.2

SRCTEMP := $(basename $(basename $(basename $(basename $(SRCSHAR)))))
LIBSHAR := $(patsubst $(LIBDIR)lib%, -l%, $(SRCTEMP))

SRCTEMP := $(basename $(basename $(basename $(basename $(SRCSTAT)))))
LIBSTAT := $(patsubst $(LIBDIR)lib%, -l%, $(SRCTEMP))

# DEFINED BUILDS & DEFINED COMMANDS for expansion in .PHONY & build/instal logic
# Any target with '_all' in the name will add additional dependencies for .i/.ii .s/.spp

DEFBINS_D := all debug debug_all
DEFSHAR_D := shared dshared shared_all dshared_all
DEFSTAT_D := static dstatic static_all dstatic_all
DEFBINS_R := release release_all
DEFSHAR_R := rshared rshared_all
DEFSTAT_R := rstatic rstatic_all
DEFCMDS := show clean mkdirs install uninstall version
DEFBINS := $(DEFBINS_D) $(DEFBINS_R)
DEFSHAR := $(DEFSHAR_D) $(DEFSHAR_R)
DEFSTAT := $(DEFSTAT_D) $(DEFSTAT_R)
DEFBLDS := $(DEFBINS) $(DEFSHAR) $(DEFSTAT)

# Define .PHONY targets

.PHONY : $(DEFBLDS)
.PHONY : $(DEFCMDS)

#### set MAKECMDGOALS_ (default = 'all) ####
ifeq (0, $(words $(MAKECMDGOALS)))
DEFAULTBLD := true
override MAKECMDGOALS_ := all
else
DEFAULTBLD := false
override MAKECMDGOALS_ := $(MAKECMDGOALS)
endif

# Load log files if command target only
ifeq ($(TRUE), $(call fnUNIQUE,$(MAKECMDGOALS_),$(DEFCMDS)))
LASTBUILD := $(strip $(shell tempvar=$$(cat $(LOGDIR)lastbuild.log); echo $$tempvar))
LASTTPATH := $(dir $(strip $(shell tempvar=$$(cat $(LOGDIR)target.log); echo $$tempvar)))
LASTTARGET := $(notdir $(strip $(shell tempvar=$$(cat $(LOGDIR)target.log); echo $$tempvar)))
LASTSONAME := $(strip $(shell tempvar=$$(cat $(LOGDIR)soname.log); echo $$tempvar))
endif

##########  START: Set directories and flags based on MAKECMDGOALS_  ##########

# DEFBINS_D
ifeq ($(TRUE), $(call fnUNIQUE,$(MAKECMDGOALS_),$(DEFBINS_D)))
LDTARGET = $(TARGET:=$(TAREXT))
LDSONAME =
LDLSNAME = $(LDTARGET)
TARDIR = $(BINDIR)debug/
OBJDIR = $(BINDIR)debug/obj/
DEPDIR = $(BINDIR)debug/dep/
ASMDIR = $(BINDIR)debug/asm/
CPPDIR = $(BINDIR)debug/cpp/
override CPPFLAGS += $(DCPPFLAGS)
override CXXFLAGS += $(DCXXFLAGS)
override CFLAGS += $(DCFLAGS)
override LDFLAGS += $(DLDFLAGS)
override LDLIBS += $(SRCSTAT) $(SRCSHAR) $(DLDLIBS)
endif

# DEFBINS_R
ifeq ($(TRUE), $(call fnUNIQUE,$(MAKECMDGOALS_),$(DEFBINS_R)))
LDTARGET = $(TARGET:=$(TAREXT))
LDSONAME =
LDLSNAME = $(LDTARGET)
TARDIR = $(BINDIR)release/
OBJDIR = $(BINDIR)release/obj/
DEPDIR = $(BINDIR)release/dep/
ASMDIR = $(BINDIR)release/asm/
CPPDIR = $(BINDIR)release/cpp/
override CPPFLAGS += $(RCPPFLAGS)
override CXXFLAGS += $(RCXXFLAGS)
override CFLAGS += $(RCFLAGS)
override LDFLAGS += $(RLDFLAGS)
override LDLIBS += $(SRCSTAT) $(SRCSHAR) $(RLDLIBS)
endif

# DEFSHAR_D
ifeq ($(TRUE), $(call fnUNIQUE,$(MAKECMDGOALS_),$(DEFSHAR_D)))
LDTARGET = lib$(TARGET:=.so)
LDSONAME = lib$(TARGET:=.so)$(SOMAJ)
LDLSNAME = lib$(TARGET:=.so)$(SOMAJ)$(SOMIN)$(SOREL)
TARDIR = $(BINDIR)debug/
OBJDIR = $(BINDIR)debug/obj/
DEPDIR = $(BINDIR)debug/dep/
ASMDIR = $(BINDIR)debug/asm/
CPPDIR = $(BINDIR)debug/cpp/
override CPPFLAGS += $(DCPPFLAGS)
override CXXFLAGS += -fPIC $(DCXXFLAGS)
override CFLAGS += -fPIC $(DCFLAGS)
override LDFLAGS += $(DLDFLAGS)
override LDLIBS += $(SRCSTAT) $(SRCSHAR) $(DLDLIBS)
TMPCCC := $(patsubst $(SRCDIR)main.c, , $(SRCCCC))
TMPCPP := $(patsubst $(SRCDIR)main.cpp, , $(SRCCPP))
SRCCCC := $(TMPCCC)
SRCCPP := $(TMPCPP)
endif

# DEFSHAR_R
ifeq ($(TRUE), $(call fnUNIQUE,$(MAKECMDGOALS_),$(DEFSHAR_R)))
LDTARGET = lib$(TARGET:=.so)
LDSONAME = lib$(TARGET:=.so)$(SOMAJ)
LDLSNAME = lib$(TARGET:=.so)$(SOMAJ)$(SOMIN)$(SOREL)
TARDIR = $(BINDIR)release/
OBJDIR = $(BINDIR)release/obj/
DEPDIR = $(BINDIR)release/dep/
ASMDIR = $(BINDIR)release/asm/
CPPDIR = $(BINDIR)release/cpp/
override CPPFLAGS += $(RCPPFLAGS)
override CXXFLAGS += -fPIC $(RCXXFLAGS)
override CFLAGS += -fPIC $(RCFLAGS)
override LDFLAGS += $(RLDFLAGS)
override LDLIBS += $(SRCSTAT) $(SRCSHAR) $(RLDLIBS)
TMPCCC := $(patsubst $(SRCDIR)main.c, , $(SRCCCC))
TMPCPP := $(patsubst $(SRCDIR)main.cpp, , $(SRCCPP))
SRCCCC := $(TMPCCC)
SRCCPP := $(TMPCPP)
endif

# DEFSTAT_D
ifeq ($(TRUE), $(call fnUNIQUE,$(MAKECMDGOALS_),$(DEFSTAT_D)))
LDTARGET = lib$(TARGET:=.a)
LDSONAME =
LDLSNAME = $(LDTARGET)
TARDIR = $(BINDIR)debug/
OBJDIR = $(BINDIR)debug/obj/
DEPDIR = $(BINDIR)debug/dep/
ASMDIR = $(BINDIR)debug/asm/
CPPDIR = $(BINDIR)debug/cpp/
override CPPFLAGS += $(DCPPFLAGS)
override CXXFLAGS += -fPIC $(DCXXFLAGS)
override CFLAGS += $(DCFLAGS)
override LDFLAGS += $(DLDFLAGS)
override LDLIBS += $(SRCSTAT) $(SRCSHAR) $(DLDLIBS)
TMPCCC := $(patsubst $(SRCDIR)main.c, , $(SRCCCC))
TMPCPP := $(patsubst $(SRCDIR)main.cpp, , $(SRCCPP))
SRCCCC := $(TMPCCC)
SRCCPP := $(TMPCPP)
endif

# DEFSTAT_R
ifeq ($(TRUE), $(call fnUNIQUE,$(MAKECMDGOALS_),$(DEFSTAT_R)))
LDTARGET = lib$(TARGET:=.a)
LDSONAME =
LDLSNAME = $(LDTARGET)
TARDIR = $(BINDIR)release/
OBJDIR = $(BINDIR)release/obj/
DEPDIR = $(BINDIR)release/dep/
ASMDIR = $(BINDIR)release/asm/
CPPDIR = $(BINDIR)release/cpp/
override CPPFLAGS += $(RCPPFLAGS)
override CXXFLAGS += $(RCXXFLAGS)
override CFLAGS += $(RCFLAGS)
override LDFLAGS += $(RLDFLAGS)
override LDLIBS += $(SRCSTAT) $(SRCSHAR) $(RLDLIBS)
TMPCCC := $(patsubst $(SRCDIR)main.c, , $(SRCCCC))
TMPCPP := $(patsubst $(SRCDIR)main.cpp, , $(SRCCPP))
SRCCCC := $(TMPCCC)
SRCCPP := $(TMPCPP)
endif

##########  END: Set directories and flags based on MAKECMDGOALS_  ##########

# Setup CLEAN variables

ifeq ($(MAKECMDGOALS_), clean)
LDTARGET = $(TARGET:=.*)
LDSONAME =
LDLSNAME = $(LDTARGET)
endif

# Setup SHOW variables for testing.

ifeq ($(MAKECMDGOALS_), show)
LDTARGET = $(TARGET:=$(TAREXT))
LDSONAME =
LDLSNAME = $(LDTARGET)
TARDIR = $(BINDIR)debug/
OBJDIR = $(BINDIR)debug/obj/
DEPDIR = $(BINDIR)debug/dep/
ASMDIR = $(BINDIR)debug/asm/
CPPDIR = $(BINDIR)debug/cpp/
override CPPFLAGS += $(DCPPFLAGS)
override CXXFLAGS += $(DCXXFLAGS)
override CFLAGS += $(DCFLAGS)
override LDFLAGS += $(DLDFLAGS)
override LDLIBS += $(SRCSTAT) $(SRCSHAR) $(DLDLIBS)
endif

# Setup INSTALL environment based on log files

ifeq ($(MAKECMDGOALS_), install)
INSTALL_MSG0 := @echo "Nothing to install..."
INSTALL_CPT0 := @echo "No files to copy..."
INSTALL_LNL1 := @echo "No major symlinks to create..."
INSTALL_LNL2 := @echo "No basename symlinks to create..."
# Check for BIN
ifeq ($(TRUE), $(call fnUNIQUE,$(LASTBUILD),$(DEFBINS)))
INSTALL_MSG0 := @echo "Installing binary: $(LASTTARGET)"
INSTALL_CPT0 := cp -f $(LASTTPATH)$(LASTTARGET) $(INSTALL_BIN)$(LASTTARGET)
endif
# Check for SHA
ifeq ($(TRUE), $(call fnUNIQUE,$(LASTBUILD),$(DEFSHAR)))
INSTALL_MSG0 := @echo "Installing shared library: $(LASTTARGET)"
INSTALL_CPT0 := cp -f $(LASTTPATH)$(LASTTARGET) $(INSTALL_SHA)$(LASTTARGET)
INSTALL_LNL1 := ln -fs $(INSTALL_SHA)$(LASTTARGET) $(INSTALL_SYM)$(LASTSONAME)
INSTALL_LNL2 := ln -fs $(INSTALL_SHA)$(LASTTARGET) $(INSTALL_SYM)$(basename $(LASTSONAME))
endif
# Check for STA
ifeq ($(TRUE), $(call fnUNIQUE,$(LASTBUILD),$(DEFSTAT)))
INSTALL_MSG0 := @echo "Installing static library: $(LASTTARGET)"
INSTALL_CPT0 := cp -f $(LASTTPATH)$(LASTTARGET) $(INSTALL_STA)$(LASTTARGET)
endif
endif

# Setup UN-INSTALL environment based on log files

ifeq ($(MAKECMDGOALS_), uninstall)
INSTALL_MSG0 := @echo "Nothing to uninstall..."
INSTALL_RMT0 := @echo "No files to remove..."
INSTALL_RML1 := @echo "No major symlinks to remove..."
INSTALL_RML2 := @echo "No basename symlinks to remove..."
# Check for BIN
ifeq ($(TRUE), $(call fnUNIQUE,$(LASTBUILD),$(DEFBINS)))
INSTALL_MSG0 := @echo "Un-installing BINARY: $(LASTTARGET)"
INSTALL_RMT0 := $(RM) $(INSTALL_BIN)$(LASTTARGET)
endif
# Check for SHA
ifeq ($(TRUE), $(call fnUNIQUE,$(LASTBUILD),$(DEFSHAR)))
INSTALL_MSG0 := @echo "Un-installing SHARED library: $(LASTTARGET)"
INSTALL_RMT0 := $(RM) $(INSTALL_SHA)$(LASTTARGET)
INSTALL_RML1 := $(RM) $(INSTALL_SYM)$(LASTSONAME)
INSTALL_RML2 := $(RM) $(INSTALL_SYM)$(basename $(LASTSONAME))
endif
# Check for STA
ifeq ($(TRUE), $(call fnUNIQUE,$(LASTBUILD),$(DEFSTAT)))
INSTALL_MSG0 := @echo "Un-installing STATIC library: $(LASTTARGET)"
INSTALL_RMT0 := $(RM) $(INSTALL_STA)$(LASTTARGET)
endif
endif


# TARGET CC/LD Control for .c, .cpp, and mixed projects; default .cpp if SRCCPP != ""

ifneq (0, $(words $(SRCCPP)))
SRCEXT := .cpp
CCC = $(CXX)
CCCFLAGS = $(CPPFLAGS) $(CXXFLAGS)
else
SRCEXT := .c
CCC = $(CC)
CCCFLAGS = $(CPPFLAGS) $(CFLAGS)
endif


# Use patsubst to setup build .c/.cpp, .d/.dpp, .s/.spp, and i/.ipp source strings

OBJCCC := $(patsubst $(SRCDIR)%.c, $(OBJDIR)%.o, $(SRCCCC))
OBJCPP := $(patsubst $(SRCDIR)%.cpp, $(OBJDIR)%.opp, $(SRCCPP))

SRCDDD := $(patsubst $(SRCDIR)%.c, $(DEPDIR)%.d, $(SRCCCC))
SRCDPP := $(patsubst $(SRCDIR)%.cpp, $(DEPDIR)%.dpp, $(SRCCPP))

SRCSCC := $(patsubst $(SRCDIR)%.c, $(ASMDIR)%.s, $(SRCCCC))
SRCSPP := $(patsubst $(SRCDIR)%.cpp, $(ASMDIR)%.spp, $(SRCCPP))

SRCICC := $(patsubst $(SRCDIR)%.c, $(CPPDIR)%.i, $(SRCCCC))
SRCIPP := $(patsubst $(SRCDIR)%.cpp, $(CPPDIR)%.ipp, $(SRCCPP))

OBJS := $(OBJCCC) $(OBJCPP)


# Setup FULL build additional dependencies if all or goal includes _all

ifeq ($(TRUE), $(call fnALL,$(MAKECMDGOALS_)))
ADDFULL := $(SRCSCC) $(SRCSPP) $(SRCICC) $(SRCIPP)
else
ADDFULL :=
endif


######################### BEGIN TARGET DEFINITIONS #########################


# Define .PHONY Targets and Dependencies

$(DEFBINS_D) : $(SHOW) $(ADDFULL) $(TARDIR)$(LDTARGET)
	@echo $(MAKECMDGOALS_) > $(LOGDIR)lastbuild.log
	@echo $(TARDIR)$(LDLSNAME) > $(LOGDIR)target.log
	@echo $(LDSONAME) > $(LOGDIR)soname.log
	@echo "All Done - DEFBINS_D/$(MAKECMDGOALS_)"

$(DEFBINS_R) : $(SHOW) $(ADDFULL) $(TARDIR)$(LDTARGET)
	@echo $(MAKECMDGOALS_) > $(LOGDIR)lastbuild.log
	@echo $(TARDIR)$(LDLSNAME) > $(LOGDIR)target.log
	@echo $(LDSONAME) > $(LOGDIR)soname.log
	@echo "All Done - DEFBINS_R/$(MAKECMDGOALS_)"

$(DEFSHAR_D) : $(SHOW) $(ADDFULL) $(TARDIR)$(LDTARGET)
	@echo $(MAKECMDGOALS_) > $(LOGDIR)lastbuild.log
	@echo $(TARDIR)$(LDLSNAME) > $(LOGDIR)target.log
	@echo $(LDSONAME) > $(LOGDIR)soname.log
	@echo "All Done - DEFSHAR_D/$(MAKECMDGOALS_)"

$(DEFSHAR_R) : $(SHOW) $(ADDFULL) $(TARDIR)$(LDTARGET)
	@echo $(MAKECMDGOALS_) > $(LOGDIR)lastbuild.log
	@echo $(TARDIR)$(LDLSNAME) > $(LOGDIR)target.log
	@echo $(LDSONAME) > $(LOGDIR)soname.log
	@echo "All Done - DEFSHAR_R/$(MAKECMDGOALS_)"

$(DEFSTAT_D) : $(SHOW) $(ADDFULL) $(TARDIR)$(LDTARGET)
	@echo $(MAKECMDGOALS_) > $(LOGDIR)lastbuild.log
	@echo $(TARDIR)$(LDLSNAME) > $(LOGDIR)target.log
	@echo $(LDSONAME) > $(LOGDIR)soname.log
	@echo "All Done - DEFSTAT_D/$(MAKECMDGOALS_)"

$(DEFSTAT_R) : $(SHOW) $(ADDFULL) $(TARDIR)$(LDTARGET)
	@echo $(MAKECMDGOALS_) > $(LOGDIR)lastbuild.log
	@echo $(TARDIR)$(LDLSNAME) > $(LOGDIR)target.log
	@echo $(LDSONAME) > $(LOGDIR)soname.log
	@echo "All Done - DEFSTAT_R/$(MAKECMDGOALS_)"


# Include .d and .dpp makefile dependencies when MAKECMDGOALS_ != DEFCMDS
ifeq ($(TRUE), $(call fnUNIQUE,$(MAKECMDGOALS_),$(DEFBLDS)))
include $(SRCDDD)
include $(SRCDPP)
endif


# Specific target dependencies & recipes: .exe, .so, .a, .o, .opp, .s, spp, .i, .ipp, .d, .dpp

$(TARDIR)$(basename $(LDTARGET))$(TAREXT) : $(OBJS)
	@echo "Compiling $@ from $^...."
	$(CCC) $(LDFLAGS) -L$(LIBDIR) -o $@ $^ $(LDLIBS)

$(TARDIR)$(basename $(LDTARGET)).so : $(OBJS)
	@echo "Compiling $@ from $^...."
	$(CCC) -shared -fPIC $(LDFLAGS) -L$(LIBDIR) \
	 -Wl,-soname=$(LDSONAME) -o $@$(SOMAJ)$(SOMIN)$(SOREL) $^ $(LDLIBS)

$(TARDIR)$(basename $(LDTARGET)).a : $(OBJS)
	@echo "Compiling $@ from $^...."
	$(AR) rcsv $@ $^

$(OBJDIR)%.o : $(SRCDIR)%.c
	@echo "Compiling $@ from $<...."
	$(CC) $(CPPFLAGS) $(CFLAGS) -I$(INCDIR) -o $@ -c $<

$(OBJDIR)%.opp : $(SRCDIR)%.cpp
	@echo "Compiling $@ from $<...."
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -I$(INCDIR) -o $@ -c $<

$(ASMDIR)%.s : $(SRCDIR)%.c
	@echo "Compiling $@ from $<...."
	$(CC) -S $(CPPFLAGS) $(CFLAGS) -I$(INCDIR) -o $@ $<

$(ASMDIR)%.spp : $(SRCDIR)%.cpp
	@echo "Compiling $@ from $<...."
	$(CXX) -S $(CPPFLAGS) $(CXXFLAGS) -I$(INCDIR) -o $@ $<

$(CPPDIR)%.i : $(SRCDIR)%.c
	@echo "Compiling $@ from $<...."
	cpp $(CPPFLAGS) -I$(INCDIR) $<  -o $@

$(CPPDIR)%.ipp : $(SRCDIR)%.cpp
	@echo "Compiling $@ from $<...."
	cpp $(CPPFLAGS) -I$(INCDIR) $<  -o $@

# Build all .d make files from SRCCCC
$(DEPDIR)%.d : $(SRCDIR)%.c
	@echo "Compiling $@ from $<...."
	@set -e; $(RM) $@; \
         $(CC) -M -I$(INCDIR) $(CPPFLAGS) $< > $@.$$$$; \
         sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
         $(RM) $@.$$$$

# Build all .dpp make files from SRCCPP
$(DEPDIR)%.dpp : $(SRCDIR)%.cpp
	@echo "Compiling $@ from $<...."
	@set -e; $(RM) $@; \
         $(CXX) -M -I$(INCDIR) $(CPPFLAGS) $< > $@.$$$$; \
         sed 's,\($*\)\.o[ :]*,\1.opp $@ : ,g' < $@.$$$$ > $@; \
         $(RM) $@.$$$$

show:
	@echo "**************************  BEGIN SHOW  **************************"
	@echo "VERSION = "$(VERSION)
	@echo "MAKECMDGOALS  = "$(MAKECMDGOALS)
	@echo "words         = "$(words $(MAKECMDGOALS))
	@echo "MAKECMDGOALS_ = "$(MAKECMDGOALS_)
	@echo "test to       = "$(findstring $(MAKECMDGOALS_), $(DEFCMDS))
	@echo "DEFBINS_D = "$(DEFBINS_D)
	@echo "DEFBINS_R = "$(DEFBINS_R)
	@echo "DEFSHAR_D = "$(DEFSHAR_D)
	@echo "DEFSHAR_R = "$(DEFSHAR_R)
	@echo "DEFSTAT_D = "$(DEFSTAT_D)
	@echo "DEFSTAT_R = "$(DEFSTAT_R)
	@echo "DEFCMDS = "$(DEFCMDS)
	@echo "DEFBINS = "$(DEFBINS)
	@echo "DEFSHAR = "$(DEFSHAR)
	@echo "DEFSTAT = "$(DEFSTAT)
	@echo "DEFBLDS = "$(DEFBLDS)
	@echo "SRCCCC = "$(SRCCCC)
	@echo "SRCCPP = "$(SRCCPP)
	@echo "TARDIR = "$(TARDIR)
	@echo "OBJDIR = "$(OBJDIR)
	@echo "BINDIR = "$(BINDIR)
	@echo "DEPDIR = "$(DEPDIR)
	@echo "ASMDIR = "$(ASMDIR)
	@echo "CPPDIR = "$(CPPDIR)
	@echo "LOGDIR = "$(LOGDIR)
	@echo "LIBS   = "$(LIBS)
	@echo "OBJS   = "$(OBJS)
	@echo "OBJCCC = "$(OBJCCC)
	@echo "OBJCPP = "$(OBJCPP)
	@echo "CCC    = "$(CCC)
	@echo "CC     = "$(CC)
	@echo "CXX    = "$(CXX)
	@echo "AR     = "$(AR)
	@echo "SRCEXT = "$(SRCEXT)
	@echo "RM     =  "$(RM)
	@echo "CPPFLAGS = "$(CPPFLAGS)
	@echo "CXXFLAGS = "$(CXXFLAGS)
	@echo "CFLAGS   = "$(CFLAGS)
	@echo "CCCFLAGS = "$(CCCFLAGS)
	@echo "SRCCCC = "$(SRCCCC)
	@echo "SRCCPP = "$(SRCCPP)
	@echo "SRCDDD = "$(SRCDDD)
	@echo "SRCDPP = "$(SRCDPP)
	@echo "SRCSCC = "$(SRCSCC)
	@echo "SRCSPP = "$(SRCSPP)
	@echo "SRCICC = "$(SRCICC)
	@echo "SRCIPP = "$(SRCIPP)
	@echo "LDTARGET = "$(LDTARGET)
	@echo "LDFLAGS  = "$(LDFLAGS)
	@echo "LDLIBS   = "$(LDLIBS)
	@echo "SRCSHAR  = "$(SRCSHAR)
	@echo "SRCSTAT  = "$(SRCSTAT)
	@echo "LIBSTAT  = "$(LIBSTAT)
	@echo "LIBSHAR  = "$(LIBSHAR)
	@echo "ADDFULL  = "$(ADDFULL)
	@echo "SHOW = "$(SHOW)
	@echo "=====================  TEST VARIABLES/FUNCTIONS ====================="
	@echo "wildcard SRCDIR = "$(wildcard $(SRCDIR)*.c)
	@echo "words SRCDIR =  "$(words $(wildcard $(SRCDIR)*.c))
	@echo "words CPPFLAGS = "$(words $(CPPFLAGS))
	@echo "basename LDTARGET = "$(basename $(LDTARGET))
	@echo "suffix LDTARGET = "$(suffix $(LDTARGET))
	@echo "DEFAULTBLD = "$(DEFAULTBLD)
	@echo "INSTALL_BIN = "$(INSTALL_BIN)
	@echo "INSTALL_SHA = "$(INSTALL_SHA)
	@echo "INSTALL_SYM = "$(INSTALL_SYM)
	@echo "INSTALL_STA = "$(INSTALL_STA)
	@echo "***LASTBUILD  = "$(LASTBUILD)
	@echo "***LASTTPATH  = "$(LASTTPATH)
	@echo "***LASTTARGET = "$(LASTTARGET)
	@echo "***LASTSONAME = "$(LASTSONAME)
	@echo "HOME = "$(HOME)
	@echo "call fnPREP = "$(call fnPREP,$(MAKECMDGOALS_))
	@echo "call fnTEST = "$(call fnTEST,$(MAKECMDGOALS_),$(DEFCMDS))
	@echo "call fnUNIQUE = "$(call fnUNIQUE,$(MAKECMDGOALS_),$(DEFCMDS))
	@echo "TRUE = "$(TRUE)
	@echo "FALSE = "$(FALSE)
	@echo "MAKECMDGOALS_ = "$(MAKECMDGOALS_)
	@echo "DEFCMDS       = "$(DEFCMDS)
	@echo "fnALL = "$(call fnALL,$(MAKECMDGOALS_))
	@echo "============================  END SHOW  ============================"

clean: $(SHOW)
	$(RM) $(BINDIR)debug/obj/*.o $(BINDIR)debug/obj/*.opp
	$(RM) $(BINDIR)release/obj/*.o $(BINDIR)release/obj/*.opp
	$(RM) $(BINDIR)debug/dep/*.d $(BINDIR)debug/dep/*.dpp
	$(RM) $(BINDIR)release/dep/*.d $(BINDIR)release/dep/*.dpp
	$(RM) $(BINDIR)debug/asm/*.s $(BINDIR)debug/asm/*.spp
	$(RM) $(BINDIR)release/asm/*.s $(BINDIR)release/asm/*.spp
	$(RM) $(BINDIR)debug/cpp/*.i $(BINDIR)debug/cpp/*.ipp
	$(RM) $(BINDIR)release/cpp/*.i $(BINDIR)release/cpp/*.ipp
	$(RM) $(BINDIR)debug/$(TARGET) $(BINDIR)debug/$(TARGET).* $(BINDIR)debug/*.so* $(BINDIR)debug/*.a*
	$(RM) $(BINDIR)release/$(TARGET) $(BINDIR)release/$(TARGET).* $(BINDIR)release/*.so* $(BINDIR)release/*.a*
	$(RM) $(LOGDIR)*

mkdirs: $(SHOW)
	mkdir -p $(SRCDIR)
	mkdir -p $(INCDIR)
	mkdir -p $(LIBDIR)
	mkdir -p $(LOGDIR)
	mkdir -p $(BINDIR)debug/obj
	mkdir -p $(BINDIR)debug/dep
	mkdir -p $(BINDIR)debug/asm
	mkdir -p $(BINDIR)debug/cpp
	mkdir -p $(BINDIR)release/obj
	mkdir -p $(BINDIR)release/dep
	mkdir -p $(BINDIR)release/asm
	mkdir -p $(BINDIR)release/cpp
	mkdir -p $(INSTALL_BIN)
	mkdir -p $(INSTALL_SHA)
	mkdir -p $(INSTALL_SYM)
	mkdir -p $(INSTALL_STA)

install: $(SHOW)
	$(INSTALL_MSG0)
	$(INSTALL_CPT0)
	$(INSTALL_LNL1)
	$(INSTALL_LNL2)
	@echo "Install Complete!"
	ls -lah $(INSTALL_BIN)
	ls -lah $(INSTALL_SHA)

uninstall: $(SHOW)
	$(INSTALL_MSG0)
	$(INSTALL_RMT0)
	$(INSTALL_RML1)
	$(INSTALL_RML2)
	@echo "Un-install Complete!"
	ls -lah $(INSTALL_BIN)
	ls -lah $(INSTALL_SHA)

version: $(SHOW)
	@echo
	@echo "-------------------------------------------------------------"
	@echo "Project.......: makefile"
	@echo "Author........: Kenneth Cascio"
	@echo "Version.......: "$(VERSION)
	@echo "Project Repo..: http://github.com/TheDarkTower/makefile"
	@echo "-------------------------------------------------------------"
	@echo
	
