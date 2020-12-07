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


// 高阶函数
// mao
/*
 对于原始集合里的每一个元素，以一个变换后的元素替换之形成一个新的集合
 */
let numbers = [1, 2, 4, 5, 10]
print(numbers.map { $0 * 10 })

// filter
/*
 对于原始集合里的每一个元素，通过判定来将其丢弃或者放进新集合
 */
print(numbers.filter { $0 > 4 })

// reduce
/*
 对于原始集合里的每一个元素，作用于当前累积的结果上
 */
print(numbers.reduce(100) { $0 + $1 })

// flatMap
/*
 对于元素是集合的集合，可以得到单级的集合
 */
let results = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let allResults = results.flatMap { $0.map { $0 * 10 } }
let passMarks = results.flatMap { $0.filter { $0 > 5 } }
print(allResults)
print(passMarks)

// compactMap
/*
 过滤空值
 */
let keys: [String?] = ["zhangsan", nil, "lisi", nil, "wangwu"]
let validNames = keys.compactMap { $0 }
print(validNames)
let counts = keys.compactMap { $0?.count }
print(counts)


// 高阶函数
// 范式转换
/*
 命令式编程风格常常迫使我们处于性能考虑, 把不同的任务交织起来，以便能够用一次循环来完成多个任务。
 在面向对象的命令式编程语言里，重用的单元是类和类之间沟通用的消息。
 而函数式编程用高阶函数把我们解放出来，让我们站在更高的抽象层次上去考虑问题，把问题看得更清楚。
 函数式语言提倡在有限的几种关键数据结构（如list, set, map）上运用针对这些数据结构高度优化过的操作，以此构成基本的运转机构。开发者再根据具体用途，插入自己的数据结构和高阶函数去调整机构的运转方式。
 简洁：面向对象编程通过封装不确定因素来使代码能被人理解，函数式编程通过尽量减少不确定因素来使代码能被人理解。
 */
/*
 读入一个文本文件，确定所有单词的使用频率并从高到低排序，打印出所有单词及其频率的排序列表
 */
let words = """
There are moments in life when you miss someone so much that you just want to pick them from your dreams and hug them for real Dream what you want to dream go where you want to go be what you want to be because you have only one life and one chance to do all the things you want to do
"""

let non_words: Set = ["the", "and", "of", "to", "a", "i", "it", "in", "or", "is", "as", "so", "but", "be"]

/*
 传统解决方案
 */
func wordFreq(words: String) -> [String: Int] {
    var wordDict: [String: Int] = [:]
    let wordList = words.split(separator: " ")
    for word in wordList {
        let lowerCaseWord = word.lowercased()
        if !non_words.contains(lowerCaseWord) {
            if let count = wordDict[lowerCaseWord] {
                wordDict[lowerCaseWord] = count + 1
            } else {
                wordDict[lowerCaseWord] = 1
            }
        }
    }
    return wordDict
}

print(wordFreq(words: words))

/*
 函数式
 */
func wordFreq2(words: String) -> [String: Int] {
    var wordDict: [String: Int] = [:]
    let wordList = words.split(separator: " ")
    // 全写形式
    /*
    wordList.map { (word) -> String in
        word.lowercased()
    }.filter { (word) -> Bool in
        !non_words.contains(word)
    }.forEach { (word) in
        wordDict[word] = (wordDict[word] ?? 0) + 1
    }
    */
    // 简写
    wordList.map { $0.lowercased() }.filter { !non_words.contains($0) }.forEach { wordDict[$0] = (wordDict[$0] ?? 0) + 1 }
    
    return wordDict
}

print(wordFreq2(words: words))

/*
 找到一个字符串里面某个字符数组里面第一个出现的字符的位置。
 比如“Hello, world”, ["a", "e", "i", "o", "u"], 那e是在字符串第一个出现的字符，位置是1，返回1
 */
let source = "Hello world"
let target: [Character] = ["a", "e", "i", "o", "u"]
zip(0..<source.count, source).forEach { (index, char) in
    if target.contains(char) {
        print(index)
    }
}

/*
 假设我们有一个名字列表，其中一些条目由单个字符构成。现在的任务是，将出去单字符条目之外的列表内容，放在一个逗号分隔的字符串里返回，且每个名字的首字母都要大写。
 */
let employee = ["neal", "s", "stu", "j", "rich", "bob", "aiden", "j", "ethan", "liam", "mason", "noah", "lucas", "jacob", "jack"]

/*
 命令式解法
 */
func cleanNames(names: Array<String>) -> String {
    var cleanNames = " "
    for name in names {
        if name.count > 1 {
            cleanNames += name.capitalized + ","
        }
    }
    cleanNames.remove(at: cleanNames.index(before: cleanNames.endIndex))
    return cleanNames
}

print(cleanNames(names: employee))

/*
 函数式解法
 */
let cleanedNames = employee.filter { $0.count > 1}.map { $0.capitalized }.joined(separator: ", ")
print(cleanedNames)

// Swift的劣势 - 并行
extension Array where Element: Any {
    func concurrentMap<T>(_ transform: (Element) -> T) -> [T] {
        let n = self.count
        if n == 0 {
            return []
        }
        var result = Array<T>()
        result.reserveCapacity(n)
        DispatchQueue.concurrentPerform(iterations: n) { (i) in
            result.append(transform(self[i]))
        }
        return result
    }
}

let result = employee.filter { $0.count > 1}.concurrentMap { $0.capitalized }.joined(separator: ", ")
print(result)

