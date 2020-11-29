//: Playground - noun: a place where people can play

import Cocoa

// 常量与变量
/*
 常量和变量把一个名字和一个指定类型的值关联起来。常量的值一旦设定就不能改变，而变量的值可以随意更改
 声明：常量和变量必须在使用前声明，用let来声明常量，用var来声明变量。
 */
let maxmumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

/*
 可在一行声明多个常量或多个变量
 */
var x = 0.0, y = 0.0, z = 0.0

// 类型注解/类型标注
/*
 当声明变量或常量的时候可以加上类型注解（type annotation）, 说明常量或变量中药存储的值的类型。如果要添加类型注解，需要在常量或者变量名后面加上冒号和空格，然后加上类型名称。
 */
var welcomeMessage: String
welcomeMessage = "hello world"

/*
 在一行中定义多个同样类型的变量，用逗号分割，并在最后一个变量名之后添加类型标注
 */
var red, green, blue: Double

// 常量和变量的命名
/*
 命名的名字几乎可以使用任何字符，甚至包括Unicode字符。
 名字不能包含空白字符、数学符号，箭头、保留的（或者无效的）Unicode码位、连线和制表符。也不能以数字开头。
 */


let π = 3.14159
let 你好 = "你好"
let 🐶🐮 = "dogcow"


/*
  如果需要使用与Swift保留关键字相同的名称作为常量或者变量名.
  可以使用反引号 ` 将关键字包围的方式将其作为名字使用。无论如何，应当避免使用关键字作为变量或变量名.
 */

var `var`:String = "word"

/*
 可以更改现有的变量值为其他同类型的值
 */

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

/*
 常量的值一旦被确定就不能更改了。尝试这样做会导致编译时报错
 */


let languageName = "Swift"
//languageName = "Swift++"

// 输出常量和变量
/*
 print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)函数来输出当前常量或变量的值
 */
//

print(welcomeMessage, separator: " ", terminator: "")
print(welcomeMessage)

/*
 Swift用字符串插值的方式把常量名或者变量名当做占位符加入到长字符串中，Swift会用当前常量或变量的值替换这些占位符。将常量或变量名放入圆括号中，并在开括号前使用反斜杠将其转义
 */


print("The current value of friendlyWelcome is \(welcomeMessage)")
print("x = \(x), y = \(y), z = \(z)")


print(π)

// 注释

// 单行注释

/* 这是一个
  多行注释*/


/* 这是第一个多行注释的开头
  // 单行注释
/*这是第二个被嵌套的多行注释*/
这是第一个多行注释的结尾*/


// 分号
/*
 Swift不强制要求在每条语句的结尾处使用分号;
 有一种情况下必须要用分号，即同一行内写多条独立的语句;
 */


let cat = "🐱"; print(cat)

// 整数

/*
 就是没有小数部分的数字。整数可以是有符号(正、负、零)或者无符号(正、零)。
 swift提供了8，16，32，64的有符号和无符号整数类型。
 */

// 整数范围
/*
 Int 长度与当前平台的原生字长相同。在32位平台上，Int 和 Int32 长度相同。在64位平台上，Int 和 Int64 长度相同
 UInt 长度与当前平台的原生字长相同.
 */

let minValue = UInt8.min
let maxValue = UInt8.max

//
//

// 浮点数
/*
 Double 64位浮点数，至少有15位数字。
 Float 32位浮点数，至少有6位数字。
 */

// 类型安全与推断 （type safe , type inference）

// 数值型字面量
/*
 * 整数字面量可以被写作
 * 十进制，前面没有前缀
 * 二进制，前缀是0b
 * 八进制，前缀是0o
 * 十六进制，前缀是0x
 */

/*
 浮点型字面量可以使十进制或者是十六进制。
 */
let decimalInteger = 17
let binaryInteger = 0b10001      // 二进制的17
let octallnteger = 0o21          // 八进制的17
let hexadecimakkInteger = 0x11   // 十六进制的17

/*

 十进制浮点数也可以有一个可选的指数，通过大写或小写的e来指定；
 十六进制浮点数必须有一个指数，通过大写或小写的p来指定
 */
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexaDecimalDouble = 0xC.3p0

/*
 数值类字面量可以包括额外的格式来增强可读性。
 整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量。
 */
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// 数值型类型转换
// 整数转换
/*
 * Int8 -128~127
 * UInt8 0~255
 */
/*
 数字超出了常量或者变量存储的范围，编译器就会报错
 */
//let cannotBeNegation: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// 整数和浮点数转换
/*
 转换时，浮点型b会被截断
 */
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)

// 类型别名 type aliascs
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// 布尔值 Boolean true false
let orangesAreOrange = true
let tumipsAreDelicious = false

// 元组
// 元组把多个值组合成一个复合值。元组内的值可以使任意类型。
let http404Error = (404, "Not Found")
// http404Error的类型是（Int, String）,值是（404， “Not Found”）

