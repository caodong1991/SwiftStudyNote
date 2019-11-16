//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// 术语
/*
 运算符有一元、二元、三元运算符。受运算符影响的值叫做操作数。
 */

// 赋值运算符
/*
 a = b）用b的值来初始化或更新a的值
 */
let b = 10
var a = 5
a = b

/*
 如果赋值的右边是一个多元组，它的元素可以马上被分解成多个常量或变量
 */
let (x, y) = (1, 2)

/*
 swift的赋值操作并不返回任何值。
 */
//if a = b { // 错误，避免把 == 写错成 = 这类错误的出现
//    
//}

// 算符运算符
// 四则算术运算
/*
 加法 +
 减法 -
 乘法 *
 除法 /
 */
print(1 + 2)
print(5 - 3)
print(2 * 3)
print(10.0 / 2.5)
/*
 swift默认情况下不允许在数值运算中出现溢出情况。可以使用Swift的溢出运算符来实现溢出运算（a &+ b）
 */
print(UInt8.max &+ 1)

/*
加法运算符也可用于String的拼接
*/
print("hello," + "world")

// 求余运算符（取模运算）%
/*
 在对负数b求余时，b的符号会被忽略。这意味着a%b和a%-b的解惑是相同的。
 */
print(9 % -4)
print(9 % 4)
print(-9 % 4)
print(-9 % -4)

// 一元负号运算符
let three = 3
let minusThree = -three
let plusThree = -minusThree

// 一元正号算符
let minusSix = -6
let alsoMinusSix = +minusSix

// 组合运算符
var aOther = 1
aOther += 2


// 比较运算符 ==  !=  >  <  >=  <=
/*
 恒等===和不恒等！==来判断两个对象是否引用同一个对象实例
 */
print(1 == 1)
print(2 != 1)
print(2 > 1)
print(1 < 2)
print(1 >= 1)
print(2 <= 1)

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

/*
 如果两个元组的元素相同，且长度相同，元组就可以被比较。比较元组大小按照从左到右、逐值比较的方式，直到发现两个值不等时停止。
 如果所有值都相等，那么这一对元组我们就称它们是相等的.
 Swift 标准库只能比较七个以内元素的元组比较函数。如果你的元组元素超过七个时，你需要自己实现比较运算符。
 */
print((1, "zebra") < (2, "apple"))
print((3, "apple") < (3, "bird"))
print((4, "dog") == (4, "dog"))

// 三元运算符
/*
 问题？答案1：答案2.
 等价于
 if 问题 {
     答案1
 } else {
     答案2
 }
 */
let contentHeight = 40
let hasHeader = true

let rowHeight1 = contentHeight + (hasHeader ? 50 : 20)

var rowHeight2 = contentHeight
if hasHeader {
    rowHeight2 = rowHeight2 + 50
} else {
    rowHeight2 = rowHeight2 + 20
}

// 空合运算符
/*
 空合运算符（a ?? b）将对可选类型a进行空判断，如果a包含一个值就进行解析，否则就返回一个默认值b.
 这个运算符有两个条件：
 1. 表达式a必须是Optional类型。
 2. 默认值b的类型必须要和a存储值得类型保持一致。
 等价于 a != nil ? a! : b
 短路：若a非空，b不会被估值
 */

let defaultColorName = "red"
var userDefineColorName: String?

var colorNameToUse = userDefineColorName ?? defaultColorName
print(colorNameToUse)

userDefineColorName = "green"
colorNameToUse = userDefineColorName ?? defaultColorName
print(colorNameToUse)

// 区间运算符
/* 闭区间运算符（a...b）定义一个包含从a到b（包括a和b）的所有值的区间。
   闭区间运算符在迭代一个区间的所有值时是非常有用的
 */
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

/* 半开区间（a..<b）定义一个从a到b但不包含b的区间。
   该区间包含第一个值而不包括最后一个值。
   半开区间的是用性在于当你使用一个从0开始的列表的（如数组时），非常方便地从0数到列表的长度。*/
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第\(i + 1)个人叫\(names[i])")
}

// 单侧区间
/*
 闭区间操作符有另一个表达形式，可以表达一侧无限延伸的区间，省略掉区间操作符一侧的值，就是单侧区间
 */
for name1 in names[2...] {
    print(name1)
}

for name2 in names[...2] {
    print(name2)
}

/*
 半开区间操作符也有单侧表达形式，附带上它的最终值.
 就像你使用区间去包含一个值，最终值并不会落在区间内
 */
for name3 in names[..<2] {
    print(name3)
}

// 可以查看一个单侧区间是否包含某个特定的值
let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)


// 逻辑运算 操作对象是逻辑布尔值。
// 逻辑非 !a
print(!true)
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

// 逻辑与 a && b
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// 逻辑或 a || b
let hasDoorKey = false
let knowOverridePassword = true
if hasDoorKey || knowOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// 逻辑运算法组合计算
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// 使用括号来明确优先级
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
