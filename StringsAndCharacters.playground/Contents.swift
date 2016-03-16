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
let message = "\(multiplier) timers 2.5 is \(Double(multiplier) * 2.5)"

// Unicode
// 是一个国际标准，用于文本的编码和表示。
//Unicode标量是对应字符或者修饰符的唯一的21位数字。
// 字符串字面量的特殊字符
// 转义字符：\0 (空字符) \\ （反斜线） \t(水平制表符)  \n（换行符）  \r(回车符)  \"(双引号)   \'（单引号）
// Unicode标量：\u{n}，u为小写，其中n为任意一到八位十六进制数且可用的Unicode位码
let dollarSign = "\u{24}"   // $,Unicode标量U+0024
let blackHeart = "u{1F496}"   // Unicode标量U+1F496

// 可扩展的字形群集
// 每一个Character类型代表一个可扩展的字形群。一个可扩展的字形群是一个或多个可生成人类可读的字符Unicode标量的有序排列
let eAcute: Character = "\u{e9}"  // 这个字形群包含一个单一标量
let combinedEAcute: Character = "\u{65}\u{301}"  // 包含两个标量

// 可扩展的字符群集是一个灵活的方法，用许多复杂的脚本字符表示单一的Character值
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
// 可扩展的字符群集可以使用包围记号
let enclosedEAcute: Character = "\u{E9}\u{20DD}"

// 局部的指示符号的Unicode标量可以组合成一个单一的Character值
let regionallndicatorForUs: Character = "\u{1F1FA}\u{1F1F8}"

// 计算字符数量
let unusualMenagerie = "Koala🐨, Snail🐌, Penguin🐦, Dromedary🐫"
unusualMenagerie.characters.count

// 在Swift中，使用可扩展的字符群集作为Character值来连接或改变字符串时，并不一定会更改字符串的字符数量
var word = "cafe"
word.characters.count
word += "\u{301}"
word.characters.count

// 访问和修改字符串
// 可以通过字符串的属性和方法来访问和读取它，也可以用下标语法完成。
// 字符串索引：每一个Sring值都有一个关联的索引类型，String.index, 它对应着字符串中每一个Character的位置。 
// startIndex可以获取一个String的第一个Character的索引。
// endIndex可以获取最后一个Character的后一个位置的索引
// 调用String.index的predecessor()方法，可以立即得到前面一个索引，调用successor()方法可以立即得到后面一个索引。
// 调用advancedBy(_:)方法通过锁链作用来获取另一个索引。
// 如果尝试获取出界的字符串索引，就会抛出一个运行时的错误。
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
print(greeting)
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = greeting.startIndex.advancedBy(4)
greeting[index]
//greeting[greeting.endIndex]  // error

// 使用characters属性的indices属性会创建一个包含全部索引的范围（Range），用来在一个字符创中访问单个字符。
print(greeting.characters.indices)
for index in greeting.characters.indices {
    print("\(greeting[index])", terminator: " ")
}

// 插入和删除
// 调用insert(_:atlndex)方法可以在一个字符串的指定索引插入一个字符。
var welcome1 = "hello"
welcome1.insert("!", atIndex: welcome1.endIndex)

// 调用insertContentsOf(_:at)方法可以在一个字符串的指定索引插入一个字符串。
welcome1.insertContentsOf(" there".characters, at: welcome1.endIndex.predecessor())

// 调用removeAtIndex(_:)方法可以在一个字符串的指定索引删除一个字符。
welcome1.removeAtIndex(welcome1.endIndex.predecessor())
print("\(welcome1)")
// 调用removeRange(_:)方法可以在一个字符串的指定索引删除一个子字符串。
let range = welcome1.endIndex.advancedBy(-6)..<welcome1.endIndex
welcome1.removeRange(range)
print(welcome1)

// 比较字符串
// 字符串/字符相等
// 字符串/字符可以用等于操作符（==）和不等操作符（!=）
// 如果两个字符串（或两个字符）的可扩展的字形群集是标准相等的，那就认为他们是相等的。即使可扩展的字形群集是有不同的Unicode标量构成的，只要它们有同样的语言意义和外观，就认为他们标准相等。
// 英语中的A不等于俄语中的A

// 前缀/后缀相等
// 通过调用字符串的hasPrefix(_:)/hasSuffix(_:)方法来检查字符串是否拥有特定前缀/后缀。



