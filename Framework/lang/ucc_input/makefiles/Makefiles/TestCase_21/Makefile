#compile option
CXX	:= g++
CC	:= gcc
OPT	:= -g -O0 -ggdb -Wall -Wno-deprecated -Wno-unused-function -Wno-unused-variable
AR	:= ar rc

#head file and lib file
LIBDIRS	:= #../taxi/src/thirdparty/protobuf/lib
LIBS	:= #protobuf
INCDIRS	:= ../taxi/src/thirdparty/json-c/include
STLIBS	:= \
	../taxi/src/thirdparty/json-c/lib/libjson-c.a

#define macro
MACROS	:=

#files should be solved
SRCDIRS	:= . 
SRCEXTS	:= .cpp .cc .cxx
SRCS	:=

#target
TYPE	:= exe#(exe lib dll)
TARGET	:= main

#config end
###############################################################################################################
#calc var

ifeq ($(TYPE),dll) 
	OPT += -fPIC -shared
endif 

SOURSES	:= $(foreach d, $(SRCDIRS), $(wildcard $(addprefix $(d)/*, $(SRCEXTS))))
SOURSES	+= $(SRCS)
OBJS	:= $(foreach x, $(SRCEXTS), $(patsubst %$(x), %.o, $(filter %$(x), $(SOURSES))))

LIBDIROPT	:= $(foreach d,$(LIBDIRS),-L$(d))
LIBOPT		:= $(foreach f,$(LIBS),-l$(f))
INCOPT		:= $(foreach d,$(SRCDIRS),-I$(d))
INCOPT		+= $(foreach d,$(INCDIRS),-I$(d))

#calc var end
###############################################################################################################
all: $(TARGET)
$(TARGET):$(OBJS)
ifeq ("$(TYPE)","lib")
	$(AR) $(TARGET) $^
else
	$(CXX) $(OPT) -o $(TARGET) $^ $(LIBDIROPT) $(LIBOPT) $(STLIBS)
endif

%.o:%.c
	$(CC) $(OPT) -c $< -o $@ $(INCOPT)
%.o:%.cpp
	$(CXX) $(OPT) -c $< -o $@ $(INCOPT)
%.o:%.cc
	$(CXX) $(OPT) -c $< -o $@ $(INCOPT)
%.o:%.cxx
	$(CXX) $(OPT) -c $< -o $@ $(INCOPT)

clean:
	rm -rf $(OBJS) $(TARGET)
###############################################################################################################
