CXX_GCC := g++
CXXFLAGS_GCC := -std=c++20 -Wall -Wextra -Werror
COMPILE_GCC := $(CXX_GCC) $(CXXFLAGS_GCC)

CXX_CLANG := clang++
CXXFLAGS_CLANG := -std=c++20 -Wall -Wextra -Werror -fsanitize=address -fsanitize=undefined
COMPILE_CLANG := $(CXX_CLANG) $(CXXFLAGS_CLANG)

BUILD_DIR := build
SRC_DIR := src

# Standard make call uses GCC compiler
all: check-gcc build $(BUILD_DIR)/main-gcc

# Can call "make clang" to use CLANG compiler
clang: build check-clang $(BUILD_DIR)/main-clang

# -- Options for github
gcc-build-only: build $(BUILD_DIR)/main-gcc
clang-build-only: build $(BUILD_DIR)/main-clang
# --

$(BUILD_DIR)/main-gcc:
	$(COMPILE_GCC) $(SRC_DIR)/main.cpp -o $(BUILD_DIR)/main

$(BUILD_DIR)/main-clang:
	$(COMPILE_CLANG) $(SRC_DIR)/main.cpp -o $(BUILD_DIR)/main

run:
	$(BUILD_DIR)/main

build:
	mkdir -p $(BUILD_DIR)

# Own check for GCC (web64devkit contains cppcheck)
check-gcc:
	cppcheck $(SRC_DIR)/*

# Own check for CLANG (llvm contains clang-tidy)
check-clang:
	clang-tidy $(SRC_DIR)/*.cpp -checks=cppcoreguidelines-*,clang-analyzer-* -- -fblocks $(SRC_DIR)/*.cpp

clean:
	rm -rf $(BUILD_DIR)/*

