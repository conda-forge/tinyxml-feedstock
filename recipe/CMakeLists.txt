# Taken from https://gist.githubusercontent.com/scpeters/6325123/raw/cfb079be67997cb19a1aee60449714a1dedefed5/tinyxml_CMakeLists.patch
# This CMakeLists.txt file builds a shared library and provide an install
# target for tinyxml. This was submitted upstream as
# https://sourceforge.net/p/tinyxml/patches/66/
cmake_minimum_required(VERSION 3.4)
project(tinyxml)
add_definitions(-DTIXML_USE_STL)
add_library(tinyxml SHARED tinyxml.cpp tinyxmlerror.cpp tinyxmlparser.cpp)
set_target_properties(tinyxml PROPERTIES
                      INSTALL_NAME_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set_target_properties(tinyxml PROPERTIES 
                      WINDOWS_EXPORT_ALL_SYMBOLS 1)

install(TARGETS tinyxml
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)

install(FILES tinyxml.h
        DESTINATION include)

configure_file(${CMAKE_CURRENT_LIST_DIR}/tinyxml.pc.in 
               ${CMAKE_BINARY_DIR}/tinyxml.pc 
               @ONLY)

install(FILES ${CMAKE_BINARY_DIR}/tinyxml.pc 
        DESTINATION lib/pkgconfig)
