//: Playground - noun: a place where people can play

import Cocoa

// 闭包

// 闭包表达式：一种利用简洁语法构建内联闭包的方式
// sort方法
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

var reversed = names.sort(backwards)

// 闭包表达式语法
reversed = names.sort({(s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 闭包表达式语法可以使用常量，变量和inout类型作为参数，不能提供默认值。也可以在参数列表的最后使用可变参数。元组也可以作为参数和返回值。
// 闭包的函数体部分由关键字in引入。该关键字表示闭包的参数和返回类型定义已经完成。

reversed = names.sort({(s1: String, s2: String) -> Bool in return s1 > s2}) // 由于这个闭包的函数体部分如此短，以至于可以将其改写成一行代码。

// 根据上下文推断类型
reversed = names.sort({s1, s2 in return s1 > s2})

//单表达式闭包隐式返回
reversed = names.sort({s1, s2 in s1 > s2})

// 参数名称缩写
// Swift自动为内联闭包函数提供了参数名称缩写功能，可以直接通过$0, $1, $2来顺序调用闭包的函数。如果在闭包表达式中使用参数名称缩写，您可以在闭包函数列表中省略对其的定义，并且对应参数名称缩写的类型会通过函数类型进行推断。in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成。
reversed = names.sort({$0 > $1}) // $0和$1表示闭包中第一个或第二个String类型的参数。

// 运算符函数
reversed = names.sort(>)

// 尾随闭包：是一个书写在函数括号之后的闭包表达式，函数支持将其作为一个参数调用。
reversed = names.sort() {$0 > $1}
// 如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把（）省略掉。
reversed = names.sort{$1 > $1}
// 当闭包非常长以至于不能再一行中进行书写时，尾随闭包变得非常有用。
let digitNames = [0:"Zero", 1:"Two", 2:"Three", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"]
let numbers = [16, 58, 510]
let strings = numbers.map { (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output;
}

// 捕获值
// 闭包可以在其被定义的上下文中捕获常量或变量。

func makeIncrementor(forIncrement amount : Int) -> () -> Int {
    var runningTotal = 0
    print(runningTotal)
    func incrementor() -> Int {
        runningTotal += amount
        print(runningTotal)
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()

// 非逃逸闭包
func someFunctionWithNoescapeClosure(@noescape closure:() -> Void) {
    closure()
}

var completionHandlers:[() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler:() -> Void) {
    completionHandlers.append(completionHandler)
}

class SomeClass {
    var x = 10
    func doSomeing() {
        someFunctionWithEscapingClosure() {self.x = 100}
        someFunctionWithNoescapeClosure() {x = 200}
    }
}

let instance = SomeClass()

instance.doSomeing()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// 自动闭包：是自动创建的闭包，用于包装传递给函数作为参数的表达式
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)





