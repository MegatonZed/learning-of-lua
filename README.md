# 泽德的Lua学习笔记
~~内含私货，暴论~~
# 环境配置
```
Archlinux
yay -S lua
```
~~没什么奇怪依赖还行~~
~~这让我想起了python~~

# 交互式编程
```
lua -i
--开启交互式编程
```
~~我已经感觉不太妙了~~
```
[zed@coldwalker Lua]$ lua -i
Lua 5.4.1  Copyright (C) 1994-2020 Lua.org, PUC-Rio
> print("fuck python")
fuck python
> a=1,b=2
stdin:1: unexpected symbol near '='
> int a=2
stdin:1: syntax error near 'a'
>
```
~~随便试了一下语法比起python更为严谨？~~

# 脚本式编程
* 建立一个.lua文件
* 使用 *lua 文件名.lua* 以运行脚本
    * 也可以提前设定系统所用的lua解释器
    ```
    [zed@coldwalker Lua]$ ls
    Note.md  t000.lua
    [zed@coldwalker Lua]$ ./t000.lua
    bash: ./t000.lua: 权限不够
    [zed@coldwalker Lua]$ sudo chmod 755 t000.lua 
    [sudo] zed 的密码：
    [zed@coldwalker Lua]$ ls
    Note.md  t000.lua
    [zed@coldwalker Lua]$ ./t000.lua
    bash: ./t000.lua：/usr/local/bin/lua：解释器错误: 没有那个文件或目录
    [zed@coldwalker Lua]$ 
    ```
    ~~悲剧，找不到lua解释器~~
    才怪，我自己配置的ArchLinux的lua目录在#!/usr/bin/lua

# 注释
* 单行
```
--注释内容
```
* 多行
```
--[[
    多行注释内容
--]]
```

# 标识符
* lua区分大小写
* lua不建议使用诸如  _A 这样的「下划线+大写字母」作为变量名称
* 诸如 _VARIABLE 这样的「下划线+数个大写字母」作为lua内部全局变量
* 缺省情况下变量总是全局的

# 数据类型
~~最难受的来了~~

* nil
    * 表示一个无效值
    * 在条件表达式中相当于false
    * 这是个数据类型，只存在**数值 nil**
    * ~~英文nil的意思是“零”~~
    * ~~“什么？没有数值不就是数值为零吗！”~~
    * 假设定义了一个变量，但是没有初始化，此时调用这个变量，此变量的数据类型以及数值就为nil
    * ~~仔细想想这可以避免很多程序报错不运行什么的....有点自暴自弃的感觉？~~

* boolean
    * 老朋友：true 和 false

* number
    * 双精度实浮点数

* string
    * 字符串，由双引号或者单引号表示

* table
    * 表
    * 声明
        ```
        --空表
        表名={}
        --初始化的表
        表名={元素1,元素2...,元素N}
        ```
    * 索引
        * lua的表的索引**0从1开始**
        * ~~没想到吧!~~
        * lua中表的实质是一个关联数组
            * 也就是说，索引可以是数字,也可以是字符串
    * 长度
        * lua的表，长度不固定
    * 实验
        * 目的
            * 检测长度变化
            * 检测移除元素后是否能自动排序
        * 代码
        ```
        local count=0
        local tbl = {"apple", "pear", "orange", "grape"}--设定一个长度为4的table
        for k,v in pairs(tbl) do
	        count = count + 1
        end
        print(count)
        count=0--计数
        tbl[5]="Senpai"--现在我们插入一个新的元素
        for k,v in pairs(tbl) do
	        count = count + 1
        end
        print(count)
        count=0--计数
        tbl[5]=nil
        tbl[3]=nil--然后我们试着把索引为5还有3的元素去掉
        count=0
        for k,v in pairs(tbl) do
	        count = count + 1
        end
        print(count)
        count=0--计数，看看能不能正确读取长度
        print(tbl[3])--看看后面的元素能不能正确被移到前面
        print(tbl[4])
        ```
        * 结果
        ```
        [zed@coldwalker Lua]$ ./t000.lua
        4
        5
        3
        nil
        grape
        [zed@coldwalker Lua]$
        ```

* function
    * 由C或者Lua编写的函数
    * ~~这他妈也是数据类型？~~
    * 返回一个函数？
    * 迫真多态<=结论