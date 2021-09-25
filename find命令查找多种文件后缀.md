# linux shell find命令 查找多种文件后缀

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/reprint.png)

[whatday](https://blog.csdn.net/whatday) 2019-08-04 17:21:10 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png) 13108 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png) 收藏 14

版权

find命令最常用的是查找某个文件，如：

```bash
find ./ -name "abc.txt"
```

则会在当前目录及子目录下查找abc.txt文件

更常用的是查找某一类型的文件，如：

```bash
find ./ -name "*.txt"
```

则会在当前目录及子目录下查找所有txt文件，但是如果要查找多种文件类型呢？比如某文件夹下面所有.c文件和.h文件，可以这样做：

```bash
find ./ -name "*.[ch]"
```

这个方法有很大的局限性，只对单个字符结尾的文件有效，因为引号里面的是通配符，所以多个多字符结尾的文件只能用正则表达式来查找：

```bash
find ./ -regex ".*\.java\|.*\.xml"
```

上面这条命令会查找当前文件夹下面的所有java文件和xml文件，find默认采用emacs正则，会比较罗嗦，如果采用posix-extended正则会比较简单，如下：

```bash
find ./ -regextype posix-extended -regex ".*\.(java|xml)"
```

当然，如果不需要查找大量后缀，最简单的方式是使用-o选项，优点是比较好记：

```bash
find ./ -name "*.java" -o -name "*.xml"
```

还有比较低效的方法，查找出所有文件再过滤：

```bash
find ./ -type f | egrep "\.(java|xml)$"
```

 