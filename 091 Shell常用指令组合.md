# 091 Shell常用指令组合
0. ```
    wc -c -w -l
1. [打印空行的行号(/^$/)](#打印空行的行号)
2. [统计所有进程占用内存百分比的和(awk)](#统计所有进程占用内存百分比的和)
3. [统计每个单词出现的个数(xargs sort uniq)](#统计每个单词出现的个数)
4. [去掉所有包含this的句子(sed)](#去掉所有包含this的句子)
5. [求平均值(数据格式化 awk)](#求平均值)
6. [判断输入的是否为IP地址(awk支持可编程逻辑)](#判断输入的是否为ip地址)
7. [处理文本(awk支持数组)](#处理文本)


### 打印空行的行号
- {num++} 表示每一行都会执行一次
- `/^\$/ {print num}` /^$/表示匹配空行，匹配成功执行{print num}
    ```
    # 打印空行的行号
    cat nowcoder.txt | awk '{num++} /^$/{print num}'


### 统计所有进程占用内存百分比的和
- BEGIN{sum=0} 在匹配第一行时进行初始化
- {sum+=$4} $4表示默认分割后 第四个参数，每一行都会执行
    ```
    cat nowcoder.txt | awk 'BEGIN{sum=0} {sum+=$4} END{print $4,sum}' | awk '{print $2}'

### 统计每个单词出现的个数
- xargs -n 1 按照空格分割，并每次传入一个参数给 管道符
- sort | uniq -c 统计重复输出的行
- sort -n -k 2，-n表示按照数字大小排序，-k 按照指定第几列排列
    ```
    cat nowcoder.txt | xargs -n 1 | sort | uniq -c | awk '{print $2,$1}' | sort -n -k 2

### 去掉所有包含this的句子
- 's/old/new/g'  匹配替换，-E 启用可拓展正则
- '/pattern/d' 删除匹配内容
- sed -n '3p' 显示第三行，'3,5p' 3到5行
    ```
    sed '/this/d' nowcoder.txt

### 求平均值
- read count # 读取输入内容
- printf "%.3f",$1/$2 awk 支持类似C语言输出函数
    ```
    sum=0
    read count # 读取输入内容
    for (( i=0;i<count;i++ ));
    do
        read tmp
        sum=$((sum+tmp))
    done

    echo "${sum}/${count}" | awk -F'/' '{printf "%.3f",$1/$2}'

### 判断输入的是否为IP地址
- awk 具有解释性的编程语言
    ```
    for word in $(sed 's/\n/ /g' nowcoder.txt);
    do
        if echo $word | grep -Pq '\d+\.\d+\.\d+\.\d+'; then
            echo $word | awk -F'.' '{if(0<=$1&&$1<=255 && 0<=$2&&$2<=255 && 0<=$3&&$3<=255 && 0<=$4&&$4<=255){print "yes"}else{print "no"}}'
        else
            echo 'error'
        fi
    done

### 处理文本
- {a[$1]=a[$1]$2"\n"} 字符串拼接
    ```
    cat nowcoder.txt| awk -F':' '{a[$1]=a[$1]$2"\n"} END{for(i in a){printf "[%s]\n%s",i,a[i]}}'