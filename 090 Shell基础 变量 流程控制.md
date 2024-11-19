# Shell基础

## shell变量
- 创建格式 `var=value` 等号两边没有空格
- 使用时 `$var`
- 数值运算时 `$(( exp ))`
- 撤销变量 `unset var`
- 查看全局变量 `env`
- 查看全部(全局,用户)变量 `set`
- 子进程无法访问用户变量，导出用户变量为系统变量 `export var` 即可
- 子进程修改父进程导出的变量，`对父进程没有影响`
- 特殊变量
    ```
    echo "$@="$@ # 参数列表
    echo "$#="$# # 参数个数
    echo "$$="$$ # 进程号
    echo "$?="$? # 上一条执行状态
- 将指令的结果存储为变量
    > a=$(ls) 

## 流程控制
### if
- if 数字比较类
    ```
    # gt lt eq,ge le 
    if [ $var -eq 100 ]; then ### if [] exp 必须空格区分
    : # 表示空操作
    else
    :
    fi
- if 字符串匹配类
    ```
    # 与 grep -q 结合，-q表示不输出匹配结果
    str='hello world'
    if echo $str | grep -q hello ;then
        echo 'hello exist'
    else
        echo 'no exist'
    fi
    exit 0 # 退出

### for 循环
- C类型loop
    ```
    a=100
    for (( i=0;i<100;i++ ));  ### for ((exp)) 必须空格区分
    do
        echo -n "$i "
    done 

- 遍历列表型
    ```
    a='111 222 9 333 333'
    OLD_IFS=$IFS
    IFS='9' ### 分隔符变量 IFS，可以修改
    for word in $a;  
    do
        echo -n "${word}_" ### 双引号字符串，变量需要+{}
    done 
    IFS=$OLD_IFS


