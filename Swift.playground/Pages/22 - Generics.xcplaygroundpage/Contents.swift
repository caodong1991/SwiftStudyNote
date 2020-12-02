import Foundation

// 泛型
/*
 泛型代码让你能根据自定义的需求，编写出适用于任意类型的、灵活可复用的函数及类型。
 可避免编写重复的代码，而是用一种清晰抽象的方式来表达代码的意图。
 */

// 泛型解决的问题
/*
 标准的非泛型函数
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporary = a
    a = b
    b = temporary
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// 泛型函数
/*
 泛型函数可以用于任何类型。
 泛型版本的函数使用占位符类型名（这里叫做T），而不是实际类型名，占位符类型名并不关心T具体的类型。
 用尖括号括起来（<T>），这个尖括号告诉Swift那个T是函数定义内的一个占位类型名，因此Swift不会去查找名为T的实际类型。
 */
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someString is now \(someString), and anotherString is now \(anotherString)")

// 类型参数
/*
 上面swapTwoValues(_:_:)例子中，占位类型T是一个类型参数的的例子。
 类型参数指定并命名一个占位类型，并且紧随在函数名后面，使用一对尖括号括起来。
 一旦一个类型参数被指定，你可以用它函数的参数类型或者作为返回函数的返回类型。
 可以提供多个类型参数，将它们写在尖括号中，用逗号分开。
 */

// 命名类型参数
/*
 大多情况下，类型参数具有有描述性的名字，例如字典中的key和value及数组中的Element。
 这能告诉阅读代码的人，参数类型和泛型类型或函数之间的关系。
 之间没有关系时，按惯例用单个字母来表示。
 类型形式参数大写开头的驼峰命名法命名，指明它们是一个类型的占位符，不是一个值。
 */

// 泛型类型
/*
 除了泛型函数，Swift还允许自定义泛型类型。
 这些自定义类、结构体和枚举可以适用于任意类型，类似于Array和Dictionary。
 */
/*
 非泛型版本的栈
 */
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast();
    }
}

/*
 泛型版本的栈
 */
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>();
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
let fromTheTop = stackOfStrings.pop()

// 泛型拓展
/*
 当对泛型类型进行扩展时，并不需要提供类型参数列表作为定义的一部分。
 原始类型定义中声明的类型参数列表在扩展中可以直接适用，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。
 泛型类型的拓展，还可以包括类型扩展需要额外满足的条件，从而对类型添加新的功能。
 */
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem)")
}

// 类型约束
/*
 如果能对泛型函数或泛型类型中添加特定的类型约束，这将在某些情况下非常有用。
 类型约束指定类型参数必须继承自指定类、遵循特定的协议或协议组合。
 当自定义泛型类型时，可以定义自己的类型约束，这些约束将提供更为强大的泛型编程能力。
 */

// 类型约束语法
/*
 在一个类型参数名后面放置一个类名或者协议名，并且用冒号进行分隔，来定义类型约束。
 func someFuncation<T: SomeClass, U:SomeProtocol>(someT: T, someU: U) {

 }
 */

// 类型约束的实践
/*
 非泛型版本
 */
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let Strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: Strings) {
    print("The index of llama is \(foundIndex)")
}

/*
 泛型版本
 Swift标准库中定义了一个 Equatable协议，该协议要求任何遵循该协议的类型必须实现等式符（==）及不等符（!=），
 从而能对该类型的任意两个值进行比较。所有的 Swift 标准类型自动支持 Equatable 协议。
 */
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

// 关联类型
/*
 定义一个协议时，声明一个或多个关联类型作为协议定义的一部分将会非常有用。
 关联类型为协议中某个类提供了一个占位符名称，其代表的实际类型在协议被遵循时才会被指定。
 关联类型通过associatedtype关键字来指定。
 */

// 关联类型实践
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct AnotherIntStack: Container {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct AnotherStack<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i];
    }
}

// 扩展现有类型来指定关联类型
extension Array: Container {}

// 给关联类型添加约束
/*
 可以在协议里给关联类型添加约束要求遵循的类型满足约束。
 */
protocol AnotherContainer {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

// 在关联类型约束里使用协议
/*
 协议可以作为它自身的要求出现。
 */
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension AnotherStack: SuffixableContainer {
    func suffix(_ size: Int) -> AnotherStack {
        var result = AnotherStack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}

var stackOfInts = AnotherStack<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)

// 泛型Where语句
/*
 类型约束可以能够为泛型函数、下标、类型的类型参数定义一些强制要求。
 对关联类型添加约束通常是非常有用的。
 你可以通过定义一个泛型where子句来实现。
 通过泛型where子句让关联类型遵从某个特定的协议，以及某个特定的类型参数和关联类型必须类型相同。
 你可以通过将where关键字紧跟在类型参数列表后面来定义where子句，where 子句后跟一个或者多个针对关联类型的约束，以及一个或多个类型参数和关联类型间的相等关系。
 你可以在函数体或者类型的大括号之前添加where子句。
 */
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    // 检查两个容器含有相同数量的元素
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    // 检查每一对元素是否想等
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    // 所有元素匹配，返回true
    return true
}

var anotherStackOfStrings = AnotherStack<String>()
anotherStackOfStrings.push("uno")
anotherStackOfStrings.push("dos")
anotherStackOfStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(anotherStackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}

// 具有泛型where子句的扩展
/*
 你也可以使用泛型 where 子句作为扩展的一部分。
 */
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if stackOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}

/*
 你可以使用泛型 where 子句去扩展一个协议。
 */
extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

if [9, 9, 9].startsWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
print([1260.0, 1200.0, 98.6, 37.0].average())

// 具有泛型where子句的关联类型
/*
 你可以在关联类型后面加上具有泛型 where 的字句。
 */
protocol ContainerOther {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }

    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

/*
 一个协议继承了另一个协议，你通过在协议声明的时候，包含泛型 where 子句，来添加了一个约束到被继承协议的关联类型。
 */
protocol ComparableContainer: Container where Item: Comparable { }

// 泛型下标
/*
 下标可以使泛型，它们能够包含泛型where子句。
 */
extension AnotherContainer {
    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}


