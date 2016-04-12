//: Playground - noun: a place where people can play

import Cocoa

// 函数的定义与调用
// 参数，返回类型，调用，实参。一个函数的实参必须与函数参数表里的参数的顺序一致。
func sayHello(personName: String) -> String {
    let greeting = "hello " + personName + "!"
    return greeting
}

print(sayHello("Rain"))

// 简化
func sayHelloAgain(personName: String) -> String {
    return "hello again," + personName + "!"
}

print(sayHelloAgain("Rain"))

// 函数的参数与返回值
// 无参函数
func sayHelloWorld() -> String {
    return "hello, world"
}

print(sayHelloWorld())

// 尽管这个函数没有参数，但是定义中在函数名后还是需要一对圆括号。当被调用时，也需要在函数名后写一对圆括号。当被调用时，也需要在函数名后写一对圆括号。

// 多参数函数
func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(personName)
    } else {
        return sayHello(personName)
    }
}

print(sayHello("Rain", alreadyGreeted: true))

// 无返回值函数
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}

sayGoodbye("Rain")
print(sayGoodbye("Rain"))
// 虽然没有定义返回值，但函数依然返回了值。没有定义返回类型的函数会返回特殊的值，叫Void。就是一个空的元组，没有任何元素，可以写成（）。

// 多重返回值函数
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value;
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax([9, -4, 7, 3, -9, 98])
print("min is \(bounds.0) and max id \(bounds.1)")

// 可选元组返回类型
func minMaxNil(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value;
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

minMaxNil([])

if let bounds = minMaxNil([9, -4, 7, 3, -9, 98]) {
    print("min is \(bounds.0) and max id \(bounds.1)")
}

// 函数参数名称
// 外部参数名，局部参数名
// 一般情况下，第一个参数省略其外部参数名，第二个以及随后的参数使用其局部参数名作为外部参数名。所有参数必须有独一无二的局部参数名。

// 指定外部参数名
// 在局部参数名前指定外部参数名，中间以空格分隔。
func sayHello(to person: String, and anotherPserson: String) -> String {
    return "Hello \(person) and \(anotherPserson)"
}
print(sayHello(to: "Bill", and: "Ted"))






















