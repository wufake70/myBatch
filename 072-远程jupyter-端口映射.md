# 远程jupyter
## 问题描述
```
    # 租用云服务器时，若服务器提供商没有提供jupyter的环境，
    # 并且一般GPU云服务器也没有公网IP。
    # 此时我们想要在本地 打开jupyter提供的网页，
    必须要做端口映射(`服务器提供商提供的SSH服务器监听的端口号`)或者内网穿透(zerotier)。
```

## 安装 jupyter，简单使用
### jupyter notebook的安装
* ```
    1. pip install jupyter

    2.pip install notebook

    3.运行笔记本：jupyter notebook。
### jupyterlab的安装
```
    1.pip install jupyter jupyterlab

    2.jupyter lab --ip 0.0.0.0 --port 8888 --allow-root
```
    --ip=x.x.x.x    指定ip
    --port=xx       指定端口
    --allow-root    允许root用户运行jupyter

## 本地远程jupyter
* `ssh -CNgv -L 8889:127.0.0.1:8889 root:gx-xds-rdp.songmao-idc.com -p 54010`

* 这是一个SSH命令，用于建立一个到远程服务器的SSH连接。下面是每个参数的解释：

* - `ssh`：SSH客户端命令。
- * `-C`：请求压缩所有数据。
- * `-N`：不执行远程命令，通常与端口转发一起使用。
- * `-g`：允许远程主机连接到本地转发的端口。
- * `-v`：详细模式。打印调试信息。
- * `-L 8889:127.0.0.1:8889`：指定将本地主机（客户端）的8889端口转发到远程主机（服务器）的127.0.0.1 IP地址上的8889端口。
- * `root:gx-xds-rdp.songmao-idc.com`：指定要连接的远程主机的用户名和主机名。
- * `-p 54010`：指定远程主机上SSH服务器监听的端口号。
* * 注意: 这里的 `-p`参数 必须是 `服务器提供商会给出SSH服务器监听的端口号`，默认的是 22。
