//: Playground - noun: a place where people can play

import Cocoa


// 字符串字面量（string Literals） 用于为常量和变量提供初始值。
var someString = "Some string literal value"

// 初始化空字符串（lnitializing an Empty String）
var emptyString = ""  // 空字符串字面量
var anotherEmotyString = String()  // 初始化方法
// 通过检查Boolean类型的IsEmpty属性来判断改字符串是否为空：
if emptyString.isEmpty {
    print("Nothing to see here")
}

// 字符串的可变性
// 可以通过一个特定字符串分配给一个变量来对其进行修改，或者分配一个常量来保证其不会被修改
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"

// 字符串是值类型
// 创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。

// 使用字符
for character in "Dog!🐶".characters {
    print(character)
}

// 通过标明一个Character类型并使用字符字面量进行赋值，可以建立一个独立的字符常量或变量
let exclamationMark: Character = "!"

// 字符串可以通过传递一个值类型为Character的数组作为自变量来初始化：
let carCharacters: [Character] = ["C", "a", "t", "!", "🐶"]
let catString = String(carCharacters)

// 连接字符串和字符
// 字符串可以通过加法运算符（+）相加在一起（或称连接）创建一个新的字符串
let string1 = "hello"
let string2 = " three"
var welcome = string1 + string2
// 也可以通过加法赋值运算符（+=）将一个字符串添加到一个已经存在字符串变量上
var instruction = "look over"
instruction += string2
// 用append()方法将一个字符附加到一个字符串变量尾部
let exclamationMark1: Character = "!"
welcome.append(exclamationMark1)

// 字符串插值
// 是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。
let multiplier = 3
let message = "\(multiplier) timers 2.5 is \(Double(M))"















