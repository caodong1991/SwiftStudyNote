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































