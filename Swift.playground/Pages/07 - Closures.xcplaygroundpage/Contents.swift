import Foundation

// 闭包
/*
 闭包是包含函数代码块，可以在代码中被传递和使用。
 闭包可以捕获和存储所在上下文中任意常量和变量的引用。被称为包裹常量和变量。
 */
/*
 在函数章节中介绍的全局和嵌套函数实际上也是特殊的闭包，闭包采用以下三种形式之一：
 1. 全局函数是一个有名字但不会捕获任何值的闭包。
 2. 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包。
 3. 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包。
 */
/*
 Swift闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：
 1. 利用上下文推断参数和返回值类型
 2. 隐式返回单表达式闭包，即单表达式闭包可以省略return关键字
 3. 参数名称缩写
 4. 尾随闭包语法
 */

// 闭包表达式语法
/*
 闭包表达式是一种利用简洁语法构建内联闭包的方式
 */

// 排序方法
/*
 swift标准库提供了名为sorted(by:)的方法，会基于你提供的排序闭包表达式的判断结果对数组中的值进行排序。
 一旦完成排序过程，方法会返回一个与旧数组类型大小相同类型的新数组，该数组的元素有这正确的排序顺序。
 原数组不会被排序方法修改。
 */
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

/*
 sorted(by:)方法接受一个闭包，该闭包函数需要传入与数组元素类型相同的两个值，并返回一个布尔类型值来表明当排序结束后传入的第一个参数排在第二个参数前面还是后面。
 如果第一个参数值出现在第二个参数值前面，排序闭包函数需要返回true，反之返回false。
 在内联闭包表达式中，函数和返回值类型都写在大括号内，而不是大括号外。
 闭包函数体部分由关键字in引入。该关键字表示闭包的参数和返回类型定义已经完成，闭包函数体即将开始。
 */
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backwards)

// 闭包表达式语法
/*
 闭包表达式的一般形式
 闭包表达式参数可以是输入输出参数（in-out），但不能设定默认值。
 如果命名了可变参数，也可以使用此可变参数，也可以使用此可变参数。
 元组也可以作为参数和返回值。
 */
/*
 { (parameters) -> return type in
     statements
 }
 */

/*
 上面的写法过于繁琐，闭包表达式版本。
 */
reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})

/*
 由于这个闭包的函数体部分如此短，以至于可以将其改写成一行代码。
 一对圆括号仍然包裹住了方法的整个参数。然而，参数现在变成了内联闭包
 
 */
reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2}) //

// 根据上下文推断类型
/*
 因为排序闭包函数是作为sorted(by:)方法的参数传入的，Swift可以推断其参数和返回值的类型。
 sorted(by:)方法被一个字符串数组调用，因此其参数必须是(String, String) -> Bool类型的函数。
 意味着(String, String)和Bool类型并不需要作为闭包表达是定义的一部分。
 因为所有的类型都可以被正确推断，返回箭头->和围绕在参数周围的括号也可以被省略。
 实际上。通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包的参数和返回值类型。所以不需要利用完整格式构造内联闭包。
 但是，完整格式的闭包能够提高代码的可读性。
 */
reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})

//单表达式闭包隐式返回
/*
 单行表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果
 */
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})

// 参数名称缩写
/*
 Swift自动为内联闭包函数提供了参数名称缩写功能，可以直接通过$0, $1, $2来顺序调用闭包的函数。
 如果在闭包表达式中使用参数名称缩写，您可以在闭包函数列表中省略对其的定义，并且对应参数名称缩写的类型会通过函数类型进行推断。
 in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成。
 */
//
reversedNames = names.sorted(by: { $0 > $1 }) // $0和$1表示闭包中第一个或第二个String类型的参数。

// 运算符函数
/*
 还有一种更简短的方式来编写上面例子中的闭包表达式。
 swift的String类型定义了关于大于号>的字符串实现，其作为一个函数接受两个String类型的参数并返回Bool类型的值。
 而这正好与sorted(by:)方法的参数需要的函数类型相符合。
 */
