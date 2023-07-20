# Tooling for C++ development

NOTE: so far only tested on x86 Windows 11.

## GNU Make

Install:
1. llvm-mingw (clang compiler with extra tools) for x86_64 windows 
2. w64devkit (gcc compiler with extra tools) for x86_64 windows 
3. (Optional? I already had it) Install GNU Make.

Makefile provides:
1. By default builds with GCC + uses static analyazer - cppcheck
2. Can also build with CLANG + uses address sanitizer and clang-tidy

How to run:
1. For GCC compiler call: <code>make</code> or for CLANG call: <code>make clang</code>
2. For running the built executable: <code>make run</code>
3. To clean build/ folder call: <code>make clean</code>

## CMake + vcpkg

Installing vcpkg:
1. Check the original website.
2.  CMAKE_TOOLCHAIN_FILE

In order to make it work, here are steps:
1. Install vcpkg (I did in <code>C:\dev\vcpkg</code>) and run the <code>bootstrap-vcpkg.bat</code>. I also added the folder to the Path.
2. Modify (if installed in different place) the <code>CMAKE_TOOLCHAIN_FILE</code> in <code>CMakeLists.txt</code>.
3. Install Visual Studio tools:
    - C++ CMake tools for Windows
    - Universal Windows: Platform build tools
4. Run command "vcpkg install" to install package specified in json file
5. Configure cmake

For vcpkg.json the "builtin-baseline" is the baseline commit of vcpkg. I used the latest commit hash on master at that time.