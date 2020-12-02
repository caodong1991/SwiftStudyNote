import Foundation

// 下标
/*
 可以定义在类、结构体和枚举中，是访问集合，列表或序列中元素的快捷方式。
 使用下标的索引，设置和获取值，不需要再调用实例的特定赋值和访问方法。
 */

// 下标语法
/*
 下标允许你通过实例后面的方括号中传入一个或多个的索引值来对实例进行访问和赋值。
 它的语法类似于实例方法语法和计算型属性语法。
 定义下标语法使用subscript关键字，与定义实例方法类似，都是指定一个或多个输入参数和一个返回类型。
 与实例方法不同的是，下标可以设定为读写或只读。
 */
//subscript (index: Int) -> {
//    get {
//        // 返回与参数匹配的Int类型的值
//    }
//    set(newValue) {
//        // 执行赋值操作
//    }
//}

/*
 与只读属性一样，对于只读下标的声明，可以直接通过省略get关键字和对应的大括号组来进行简写。
 */
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("3的6倍是\(threeTimesTable[6])")

// 下标用法
/*
 下标的确切含义取决于使用场景。
 下标通常作为访问集合，列表或序列中元素的快捷方式。
 如swift字典
 */
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

// 下标选项
/*
 下标可以接受任意数量的入参，并且这些入参可以使任意类型。
 下标的返回值也可以是任意类型。
 下标可以使用可变参数，但是不能使用in-out参数以及不能提供默认参数。
 一个类或结构体可以根据自身需要提供多个下标实现，使用下标时将通过入参的数量和类型进行区分，自动匹配合适的下标。下标的重载
 */
struct Matrix {
    let rows: Int, columns: Int
    var grid:[Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row:Int, column: Int) -> Double {
        get {
            assert(indexValidForRow(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexValidForRow(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

// 类型下标
/*
 类型下标时定义一种在类型自身上的一种下标。
 通过在subscript关键词之前写下static关键字的方式来表示一个类型下标。
 类类型可以使用class关键字代替static，它允许子类重写父类中对那个下标的实现。
 */
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)



