// 元组内容分解
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
// 如果只需要一部分元组值，分解的时候可以把要忽略的部分用下划线_标记
let (justTheStatusCode,_) = http404Error
print("The status code is \(justTheStatusCode)")
// 此外，还可通过下标来访问元组中的单个元素，下标从0开始
print("The status code is \(http404Error.0)")
// 可以在定义元组的时候给单个元素命名
let http200Status = (statusCode: 200, description: "OK")
// 给元组中的元素命名后，可以通过名字来获取这些元素的值
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

// 可选类型(optionals)
/*
 处理值可能缺失的情况。可选类型表示两种可能：或者有值，你可以解析可选类型访问这个值，或者根本没有值。
 */
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

// nil
/*
 nil不可能用于非可选的常量和变量，如果代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型
 */
var serverResponseCode: Int? = 404
serverResponseCode = nil
var surveyAnswer: String?

// if语句以及强制解析
if convertedNumber != nil {
    print("converedNumber contains some integer value.")
}
/*
 确定可选类型包含值，可以再可选值后面加一个感叹号（!）来获取值。这个惊叹号表示我知道这个可选有值，请使用它。这被称为可选值的强制解析。
 */
if convertedNumber != nil {
    print("converedNumber contains some integer value of \(convertedNumber!).")
}

// 可选绑定
/*
 判断可选类型是否包含值，如果包含就把值赋给一个临时常量或变量。可选绑定可以用在if和while语句中。
 */
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)' could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// 在if里使用的where是对语句进行一个约束。可以理解为一个嵌套的语句
// 使用where语句必须满足以下几点：
// 1.被赋的值无论你使用的在之前有没有声明过，跟在if后使用的话必须要重新声明（可以不声明类型只声明变量还是常量）。
// 2.(a)必须是可选类型，并且在赋值的时，必须是声明过可选类型，如果直接使用a = 1或a = "a"，将报错.
// 3.if里只能用于赋值，不能用于比较大小。

func findStockCode(Company: String) -> String? {
    if (Company == "Apple") {
        return "AAPL"
    } else if (Company == "Google") {
        return "GOOD"
    } else {
        return nil
    }
}

var stockCode: String? = findStockCode(Company: "Facebook")
let text = "Stock Code -"
if stockCode != nil {
    let message = text + stockCode!
    print(message)
}

// 隐式解析可选类型
/*
 可以确定一个可选类型总会有值，这种类型的可选状态被定义为隐式解析可选类型
 用作可选的类型的后面的问好改成感叹号（String!）来声明一个隐式解析可选类型
 如果一个变量之后可能变为nil，就不要使用隐式解析可选类型
 如果需要在变量的声明周期中判断是否是nil的话，使用普通可选类型
 */
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!  // 需要感叹号来获取值

let assumedString: String! = "an implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号

/*
 仍可以把隐式解析可选类型当做普通可选类型来判断它是都包含值
 */
if assumedString != nil {
    print(assumedString!)
}

/*
 在可选绑定中使用隐式解析可选类型来检查并解析它的值
 */
if let definiteString = assumedString {
    print(definiteString)
}

// 错误处理 （error handing）
// 来应对程序执行中可能会遇到的错误条件。
/*
 一个函数可以通过在声明中添加throws关键词来抛出错误信息。
 当你的函数能抛出错误信息时，你应该在表达式中前置try关键词
 */
func canThrowAnError() throws {
    // 这个函数有可能抛出错误
}

/*
 一个do语句创建了一个新的包含作用域，使得错误能被传播到一个或多个catch从句。
 */
do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}

// 断言和先决条件
/*
 断言是先决条件是在运行时所做的检查。
 可以用来检查后续代码之前是否一个必要条件已经满足了。
 如果断言或先决条件中的布尔条件评估的结果为true，则代码像往常一样继续执行。
 如果布尔条件评估结果为false，程序的当前状态是无效的，则代码执行结束，应用程序中止。
 不同点：
 断言仅在调试环境运行，再生产环境中，断言的条件将不会进行评估
 先决条件在调试环境和生产环境中运行
 */
// 使用断言进行调试
let age = -3
//assert(age >= 0, "A person's age connot be less than zero")

//if age > 10 {
//    print("You can ride the roller-coaster or the ferris wheel.")
//} else if age > 0 {
//    print("you can ride the ferris wheel.")
//} else {
//    assertionFailure("A person's age connot be less than zero")
//}

// 强制执行先决条件
/*
 当一个条件可能为假，但是继续执行代码要求条件必为真的时候，需要使用先决条件。
 */
precondition(age > 0, "You can ride the roller-coaster or the ferris wheel.")
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("you can ride the ferris wheel.")
} else {
    preconditionFailure("A person's age connot be less than zero")
}