reversedNames = names.sorted(by: >)

// 尾随闭包
/*
 如果需要将一个很长的闭包表达式作为最后一个参数传递给函数，将这个闭包替换成为尾随闭包的形式很有用。
 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为一个参数调用。
 在使用尾随闭包时，不用写出它的参数标签。
 */
func someFunctionThatTakesAClousure(closure: () -> Void) {
    // 函数体部分
}

/*
 以下是不使用尾随闭包进行函数调用
 */
someFunctionThatTakesAClousure(closure: {
    
})

/*
 以下是使用尾随闭包进行函数调用
 */
someFunctionThatTakesAClousure () {
    
}

/*
 排序使用尾随闭包的形式
 */
reversedNames = names.sorted() { $0 > $1 }

/*
 如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把（）省略掉。
 */
reversedNames = names.sorted{ $0 > $1 }

/*
 当闭包非常长以至于不能再一行中进行书写时，尾随闭包变得非常有用。
 */

let digitNames = [0:"Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"]
let numbers = [16, 58, 510]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output;
}

// 捕获值
/*
 闭包可以在其被定义的上下文中捕获常量或变量。
 即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
 */

/*
 可以捕获值的闭包最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。
 嵌套函数可以捕获其外部q函数所有的参数以及定义的常量和变量。
 为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift可能会改为捕获并保存一份对值的拷贝。
 swift也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量
 */
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
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
incrementByTen()

/*
 如果创建了另一个Incrementer, 它会有自己的引用，指向一个全新、独立的runningTotal变量。
 */
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()

/*
 再次调用原来的incrementByTen会继续增加它自己的runningTotal变量，该变量和incrementBySeven中捕获的变量没有任何联系
 */
incrementByTen()

// 闭包是引用类型
/*
 无论将函数或闭包赋值给一个常量还是变量，实际上都是将常量或变量的值设置为对应函数或闭包的引用。
 如果将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包。
 */
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// 逃逸闭包
/*
 当一个闭包作为参数传递到一个函数中，但是这个闭包在函数返回之后才被执行，这就被称为该闭包从函数中逃逸。
 当定义接收闭包作为参数的函数时，可以在参数名之前标注@escaping，用来指明这个闭包是允许"逃逸"出这个函数的。
 */
/*
 一种能使闭包逃逸出函数的方法是将这个闭包保存在一个函数外部定义的变量中。
 */
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoescapeClosure(closure:() -> Void) {
    closure()
}

/*
将一个闭包标记为@escaping意味着必须在比包中显示的引用self。
*/
class SomeClass {
    var x = 10
    func doSomeing() {
        someFunctionWithEscapingClosure() {self.x = 100}
        someFunctionWithNoescapeClosure() {x = 200}
    }
}

let instance = SomeClass()

instance.doSomeing()
print(instance.x) // 200

completionHandlers.first?()
print(instance.x) // 100

// 自动闭包
/*
 自动闭包是自动创建的闭包，用于包装传递给函数作为参数的表达式。
 这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。
 这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。
 */

/*
 自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。
 */
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count) // 5

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count) // 5

print("Now serving \(customerProvider())!")
print(customersInLine.count) // 4

/*
 将闭包作为参数传递给函数时，能获得同样的延迟求值行为
 */
func serve(customer customerProvider: () -> String) {
    print("Now sering \(customerProvider())!")
}

serve(customer: { customersInLine.remove(at: 0) })

/*
 上面的serve(customer:)函数用来接受一个返回顾客名字的显式闭包。
 下面的serve(customer:)完成了相同操作，不过它并没有接受一个显式的闭包，而是通过将参数标记为@autoclosure来接受一个闭包。这样参数将自动转化为一个闭包。
 过度使用autoclosure会让代码变得难以理解。
 */
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now sering \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))

/*
 如果想让一个自动闭包可以逃逸，则应该同时使用@escaping和@autoclosure属性。
 */
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("now serving \(customerProvider())!")
}



