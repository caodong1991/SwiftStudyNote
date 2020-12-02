import Foundation

// 扩展
/*
 扩展可以给一个现有的类、结构体、枚举，还有协议添加新的功能。
 它还拥有不需要访问被扩展类型源代码就能完成扩展的能力，即逆向建模。
 swift扩展没有名字，它可以：
 * 添加计算型实例和计算型类属性
 * 定义实例方法和类方法
 * 提供新的构造器
 * 定义下标
 * 定义和使用新的嵌套类型
 * 使已经存在的类型遵循一个协议
 扩展可以给一个类型添加新的功能，但是不能重写已经存在的功能。
 */



// 扩展的语法
/*
 使用extension关键字声明扩展
 extension SomeType {
     // 在这里给SomeType添加新的功能
 }
 
 扩展可以扩充一个现有的类型，给它添加一个或多个协议。协议名称的写法和类或者结构体一样。
 extension SomeType: SomeProtocol, AnotherProtocol {
     // 协议所需要的实现写在这里
 }
 
 扩展可以使用在现有的泛型类型上。
 还可以使用扩展给泛型类型有条件的添加功能。
 对一个现有的类型，如果定义了一个扩展来添加新的功能，那么这个类型的所有实例都可以使用这个新功能，包括那些在扩展定义之前就存在的实例。
 */

// 计算属性
/*
 扩展可以给现有的类型添加计算型属性和计算型类属性。
 扩展不能添加存储属性，或向现有的属性添加属性观察者。
 */
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0}
    var ft: Double { return self / 3.28084}
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

// 构造器
/*
 扩展可以给现有的类型添加新的构造器。
 使你可以把自定义类型作为参数来供其他类型的构造器使用，或者在类型的原始实现上添加额外的构造选项。
 如果使用扩展给一个值类型添加构造器只是用于给所有的存储属性提供一个默认值，并且没有定义任何自定义构造器，那么可以在该值类型扩展的构造器中使用默认构造器和成员构造器。
 如果把构造器写到了值类型的原始实现中，那么就不属于在扩展中添加构造器。
 如果使用扩展给另一个模块中定义的结构体添加构造器，那么新的构造器直接定义模块中使用一个构造器之前，不能访问self。
 */
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

/*
 如果通过扩展提供一个新的构造器，就要确保每个通过该构造器创建的实例都是初始化完整的。
 */
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// 方法
/*
 扩展可以给现有类型添加新的实例方法和类方法
 */
extension Int {
    func repetitions(task:() -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}

// 可变实例方法
/*
 通过扩展添加的实例方法同样也可以修改（或 mutating）实例本身。
 结构体和枚举的方法，若是可以修改self或者它自己的属性，则必须将这个实例方法标记mutating，就像是改变了方法的原始实现。
 */
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

// 下标
/*
 扩展可以给现有的类型添加新的下标。
 */
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase += 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
746381295[1]
746381295[2]
746381295[8]

// 嵌套类型
/*
 扩展可以给现有的类、结构体还有枚举添加新的嵌套类型。
 */
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
