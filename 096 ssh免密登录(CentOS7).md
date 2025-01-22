# 096 ssh免密登录(CentOS7)

## 本机生成密钥对
```
# -t 指定加密类型
ssh-keygen -t rsa
# 在家目录的.ssh文件夹下 生成 id_rsa,id_rsa.pub文件
```

## 远程机 创建对应.ssh目录及其authorized_keys文件，所有人必须为root
```
# 手动生成
su root
mkdir .ssh
touch authorized_keys

# ssh命令生成
ssh localhost
需要自行创建authorized_keys文件，必须root用户
```
## 再将本机生成的 id_rsa.pub文件复制 追加 到远程机 .ssh/authorized_keys中，即可实现免密登录
