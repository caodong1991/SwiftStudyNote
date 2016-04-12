//: Playground - noun: a place where people can play


import Cocoa

// 控制流
// for循环, swift提供两种for循环来按照指定的次数多次执行一系列语句。
// for in
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// index是一个每次循环遍历开始时被自动赋值的常量。这种情况下，index在使用前不需要声明，只需要将它包含在循环的声明中，就可以对其进行隐式声明，而无需使用let关键字声明。
// 如果不需要区间序列内每一项的值，可以使用下划线_替代变量名来忽略对值得访问。

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)

// 遍历数组
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

// 遍历字典
let numberOfLegs = ["spider":8, "ant":6, "cat":4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// for Swift3要废弃
//for var index = 0; index < 3; index++ {
//    print("index is \(index)")
//}
// 在初始化表达式中声明的常量和变量只在for循环的声明周期里有效。

// While循环
// 运行一系列语句直到条件变成false。这类循环适合使用在第一次迭代前迭代次数未知的情况下。
// while 循环从计算单一条件开始，如果条件为true，会重复运行一系列语句，直到条件变为false。

// Repeat-While 在判断循环条件之前，先执行一次循环的代码块，然后重复循环直到条件为false。

// 条件语句
// if语句最简单的形式就是只包含一个条件，当且仅当该条件为true时，才执行相关代码
var temperaturelnFahrenheit = 90
if temperaturelnFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperaturelnFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("it's not that cold. Wear a t-shirt.")
}
// Switch语句最简单的形式就是把某个值与一个或若干个相同类型的值作比较，由多个case构成。在某些不可能涵盖所有值得情况下，可以使用默认default分支来满足。
// 不存在隐式的贯穿，所以不需要再case分支中显示地使用break语句。
// 每一个case分支都是必须包含至少一条语句。一个case也可以包含多个模式，用逗号分开。
// 如果想要贯穿至特定的分支，可以使用fallthrough
let someCharacter: Character = "a"
switch someCharacter {
case "a":
    print("1111")
    print("22222")
case "b", "c":
    print("3333")
default:
    print("4444")
}

// 区间匹配
let approxinmateCount = 62
let countedthings = "Moon orbiting Saturn"
var naturakCount: String
switch approxinmateCount {
case 0:
    naturakCount = "no"
case 1..<5:
    naturakCount = "a few"
case 5..<12:
    naturakCount = "several"
case 12..<100:
    naturakCount = "dozens of"
case 100..<1000:
    naturakCount = "hunderds of"
default:
    naturakCount = "many"
}
print("There are \(naturakCount) \(countedthings)")

// 元组
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(\(somePoint.0), 0) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside the box")
}

// 值绑定
// case分支的模式允许将匹配的值绑定到一个临时的变量或常量，这种行为就叫值绑定。
let anotherPoint = (2, 0)
switch anotherPoint {
case(let x, 0):
    print("on the x-axis with an x value of \(x)")
case(0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// where 
// case分支的模式可以使用where语句来判断额外的条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y) is on the line x == y)")
case let (x, y) where x == -y:
    print("(\(x), \(y) is on the line x == -y)")
case let (x, y):
    print("(\(x), \(y) is just some arbitrary point)")
}

// 控制转移语句
// continue 语句告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。
let puzzlelnput = "greet minds think alike"
var puzzleputput = ""
for character in puzzlelnput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleputput.append(character)
    }
}
print(puzzleputput)

// break 会立即结束整个控制流的执行。
// 循环语句中的break，当在一个循环体中使用break时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号}后的第一行代码。不会本次循环迭代的代码被执行，也不会再有下次的循环迭代产生。
// Switch语句中的break，switch代码块中使用break时，会立即中断该switch代码块的执行，并且跳转到表示switch代码块结束的大括号}后的第一行代码。
let numberSymbol: Character = "三"
var possinleIntegerValue: Int?
switch numberSymbol {
case "1", "一":
    possinleIntegerValue = 1
case "2", "二":
    possinleIntegerValue = 2
case "3", "三":
    possinleIntegerValue = 3
default:
    break
}

if let integerValue = possinleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue))")
} else {
    print("An integer value could not be found for \(numberSymbol)")
}

// 贯穿 fallthroungh
// switch不存在隐式贯穿，所以要更加清晰和可预测，可以避免无意识地执行多个case分支从而引发的错误。
// 如果需要C风格的贯穿特性，则在每个需要该特性的case分支中使用fallthrough关键字。
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

// 带标签的语句
// 显示地指明break语句想要终止的是哪个循环体或者switch代码块
var i = 0
whileOne: while i < 10 {
    switch i {
    case 8:
        break whileOne
    default:
        i += 1
    }
}
print(i)

// 提前退出
// guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件必须为真时,以执行guard语句后的代码。不同于if语句，一个guard语句总是有一个else分句，如果条件不为真则执行else分句中的代码。

func checkup(person: [String: String!]) {
    // 检查身份证，如果没有带，则不能进入考场
    guard let idCard = person["idCard"] else {
        print("没有身份证，不能进入考场！")
        return
    }
    // 检查准考证，如果没有带，则不能进入考场
    guard let examNumber = person["examNumber"] else {
        print("没有准考证，不能进入考场！")
        return
    }
    print("您的身份证号为：\(idCard), 准考证为：\(examNumber)。请进入考场！")
}

checkup(["idCard":"123456"])
checkup(["examNumber":"4352"])
checkup(["idCard":"123456", "examNumber":"3453245"])

// 任何使用了可选绑定作为条件的一部分并被分配了值得变量或常量对于剩下的保护语句出现的代码段是可用的。如果条件不满足，else分支上的代码就会被执行。这个分支必须转移控制以退出guard语句出现的代码段。

// 检测API可用性
if #available(iOS 9, OSX 10.10, watchOS 2.0, *) {
    // 在iOS使用iOS9的API，在OS X 使用OS X v10.10的API
} else {
    // 使用先前版本的iOS和OS X的API
}

























