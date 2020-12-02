import Foundation

// 字符串
// 字符串字面量（string Literals）
/*
 用于为常量和变量提供初始值。
 */
var someString = "Some string literal value"
/*
 多行字符串字面量
 */
let qutation = """
The white Rabbit put on his spectacles. "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the king said gravely, "and go on
till you come to the end; then stop."
"""
print(qutation)
/*
 若不想多行字符串字面量中出现换行字符的话，可以在行尾写一个反斜杠\作为续行符
 */
let softWarppedQutation = """
The white Rabbit put on his spectacles. "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the king said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWarppedQutation)

/*
 为了让一个多行字符串字面量开始和结束于换行符,请将换行写在第一行和最后一行
 */
let lineBreaks = """

This string starts with a line break.
It alse ends with a line break.

"""
print(lineBreaks)

/*
 一个多行字符串字面量能够缩进来匹配周围的代码。
 */
let linesWithIndentation = """
    This lint doesn't begin with whitespace.
        This line begins with four spaces.
    This lint doesn't begin with whitespace.
"""
print(linesWithIndentation)

/*
 字符串字面量的特殊字符
 转义字符
 \0 空字符
 \\ 反斜线
 \t 水平制表符
 \n 换行符
 \r 回车符
 \" 双引号
 \' 单引号
 Unicode标量 \u{n} n 为任意一到八位十六进制可用的Unicode位码
 */
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

/*
 由于多行字符字面量使用了三个双引号，所以可以直接使用双引号而不必加上转义符\, 要在多汗字符串字面中使用"""的话，就需要使用至少一个转义符\
 */
let threeDoubleQuotes = """
Escaping the first quote \"""
escaping all three quotes \"\"\"
"""
print(threeDoubleQuotes)
/*
 扩展字符串分割符
 将字符串文字放在扩展分割符中，这样字符串中的特殊字符将会直接包含而非转义后的结果。
 如果需要字符串中字符的特殊效果，请匹配转义字符\后面添加与起始位置个数相匹配的#符
 */
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes:"""
"""#
print(threeMoreDoubleQuotationMarks)

let oneLine = #"line1 \n line2"#
let oneLineMarks = #"line1 \#n line2"#
let threeLine = ###"line1 \n line2"###
let threeLineMarks = ###"line1 \###n line2"###
print(oneLine)
print(oneLineMarks)
print(threeLine)
print(threeLineMarks)

//初始化空字符串（lnitializing an Empty String）
/*
 要创建一个空字符串作为初始值，可以将空的字符串字面量赋值给变量，也可以初始化一个新的String实例
 */
var emptyString = ""  // 空字符串字面量
var anotherEmotyString = String()  // 初始化方法
/*
 通过检查Boolean类型的IsEmpty属性来判断改字符串是否为空：
 */
if emptyString.isEmpty {
    print("Nothing to see here")
}

// 字符串的可变性
/*
 可以通过一个特定字符串分配给一个变量来对其进行修改，或者分配一个常量来保证其不会被修改
 */
//
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"

// 字符串是值类型
/*
 创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。
 */


// 使用字符
/*
 可以通过for-in循环遍历字符串，获取字符串中每一个字符的值
 */
for character in "Dog!🐶" {
    print(character)
}

/*
 通过标明一个Character类型并使用字符字面量进行赋值，可以建立一个独立的字符常量或变量
 */
let exclamationMark: Character = "!"

/*
 字符串可以通过传递一个值类型为Character的数组作为自变量来初始化：
 */
let carCharacters: [Character] = ["C", "a", "t", "!", "🐶"]
let catString = String(carCharacters)

// 连接字符串和字符
/*
 字符串可以通过加法运算符（+）相加在一起（或称连接）创建一个新的字符串
 */
let string1 = "hello"
let string2 = " three"
var welcome = string1 + string2

/*
 也可以通过加法赋值运算符（+=）将一个字符串添加到一个已经存在字符串变量上
 */
var instruction = "look over"
instruction += string2

/*
 用append()方法将一个字符附加到一个字符串变量尾部
 */
let exclamationMark1: Character = "!"
welcome.append(exclamationMark1)
/*
 注意
 不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符。
 */

/*
 如果需要使用多行字面量来拼接字符串，并且你需要字符串每一行都以换行符结尾，包括最后一行
 */
