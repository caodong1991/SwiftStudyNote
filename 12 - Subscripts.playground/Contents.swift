//: Playground - noun: a place where people can play

import Cocoa

// 下标脚本：可以定义在类、结构体和枚举这些目标中，可以认为是访问集合，列表或序列的快捷方式，使用下标脚本的索引设置和获取值，不需要再调用实例的特定赋值和访问方法。
// 下标脚本语法
// 下标语法允许你通过实例后面的方括号中传入一个或多个的索引值来对实例进行访问和赋值。定义下标语法使用subscript关键字，显示声明入参（一个或多个）和返回类型，与实例方法不同的是下标脚本可以设定为读写或只读。
//subscript (index: Int) -> {
//    get {
//        // 返回与参数匹配的Int类型的值
//    }
//    set(newValue) {
//        // 执行赋值操作
//    }
//}

// 与只读属性一样，可以直接将原本应该写在get代码块中的代码写在subscript中：

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("3的6倍是\(threeTimesTable[6])")

// 下标脚本用法
// 如swift字典

// 下标脚本选项

struct Matrix {
    let rows: Int, columns: Int
    var grid:[Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row:Int, column: Int) -> Double {
        get {
            assert(indexValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}




























