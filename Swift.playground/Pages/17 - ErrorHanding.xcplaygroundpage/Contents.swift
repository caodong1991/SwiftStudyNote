import Foundation

// 错误处理
/*
 错误处理是响应错误以及从错误中恢复的过程。
 Swift在运行时提供了抛出、捕获、传递和操作可恢复错误的一等支持。
 某些操作无法保证总是执行完所有代码或生成有用的结果。
 可选类型用来表示值缺失，但是当某个操作失败时，理解造成失败的原因有助于代码作出相应的应对。
 */

// 表示与抛出错误
/*
 在Swift中，错误用遵循Error协议的类型的值来表示。
 这个空协议表明该类型可以用于错误处理。
 枚举类型尤为h适合构建一组相关的错误状态，枚举的关联值还可以提供错误状态的额外信息。
 */
enum VendingMachineError: Error {
    case invalidSelection // 选择无效
    case insufficientFunds(coinsNeeded: Int) // 金额不足
    case outOfStock // 缺货
}

/*
 抛出一个错误可以让你表明有意外情况发生，导致正常执行流程无法继续执行。
 抛出错误使用throw语句。
 */
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

// 处理错误
/*
 某个错误被抛出时，附近的某部分代码必须负责处理这个错误。
 Swift中有四种处理错误的方式。
 1. 可以把函数抛出的错误传递给调用此函数的代码。
 2. 用do-catch语句处理错误。
 3. 将错误作为可选类型处理。
 4. 或者断言此错误根本不会发生。
 
 当一个函数抛出一个错误时，程序流程会发生改变，所以重要的是能迅速识别代码中会抛出错误的地方。
 为了标识出这些地方，在调用一个能抛出错误的函数、方法、或者构造器之前，加上关键字try，或者try?或try!这种变体。
 Swift中的错误处理并不涉及解除调用栈，这是一个计算代价高昂的过程。
 throw语句的性能特性是可以和return语句相媲美的。
 */

// 用throwing函数传递错误
/*
 为了表示一个函数、方法、或者构造器可以抛出错误，在函数声明的参数之后加上throws关键字。
 一个标有throws关键字的函数被称为Throwing函数。
 如果这个函数指明了返回值类型，throws关键词需要写在返回箭头->的前面。
 
 func canThrowErrors() throws -> String
 func cannotThrowErrors() -> String
 
 一个throwing函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域。
 只有throwing函数可以传递错误。
 任何在某个非throwing函数内部抛出的错误只能在函数内部处理。
 */
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [ // 存货清单
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection // 抛出选择无效
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock // 抛出无货
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited) // 抛出支付价格不足
        }
        
        coinsDeposited -= item.price
        var newItem = item // 需要声明newItem原因是结构体是值类型，不是引用类型。
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispending\(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

/*
 方法传递它抛出的任何错误，在代码中调用此方法的地方，必须要么直接处理这些错误--使用do-catch语句、try?或try!；
 要么继续将这些错误传递下去。
 */
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

// 用Do-Catch处理错误
/*
 可以使用一个do-catch语句运行一段闭包代码来处理错误。
 如果从do子句中的代码抛出了一个错误，这个错误会和catch子句做匹配，从而决定哪条子句能处理它。
 
 do-catch语句的一般形式：
 do {
     try expression
     statements
 } catch pattern1 {
     statements
 } catch pattern2 where condition {
     statements
 } catch {
     statements
 }
 */
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

/*
 catch语句不必讲do子句中的代码所抛出的每一个可能的错误都作处理。
 如果所有catch子句都未处理错误，错误就会传递到周围的作用域。
 然而，错误还是必须要被某个周围的作用域处理的。
 在不会抛出错误的函数中，必须用do-catch语句处理错误。
 而能够抛出错误的函数，既可以使用do-catch语句处理，也可以让调用方来处理错误。
 如果错误传递到了顶层作用域却依然没有被处理，会得到一个运行时错误。
 */
func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}

// 将错误转换成可选值
/*
 可以使用try？通过将错误转换成一个可选值来处理错误。
 如果是在计算try?表达式时抛出错误，该表达式的结果为nil。
 */
/*
func someThrowingFunction() throws -> Int {
    // ...
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}
 
 func fetchData() -> Data? {
     if let data = try? fetchDataFromDisk() { return data }
     if let data = try? fetchDataFromServer() { return data }
     return nil
 }
*/

// 禁用错误传递
/*
 有时知道某个throwing函数实际上在运行时是不会抛出错误的，在这种情况下，可以在表达式前面写try!来禁用错误传递。
 这会把调用包装在一个不会有错误抛出的运行时断言中。
 如果真的抛出了错误，会得到一个运行时错误。
 */
/*
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
*/

// 指定清理操作
/*
 可以使用defer语句在即将离开当前代码块时执行一系列语句。该语句让你能够执行一些必要的清理工作。
 不管是以何种方式离开当前代码块的，无论是由于抛出错误而离开，或是由于诸如return、break的语句。
 defer语句将代码的执行延迟到当前的作用域退出之前。
 该语句由defer关键字和要被延迟执行的语句组成。延迟执行的语句不能包含任何控制转移语句，例如break、return语句，或是抛出一个错误。
 延迟执行的操作会按照它们声明的顺序从后往前执行，也就是说，第一条defer语句中的代码最后才执行，第二条defer语句中的代码倒数第二个执行，以此类推，最后一条语句会第一个执行。
 即使没有涉及到错误处理的代码，也可以使用defer语句。
 */

/*
func peocessFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // 处理文件
        }
        // close(file) 会在这里被调用，即作用域的最后。
    }
}
*/
