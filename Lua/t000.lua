#!/usr/bin/lua
--[[
print(type("fuck python"))
print(type('all hail Archlinux'))
print(type(a))
print(type(123))
print(type(false))
--]]
--如果需要直接调用解释器跑脚本，记得chmod 755

--[[
不然直接
lua 文件名.lua
或者直接用vscode的插件跑也行？
--]]
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