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


