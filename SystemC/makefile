# Define the compiler
CXX = g++

# Define the SystemC installation path
SYSTEMC_HOME = /opt/systemc

# Compiler flags: includes and C++ standard
CXXFLAGS = -I$(SYSTEMC_HOME)/include -std=c++17 -Wall

# Linker flags: library paths, rpath (so it runs without LD_LIBRARY_PATH), and the systemc lib
LDFLAGS = -L$(SYSTEMC_HOME)/lib-linux64 -L$(SYSTEMC_HOME)/lib \
          -Wl,-rpath=$(SYSTEMC_HOME)/lib-linux64 -Wl,-rpath=$(SYSTEMC_HOME)/lib \
          -lsystemc

# Target executable name
TARGET = module_systemc

# Source files
SRCS = module_system.cpp

# Default build rule
all: $(TARGET)

# Rule to build the executable
$(TARGET): $(SRCS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRCS) $(LDFLAGS)

# Clean up build files
clean:
	rm -f $(TARGET)