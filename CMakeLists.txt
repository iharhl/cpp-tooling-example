cmake_minimum_required(VERSION 3.20)
set(CMAKE_TOOLCHAIN_FILE "C:\\dev\\vcpkg\\scripts\\buildsystems\\vcpkg.cmake")

project(TestTooling VERSION 0.1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(main1 src/main.cpp)

find_package(GTest REQUIRED)
target_link_libraries(main1 PRIVATE GTest::gtest_main)