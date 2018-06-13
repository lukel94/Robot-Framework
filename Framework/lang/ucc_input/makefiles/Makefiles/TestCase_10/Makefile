# Generic Makefile

# Author : Thierry CANTENOT
# Date   : 07/04/2013

#TODO :
#
#  Add .makeignore detection
#  Add make stats : nb lines
#  Add make backup/stash
#
#  Organize better
#

### QUICK SETTINGS ###

# [c, cpp]
LANG = cpp

# [debug, release]
MODE = debug

# Executable name
EXEC = exe

# Makefile name
MAKEFILE = Makefile

# Libraries directory
LIB_DIR = ./lib

# Extern headers (include) folders
EXTERN_HDR_DIR = #$(LIB_DIR)/...

# Extern libraries (lib) folders
EXTERN_LIB_DIR = #$(LIB_DIR)/...

# Extern libraries flags used for linking
EXTERN_LIB_FLAGS = #-lm -lboost_system -lsfml-graphics

### // QUICK SETTINGS


### BASH COMMANDS

MKDIR = @mkdir -p
ECHO  = @echo
RM    = @rm -fv
ACK   = $(ECHO) "DONE"
GPROF = @gprof

### // BASH COMMANDS


### C PROJECT ###

SRC_EXT.c = c
HDR_EXT.c = h

COMP.c = gcc
LD.c   = gcc

WARNINGS.c.debug  = -Wall -Wextra -pedantic -Wshadow -Wpointer-arith \
				    -Wcast-align -Wwrite-strings -Wmissing-prototypes \
				    -Wmissing-declarations -Wredundant-decls -Wnested-externs \
				    -Winline -Wno-long-long -Wuninitialized -Wconversion \
				    -Wstrict-prototypes

WARNING.c.release = 

CFLAGS.c.debug    = -g3 -O0 -std=c99 $(WARNINGS.c.debug)
CFLAGS.c.release  = -g0 -O3 -std=c99 $(WARNINGS.c.release)

LDFLAGS.c.debug   = -O0
LDFLAGS.c.release = -O3

### // C PROJECT


### C++ PROJECT ###

SRC_EXT.cpp = cpp
HDR_EXT.cpp = h #hpp

COMP.cpp = g++
LD.cpp   = g++

WARNINGS.cpp.debug  = -W -Wall -Wextra -Wold-style-cast -Woverloaded-virtual \
				   -Wfloat-equal -Wwrite-strings -Wpointer-arith -Wcast-align \
				   -Wconversion -Wredundant-decls -Winit-self -Wswitch-default \
				   -Wswitch-enum -Wundef -Winline -Wunused-parameter -Weffc++

WARNING.cpp.release =

CFLAGS.cpp.debug   = -std=c++0x $(WARNINGS.cpp.debug)
CFLAGS.cpp.release = -std=c++0x $(WARNINGS.cpp.release)

LDFLAGS.cpp.debug   = 
LDFLAGS.cpp.release = 

### // C++ PROJECT


### PROJECT OPTIONS

SRC_EXT = $(SRC_EXT.$(LANG))
HDR_EXT = $(HDR_EXT.$(LANG))
COMP    = $(COMP.$(LANG))
LD      = $(COMP.$(LANG))
CFLAGS  = $(CFLAGS.$(LANG).$(MODE))
LDFLAGS = $(LDFLAGS.$(LANG).$(MODE))

### // PROJECT OPTIONS


### FOLDERS & FILES

ROOT      = .
SRC_DIR   = $(ROOT)/src
HDR_DIR   = $(ROOT)/include
BUILD_DIR = $(ROOT)/build
OBJ_DIR   = $(BUILD_DIR)/obj
DEP_DIR   = $(BUILD_DIR)/dep
BIN_DIR   = $(ROOT)/bin
TAGS      = $(ROOT)/tags


HEADERS = $(shell find $(HDR_DIR) -type f -name *.$(HDR_EXT))
SOURCES = $(shell find $(SRC_DIR) -type f -name *.$(SRC_EXT))
OBJECTS = $(subst $(SRC_DIR), $(OBJ_DIR), $(SOURCES:%.$(SRC_EXT)=%.o))
DEPS    = $(subst $(SRC_DIR), $(DEP_DIR), $(SOURCES:%.$(SRC_EXT)=%.d))

