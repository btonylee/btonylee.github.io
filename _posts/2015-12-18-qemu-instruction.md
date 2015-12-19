---
layout: post
title:  "QEMU的使用和联合gdb调试"
date:   2015-11-18 22:18:00
tags: [QEMU,操作系统,gdb]
categories: 操作系统
author: btonylee
---

QEMU是一款虚拟机软件，可以运行在x86架构的操作系统（包括windows、linux和UNIX）上，作用是虚拟一个全新的操作系统。平常，我们更常用Virtual Box来虚拟系统，但是不可或缺的是，qemu可以与gdb联合调试，是在学习操作系统原理时的重要工具。

###安装qemu
在上面提到的所有操作系统中，都可以通过编译代码的方式来安装qemu，具体可以参见[官方文档][qemu-wiki]。
在Ubuntu上可以直接通过如下方式安装:
{% highlight bash %}
sudo apt-get install qemu
{% endhighlight %}
在Mac上也可以通过homebrew快速安装。

###启动qemu

新安装qemu后可能会发现并不能找到qemu命令，但是可以找到qemu-system-i386，一般是在目录/usr/bin, 可以执行来建立软连接。
{% highlight bash %}
sudo ln -s /usr/bin/qemu-system-i386 /usr/bin/qemu
{% endhighlight %}
全部的命令参数可以参考[Qemu-doc][qemu-doc]
###联合gdb调试
若要调试操作系统的内核代码，可以执行如下的命令
{% highlight bash %}
qemu -S -s -hda linux.img -D logfile -monitor stdio
{% endhighlight %}
简单解释一下上面几个参数，

`-S`  等待 gdb 连接到端口 1234;

`-s` 在启动时不启动 CPU， 需要在 monitor 中输入 'c'，才能让qemu继续模拟工作;

`-hda file` `-hdb file` `-hdc file` `-hdd file` 使用 file 作为硬盘0, 1, 2, 3镜像

`-d` 输出日志到 logfile文件，不再是stderr

`-monitor dev` 重定向 monitor 到主机设备 dev 中

用gdb调试可以执行如下命令
{% highlight bash %}
file bar.o
target remote :1234
break fooFunction
continue
{% endhighlight %}


[qemu-wiki]: https://en.wikibooks.org/wiki/QEMU
[qemu-doc]:  http://qemu.weilnetz.de/qemu-doc.html
