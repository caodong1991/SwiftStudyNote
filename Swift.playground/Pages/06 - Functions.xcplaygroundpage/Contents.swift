import Foundation

//函数
/*
 函数是一段完成特定任务的独立代码片段。
 通过给函数命名来标识某个函数的功能，这个名字可以在被用来在需要的时候“调用”这个函数来完成它的任务。
 */
// 函数的定义与调用
/*
 参数：定义一个或多个有名字和类型的值，作为函数的输入。
 返回类型：定义某种类型的值作为函数执行结束时的输出。
 函数名：用来描述函数执行的任务。
 调用：使用一个函数的时候，用函数名来调用这个函数
 实参：调用函数时，传给它匹配的输入值。
 函数的实参必须与函数参数表里的参数的顺序一致。
 */
func greet(person: String) -> String {
    let greeting = "hello " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

// 简化函数定义
func greetAgain(person: String) -> String {
    return "hello again," + person + "!"
}

print(greetAgain(person: "Anna"))

// 函数的参数与返回值
// 无参函数
/*
 函数可以没有参数。尽管这个函数没有参数，但是定义中在函数名后还是需要一对圆括号。当被调用时，也需要在函数名后写一对圆括号。当被调用时，也需要在函数名后写一对圆括号。
 */
func sayHelloWorld() -> String {
    return "hello, world"
}

print(sayHelloWorld())

// 多参数函数
/*
 函数可以有多种输入参数，这些参数被包含在函数的括号之中，以逗号分隔。
 注意下面的函数和上面greet(person:)是不同的。虽然它们都有着相同的名字greet，但是greet(person:alreadyGreeted:)函数需要两个参数，而greet(person:)只需要一个参数。
 */
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))

// 无返回值函数
/*
 函数可以没有返回值。
 虽然没有定义返回值，但函数依然返回了值。没有明确定义返回类型的函数会返回特殊的值，叫Void。就是一个空的元组，没有任何元素，可以写成（）。
 */
func sayGoodbye(person: String) {
    print("Goodbye, \(person)!")
}

print(sayGoodbye(person: "Dave"))

/*
 调用函数时，可以忽略该函数的返回值。
 返回值可以被忽略，但定义有返回值的函数必须返回一个值。
 */
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// 多重返回值函数
/*
 用元组类型让多个值作为一个复合值从函数中返回
 */
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

let bounds = minMax(array: [9, -4, 7, 3, -9, 98])
print("min is \(bounds.0) and max id \(bounds.1)")
/*
 元组的成员不需要在元组从函数中返回时命名，因为它们的名字已经在函数返回类型中指定了。
 */
print("min is \(bounds.min) and max id \(bounds.max)")


// 可选元组返回类型
/*
 如果函数返回的元组类型有可能真个元组都没有值，可以使用可选的元组返回类型反映整个元组可以是nil的事实。
 可以通过元组类型的右括号后放置一个问号来定义一个可选元组，例如(Int, Int)? (String, Int, Bool)？
 * 可选元组类型如(Int, Int)?与元组包含可选类型如(Int?, Int?)是不同的。可选的元组类型，整个元组是可选的，而不只是元组中每个元素值。
 */
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

minMaxNil(array: [])

if let bounds = minMaxNil(array: [9, -4, 7, 3, -9, 98]) {
    print("min is \(bounds.0) and max id \(bounds.1)")
}

// 隐式返回的函数
/*
 如果一个函数的整个函数体是一个单行表达式，这个函数可以隐式地返回这个表达式。
 */
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))

// 函数参数标签和函数名称
/*
 每个函数参数都有一个参数标签以及一个参数名称。
 参数标签在调用函数的时候调用；调用的时候需要将函数的参数标签写在对应的参数前面。
 参数名称是在函数的实现中使用。
 默认情况下，函数参数使用参数名称来作为它们的参数标签。
 所有的参数都必须有一个独一无二的名字，虽然多个参数拥有同样的参数标签是可能的，但是一个唯一的函数标签能够使你的代码更具可读性。
 */
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}

someFunction(firstParameterName: 1, secondParameterName: 2)

