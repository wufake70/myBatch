# 093 Cmake构建问题

## CMakeLists.txt 一些语法
```
# 项目要求的cmake最低版本
cmake_minimum_required(VERSIoN 3.10) 

# 项目名字，最后编译成的可执行文件也会和他一样
project(Example)

# 本地必要的库，这些库也需要x.camke文件
find_package(imgui REQUIRED)
find_package(glfw3 REQUIRED)
find_package(GLEW REQUIRED)
find_package(glm REQUIRED)

# 匹配所有源文件，并存为 SRC_FILES
file(GLOB SRC_FILES
"${PROJECT_SOURCE_DIR}/src/*.h"
"${PROJECT_SOURCE_DIR}/src/*.cpp
"${PROJECT_SOURCE_DIR}/src/*.c"
"${PROJECT_SOURCE_DIR}/src/*.cc")
# CMAKE_PROJECT_NAME 项目名字的宏
add_executable(${CMAKE_PROJECT_NAME} ${SRC_FILES})

# 添加源码
add_executable(Example main.cpp)
```
## Cmake配置和构建指令
```
# 配置项目,-S指定 CMakeLists.txt的路径，-B 创建build目录
cmake -S . -B build

# 构建项目
cmake --build build

#效果同上
mkdir build
cd build
cmake ..
```
## 问题演示
### 构建时没有找到必要的库(微软的密码库 SEAL VERSION 4.1.2)
```
# error code
CMake Error at CMakeLists.txt:14 (find_package):
  By not providing "FindSEAL.cmake" in CMAKE_MODULE_PATH this project has
  asked CMake to find a package configuration file provided by "SEAL", but
  CMake did not find one.

  Could not find a package configuration file provided by "SEAL" (requested
  version 4.1.2) with any of the following names:

    SEALConfig.cmake
    seal-config.cmake

  Add the installation prefix of "SEAL" to CMAKE_PREFIX_PATH or set
  "SEAL_DIR" to a directory containing one of the above files.  If "SEAL"
  provides a separate development package or SDK, be sure it has been
  installed.

CMake 错误出现在 CMakeLists.txt:14 (find_package):
由于未在 CMAKE_MODULE_PATH 中提供“FindSEAL.cmake”，该项目已要求 CMake 查找“SEAL”提供的包配置文件，但 CMake 未找到。

找不到“SEAL”提供的具有以下任何名称的包配置文件（请求版本 4.1.2）：

SEALConfig.cmake
seal-config.cmake

将“SEAL”的安装前缀添加到 CMAKE_PREFIX_PATH 或将“SEAL_DIR”设置为包含上述文件之一的目录。如果“SEAL”提供了单独的开发包或 SDK，请确保已安装。
```
### 解决方法，添加 CMAKE_MODULE_PATH或SEAL_DIR 环境变量，变量值为 含有x.cmake文件的路径
```
set CMAKE_PREFIX_PATH=..\..\build\cmake;%CMAKE_PREFIX_PATH%
# or
set SEAL_DIR=..\..\build\cmake;
```