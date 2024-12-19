# Make入门

## 目录
- [环境准备](#环境准备)
- [构建参数 -Wall 不会影响构建过程](#version-3)

## 法一（不用makefile）：
### 进入learn_makefile文件编译生成可执行程序文件main
```
cd learn_makefile
g++ main.cpp factorial.cpp printhello.cpp -o main
./main
```
## 法二（创建Makefile文件）：
### version 1
#### Makefile文件写入以下代码：
```
# VERSION 1
# hello为生成的可执行文件，依赖于后面的三个.cpp文件
# g++前面加一个TAB的空格
hello: main.cpp printhello.cpp factorial.cpp
	g++ -o hello main.cpp printhello.cpp factorial.cpp
```
#### 构建指令
```
cd learn_makefile
make
./hello
```
### version 2
#### Makefile文件写入以下代码：
```
# VERSION 2
CXX = g++
TARGET = hello
OBJ = main.o printhello.o factorial.o
# make时执行g++ 先找TARGET，TARGET不存在找OBJ，OBJ不存在，编译三个.cpp文件生成.o文件
# 然后再编译OBJ文件，生成可执行文件hello
$(TARGET): $(OBJ)
	$(CXX) -o $(TARGET) $(OBJ)
# main.o这样来的，编译main.cpp生成
main.o: main.cpp
	$(CXX) -c main.cpp
printhello.o: printhello.cpp
	$(CXX) -c printhello.cpp
factorial.o: factorial.cpp
	$(CXX) -c factorial.cpp
```
### version 3
#### Makefile文件写入以下代码：
```
# VERSION 3
CXX = g++
TARGET = hello
OBJ = main.o printhello.o factorial.o
 
# 编译选项，显示所有的warning，但不会影响构建过程
CXXLAGS = -c -Wall
 
# $@表示的就是冒号前面的TARGET，$^表示的是冒号后OBJ的全部.o依赖文件
$(TARGET): $(OBJ)
	$(CXX) -o $@ $^
 
# $<表示指向%.cpp依赖的第一个，但是这里依赖只有一个
# $@表示指向%.o
%.o: %.cpp
	$(CXX) $(CXXLAGS) $< -o $@
 
# 为了防止文件夹中存在一个文件叫clean
.PHONY: clean
 
# -f表示强制删除，此处表示删除所有的.o文件和TARGET文件
clean:
	rm -f *.o $(TARGET)
```
### version 4
#### Makefile文件写入以下代码：
```
# VERSION 4
CXX = g++
TARGET = hello
# 所有当前目录的.cpp文件都放在SRC里面
SRC = $(wildcard *.cpp)
# 把SRC里面的.cpp文件替换为.o文件
OBJ = $(patsubst %.cpp, %.o,$(SRC))
 
CXXLAGS = -c -Wall
 
$(TARGET): $(OBJ)
	$(CXX) -o $@ $^
 
%.o: %.cpp
	$(CXX) $(CXXLAGS) $< -o $@
 
.PHONY: clean
clean:
	rm -f *.o $(TARGET)
```
## 环境准备
### 一、创建文件夹
    > mkdir learn_makefile
### 文件夹新建main.cpp文件
```
#include <iostream>
#include "functions.h"
using namespace std;
 
int main()
{
    printhello();
    cout << "This is main:" << endl;
    cout << "The factorial of 5 is: " << factorial(5) << endl;
    return 0;
}
```
### factorial.cpp文件
``` 
#include "functions.h"
 
int factorial(int n)
{
    if(n == 1)
            return 1;
    else
            return n * factorial(n-1);
}
```
### printhello.cpp文件
```
#include <iostream>
#include "functions.h"
 
using namespace std;
 
void printhello()
{
    int i;
    cout << "Hello world" << endl;
}
```
### function.h文件
```
#ifndef _FUNCTIONS_H_
#define _FUNCTIONS_H_
void printhello();
int factorial(int n);
#endif
```