// 指定参数标签
/*
 在参数名称之前指定它的参数标签，中间以空格分隔
 */
func someFunction(argumentLabel parameterName: Int) {
    
}

/*
 参数标签的使用能够让一个函数在调用时更有表达力，更类似自然语言，并且扔保持了函数内部的可读性以及清晰的意图。
 */
func greet(person: String, from hometown: String) ->String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

print(greet(person: "Bill", from: "Cupertino"))

// 忽略参数标签
/*
 如果不希望某个参数添加一个标签，可以使用一个下划线 _ 来代替一个明确的参数标签。
 如果一个参数有一个标签，那么在调用的时候必须使用标签来标记这个参数。
 */
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(1, secondParameterName: 2)

// 默认参数值
/*
 可以在函数体中通过给参数赋值来为任意一个参数定义默认值。
 当默认值被定义后，可调用这个函数时可以忽略这个参数。
 将不带有默认值的参数放在函数参数列表的最前面。
 */
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    
}

someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

// 可变参数
/*
 一个可变参数可以接受零个或多个值。
 函数调用时，可以用可变参数来指定函数参数可以被传入不确定数量的输入值。
 通过在变量类型名后面加入（...）的方式来定义可变参数。
 可变参数的传入值在函数体中变为此类型的一个数组
 注意，一个函数最多只能拥有一个可变参数。
 */
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.35, 18.75)

// 输入输出参数
/*
 函数参数默认是常量。
 如果想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数。
 定义一个输入输出参数时，在参数定义前加inout关键字。
 一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。
 只能传递变量给输入输出参数。不能传入常量或者字面量。
 当传入的参数作为输入输出参数时，需要在参数名前加&符，表示这个值可以被函数修改。
 输入输出参数不能有默认值，而且可变参数不能用inout标记。
 */

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// 函数类型
/*
 每个函数都有特定的函数类型，函数的类型由函数的参数类型和返回类型组成。
 */

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

/*
 上面两个函数的类型是(Int, Int) -> Int
 解读为：这个函数类型有两个Int型的参数并返回一个Int型的值
 */

func printHelloWorld() {
    print("Hello world!")
}

/*
 上面的函数类型是：（）-> Void
 没有参数并返回Void类型的函数
 */

// 使用函数类型
/*
 使用函数类型就像使用其他类型一样，可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它。
 */
var mathFunction:(Int, Int) -> Int = addTwoInts
/*
 上面代码可以解读为：定义一个叫做mathFunction的变量，类型是一个有两个Int型的参数，并返回一个int型的值的函数，并且让这个新变量指向addTwoints函数
 */

print("Result: \(mathFunction(2, 3))")

/*
 有相同匹配类型的不同函数可以被赋值给同一个变量
 */
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

/*
 当赋值一个函数给常量或变量时，让swift来推断其函数类型
 */
let anotherMathFunction = addTwoInts

// 函数类型作为参数类型
/*
 用函数类型作为另一个函数的参数类型，这样就可以将函数的一部分实现留给函数的调用者来提供。
 */
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

// 函数类型作为返回类型
/*
 用函数类型作为另一个函数的返回类型，在返回箭头->后写一个完整的函数类型。
 */
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

// 嵌套函数
/*
 上面都是全局函数，它们定义在全局域中。
 你也可以把函数定义在别的函数体中，称作嵌套函数。
 默认情况下，嵌套函数是对外界不可见的，但是可以被它们外围函数调用。
 一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用。
 */
func anotherChooseStepFunction(backward: Bool) -> (Int) -> Int {
    func anotherStepForward(input: Int) -> Int {
        return input + 1
    }
    func anotherStepBackward(input: Int) -> Int {
        return input - 1
    }
    return backward ? anotherStepBackward : anotherStepForward
}

var anotherCurrentValue = -4
let anotherMoveNearerToZero = anotherChooseStepFunction(backward: currentValue > 0)
print("Counting to zero:")
while anotherCurrentValue != 0 {
    print("\(anotherCurrentValue)")
    anotherCurrentValue = anotherMoveNearerToZero(anotherCurrentValue)
}
print("zero!")