ALL_FILES = $(HEADERS) $(SOURCES)

TARGET = $(BIN_DIR)/$(EXEC)

GMON_FILE = $(ROOT)/gmon.out

### // FOLDERS & FILES


### TAGS

CTAGS = @ctags -R --sort=yes --c++-kinds=+px-d --fields=+iaS --extra=+q

### // TAGS


### COMPILATION & LINKING FLAGS

HDR_FLAGS = $(foreach dir, $(HDR_DIR), -I$(dir))
LIB_FLAGS = $(foreach dir, $(LIB_DIR), -L$(dir))
EXTERN_HDR_FLAGS += $(foreach dir, $(EXTERN_HDR_DIR), -I$(dir))
EXTERN_LIB_FLAGS += $(foreach dir, $(EXTERN_LIB_DIR), -L$(dir))

HDRS = $(HDR_FLAGS) $(EXTERN_HDR_FLAGS)
LIBS = $(LIB_FLAGS) $(EXTERN_LIB_FLAGS)

### // COMPILATION & LINKING FLAGS


### MAKEFILE TARGETS

ALL     = all
INIT    = init
DEBUG   = debug
RELEASE = release
PROFILE = profile
RUN     = run
GPROF   = gprof
TODO    = todo
SHOW    = show
CLEAN   = clean
CLEAR   = clear

### // MAKEFILE TARGETS



### MAKEFILE TARGETS & RULES

	
$(OBJ_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT) $(MAKEFILE)
	$(ECHO) "Compiling < $< >..."
	$(MKDIR) $(@D)
	$(MKDIR) $(dir $(DEP_DIR)/$*.d)
	$(COMP) $(CFLAGS) $(HDRS) -c $< -MMD -MF $(DEP_DIR)/$*.d -o $@ 

$(ALL): $(INIT) $(TARGET) $(TAGS)

$(TARGET): $(OBJECTS)
	$(ECHO) "Linking..."
	$(MKDIR) $(BIN_DIR)
	$(LD) $(LDFLAGS) $^ $(LIBS) -o $@

$(TAGS): $(HEADERS) $(SOURCES)
	$(CTAGS) $(HDR_DIR) $(SRC_DIR) $(EXTERN_HDR_DIR)

$(DEBUG): CFLAGS  = $(CFLAGS.$(LANG).debug)
$(DEBUG): LDFLAGS = $(LDFLAGS.$(LANG).debug)
$(DEBUG): $(ALL)

$(RELEASE): CFLAGS  = $(CFLAGS.$(LANG).release)
$(RELEASE): LDFLAGS = $(LDFLAGS.$(LANG).release)
$(RELEASE): $(ALL)

$(PROFILE): CFLAGS  += -g3 -O0 -pg
$(PROFILE): LDFLAGS += -O0 -pg
$(PROFILE): $(ALL)

$(RUN): $(ALL)
	@export LD_LIBRARY_PATH=$(LIB_DIR) && $(TARGET)

$(GPROF): $(PROFILE) $(RUN)
	$(GPROF) $(TARGET) $(GMON_FILE)

$(INIT):
	$(MKDIR) $(SRC_DIR) $(HDR_DIR) $(OBJ_DIR) $(DEP_DIR) $(BIN_DIR)

$(TODO):
	-@for f in $(ALL_FILES); do fgrep -H -e TODO -e FIXME $$f; done; true

$(SHOW):
	$(ECHO) "HEADERS : " $(HEADERS) "\n"
	$(ECHO) "SOURCES : " $(SOURCES) "\n"
	$(ECHO) "OBJECTS : " $(OBJECTS) "\n"
	$(ECHO) "DEPS    : " $(DEPS) "\n"

$(CLEAN):
	$(ECHO) "Clean..."
	$(RM) $(DEPS) $(OBJECTS) $(GMON_FILE)
	$(ACK)

$(CLEAR):
	$(ECHO) "Clear..."
	$(RM) $(DEPS) $(OBJECTS) $(TARGET) $(TAGS) $(GMON_FILE)
	$(ACK)

### // MAKEFILE TARGET & RULES


.PHONY: $(ALL) $(INIT) $(DEBUG) $(RELEASE) $(PROFILE) $(RUN) $(GPROF) $(TODO) \
		$(SHOW) $(CLEAN) $(CLEAR)

-include $(DEPS)