let badStart = """
one
two
"""

let end = """
three
"""
print(badStart + end)

let goodStart = """
one
two

"""
print(goodStart + end)

// 字符串插值
/*
 是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。
 */
//
let multiplier = 3
let message = "\(multiplier) timers 2.5 is \(Double(multiplier) * 2.5)"

// Unicode
/*
 是一个国际标准，用于文本的编码、表示和处理。
 */

//Unicode标量
/*
 Unicode标量是对应字符或者修饰符的唯一的21位数字。
 */
print(dollarSign)
print(blackHeart)

// 可扩展的字形群集
/*
 每一个Character类型代表一个可扩展的字形群。一个可扩展的字形群构成了人类可读的单个字符，它是由一个或多个（当组合时）Unicode标量的序列组成
 */
let eAcute: Character = "\u{e9}"  // 这个字形群包含一个单一标量
let combinedEAcute: Character = "\u{65}\u{301}"  // 包含两个标量

/*
 可扩展的字符群集是一个将许多复杂的脚本字符表示单个字符值的灵活方式
 */
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

/*
 可扩展的字符群集可以使用包围记号
 */
let enclosedEAcute: Character = "\u{E9}\u{20DD}"

/*
 地域性的指示符号的Unicode标量可以组合成一个单一的Character值
 */
//
let regionallndicatorForUs: Character = "\u{1F1FA}\u{1F1F8}"

// 计算字符数量
let unusualMenagerie = "Koala🐨, Snail🐌, Penguin🐦, Dromedary🐫"
unusualMenagerie.count

/*
 在Swift中，使用可扩展的字符群集作为Character值来连接或改变字符串时，并不一定会更改字符串的字符数量
 */
//
var word = "cafe"
word.count
word += "\u{301}"
word.count

// 访问和修改字符串
/*
 可以通过字符串的属性和方法来访问和读取它，也可以用下标语法完成。
 字符串索引：每一个Sring值都有一个关联的索引类型，String.index, 它对应着字符串中每一个Character的位置。
 startIndex可以获取一个String的第一个Character的索引。
 endIndex可以获取最后一个Character的后一个位置的索引。
 调用String.index(before:)或者index(after:,)可以立即得到前面或后面一个索引。
 调用index(_:offsetBy:)方法来获取对应偏移量的索引。
 */
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

/*
 如果尝试获取出界的字符串索引，就会抛出一个运行时的错误。
 */
//greeting[greeting.endIndex]  // error

/*
 使用indices属性会创建一个包含全部索引的范围（Range），用来在一个字符创中访问单个字符。
 */
//
print(greeting.indices)
for index in greeting.indices {
    print("\(greeting[index])", terminator: " ")
}

// 插入和删除
/*
 调用insert(_:at:)方法可以在一个字符串的指定索引插入一个字符。
 */
var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)

/*
  调用insert(contentsOf:at:)方法可以在一个字符串的指定索引插入一个字符串。
 */
welcome1.insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex))

// 调用remove(at:)方法可以在一个字符串的指定索引删除一个字符。
welcome1.remove(at: welcome1.index(before: welcome1.endIndex))

/*
 调用removeSubrange(_:)方法可以在一个字符串的指定索引删除一个子字符串。
 */
let range = welcome1.index(welcome1.endIndex, offsetBy: -6)..<welcome1.endIndex
welcome1.removeSubrange(range)

// 子字符串
/*
 从字符串中获取一个字符串
 从下标或者prefix(_:)之类的方法就可以得到一个SubString的实例。
 */
let greeting1 = "Hello, world!"
let greetingIndex = greeting1.firstIndex(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<greetingIndex]

/*
 把结果转化为 String 以便长期存储
 */
let newString = String(beginning)

// 比较字符串
// 字符串/字符相等
/*
 字符串/字符可以用等于操作符（==）和不等操作符（!=）
 如果两个字符串（或两个字符）的可扩展的字形群集是标准相等的，那就认为他们是相等的。即使可扩展的字形群集是有不同的Unicode标量构成的，只要它们有同样的语言意义和外观，就认为他们标准相等。
 英语中的A不等于俄语中的A
 */

// 前缀/后缀相等
/*
 通过调用字符串的hasPrefix(_:)/hasSuffix(_:)方法来检查字符串是否拥有特定前缀/后缀。
 */


