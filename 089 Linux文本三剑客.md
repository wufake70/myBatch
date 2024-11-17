# 文本三剑客
grep sed awd
## 文本匹配提取
1. 匹配链接，-P支持pcre正则表达式，o输出匹配的内容默认匹配到行
    ```
    curl www.baidu.com | grep -Po "(http:|src=)[^ ;>]*"

2. 格式化输出,-F分隔符，$0:整行文本，$1第一块...，awk只支持BRE
    >awk -F':' '{print "user:"$1,"\t\thome_path:"$6}' /etc/passwd

## 文本替换
1. -E启用ere正则表达式，s/pattern/replace/g s搜索 g全局替换，\1表示第一个分组 
    >sed -E 's/(<\/.{1,10}>)/\1\n/g' test.html

## 正则版本 BRE、ERE、PCRE
- 在**ERE**和**PCRE**中 *, +, ?, (, ), {, }, |, . <br>
**BRE**是最基础的,\*, \+, \?, \(, \), \{, \}, \|, \. <br>
**PCRE**支持\d, \w等特殊规则，在**ERE**和**BRE**中需要用[0-9], [a-Z]来完成 <br>
## 注意
- grep 支持 BRE、ERE、PCRE
- sed 支持 BRE、ERE
- awk 支持 BRE
        