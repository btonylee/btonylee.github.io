---
layout: post
title:  "WebStorm不能输入中文标点的问题"
date:   2015-11-19 22:17:00
tags: [JetBrains,工具]
categories: 工具
author: btonylee
---

今天下载了WebStorm 11试用，发现不能输入中文的标点符号，在网上搜到有人遇到<a href="https://youtrack.jetbrains.com/issue/IDEA-142652" target="_blank">一样的问题</a>，原因在于内置JRE的Bug。JetBrains今天发布的新版IDE，包括IntelliJ IDEA 15 都采用自带JRE，也会有同样的问题。解决方案是用其他的JRE来代替内置的，已经有人尝试确定用jdk8-u45启动可以正常输入中文标点。

在Oracle的官网可以下载对应版本的JDK，如果已经通过安装包的形式安装过更高版本的，在替换为u45的时候可能会报错，需要先删除版本更高的JRE.

在Mac上可以通过这种方式卸载原有的JRE，引用自<a href="http://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jre.html#A1096890" target="_blank">官方文档</a>。

```
Remove one directory and one file (a symlink), as follows:

Navigate to /Library/Internet Plug-Ins and remove the JavaAppletPlugin.plugin directory.

Navigate to /Library/PreferencePanes and remove JavaControlPanel.prefpane.
```

同时也删除高版本的jdk，引用自<a href="http://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html#A1096903" target="_blank">官方文档</a>。

```
Navigate to /Library/Java/JavaVirtualMachines and remove the directory whose name matches the following format:

/Library/Java/JavaVirtualMachines/jdkmajor.minor.macro[_update].jdk
For example, to uninstall 8u6:

% rm -rf jdk1.8.0_06.jdk
```

安装好新的JDK之后，可以通过这样两个方式切换

- 方法一，删除目录`/Applications/WebStorm.app/Contents/jre`，重启

- 方法二，重启之后，按快捷键 `CMD + Shift + A`，输入 JDK，选择 Switch IDE boot JDK 可以选择新安装的JDK 8u45