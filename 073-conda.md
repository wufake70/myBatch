# Conda
Conda是一个强大的Python包管理和环境管理工具，它可以帮助我们轻松地安装、更新、卸载和切换不同版本的Python和各种第三方库²。、

## 以下是一些常用的conda命令：
0. 安装py包
* * `conda install numpy`
1. 查看conda版本：
* * `conda --version`
2. 创建虚拟环境：
* * `conda create --name 环境名`
3. 创建指定python版本的虚拟环境：
* * `conda create --name 环境名 python=3.6`
* * `conda create -n 环境名 python=3.6`
4. 删除某个环境：
* * `conda env remove -n 环境名`
5. 查看安装的包：
* * `conda list`
6. 查看所有的虚拟环境：
* * `conda info --envs`；`conda env list`
7. 激活环境：
* * `conda activate 环境名`; 退出环境：`conda deactivate`
8. 添加镜像源：清华源： 
* * `conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/`
9. 查看已经安装的镜像源：
* * `conda config --show`
10. 删除添加的镜像源： 
* * `conda config --remove-key channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/`

## anaconda和miniconda的区别
```
    Anaconda是一个完整的Python发行版，它包含了Python解释器、conda包管理器以及大量预装的科学计算软件包。
    这意味着，当您安装Anaconda时，您将获得一个预配置好的环境，其中包含了许多常用的科学计算软件包。
    相比之下，Miniconda则更加轻量级。它只包含了conda包管理器、Python解释器以及它们所依赖的一些必要软件包。
    这意味着，当您安装Miniconda时，您将获得一个最小化的环境，其中只包含了最基本的工具。如果您需要其他软件包，您需要手动使用conda命令来安装它们。
    简而言之，Anaconda提供了一个预配置好的环境，其中包含了大量预装的科学计算软件包；
    而Miniconda则提供了一个最小化的环境，让您可以根据需要手动安装所需的软件包。