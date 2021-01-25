mkdir build
cd build
cmake ^
    -G "NMake Makefiles" ^
    -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D CMAKE_BUILD_TYPE=Release ^
    -DTINYXML_VERSION=%PKG_VERSION% ^
    %SRC_DIR%
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1
