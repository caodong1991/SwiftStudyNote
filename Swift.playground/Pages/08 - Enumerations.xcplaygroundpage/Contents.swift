import Foundation

// 枚举
/*
 枚举作为一组相关的值定义了一个共同的类型，可以在代码中以类型安全的方式来使用这些值。
 不必给每一个枚举成员提供一个值。如果给枚举成员提供一个值（称为原始值），则该值的类型可以使字符串、字符、或是一个整型值或浮点数。
 枚举成员可以指定任意类型的关联值存储到枚举成员中。可以在枚举中定义一组相关的枚举成员，每一个枚举成员都可以有适当类型的关联值。
 */

// 枚举语法
/*
 使用enum关键词来创建枚举并且把它们的整个定义放在一对大括号内。
 */
enum SomeEnumeration {
    // 枚举定义放在这里
}

/*
 枚举中定义的值是这个枚举的成员值（或成员）。
 使用case关键字来定义一个新的枚举成员值。
 与OC不同，枚举成员在被创建的时候不会被赋予一个默认的整型值。
 */
enum CompassPoint {
    case north
    case south
    case east
    case west
}

/*
 多个成员值可以出现在同一行上，用逗号隔开。
 */
enum Plant {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

/*
 每个枚举定义了一个全新的类型。枚举名以一个大写字母开头。给枚举类型q起一个单数名字而不是复数名字。
 directionToHead的类型可以在它被CompassPoint的某个值初始化时推断出来。
 一旦被声明为具体的类型，可以使用更简短的点语法。
 */
var directionToHead = CompassPoint.west

/*
 类型已知时，再次为其赋值可以省略枚举类型名。
 使用具有显式类型的枚举值，让代码具有更好的可读性。
 */
directionToHead = .east

// 使用Switch语句匹配枚举值
/*
 使用switch语句匹配单个枚举值
 */
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

/*
 当不需要匹配每个枚举成员的时候，可以用default分支来涵盖所有未明确处理的枚举成员。
 */
let somePlanet = Plant.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// 枚举成员的遍历
/*
 需要一个包含枚举所有成员的集合：
 令枚举遵循CaseIterable协议。Swift会生成一个allCases属性，用于表示一个包含枚举所有成员的集合。
 */
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

/*
 allCases---集合中的元素是枚举类型的实例，这些元素都是枚举值。
 */
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}

// 关联值
/*
 为枚举成员设置一个常量或变量，并且在赋值之后查看这个值。额外的信息被称为关联值。
 使用该枚举成员时，可以修改这个关联值。
 可以定义枚举存储任意类型的关联值
 */
enum BarCode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

/*
 上面代码只是定义了一个枚举类型，当使用枚举的成员值时，可以存储关联值
 */
var productBarcode = BarCode.upc(8, 85909, 51226, 3)

/*
 原始的Barcode.upc和其整数关联值被新的Barcode.qrCode和其字符串关联值所替代。同一时间只能存储一个成员值。
 */
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

/*
 关联值可以被提取出来作为switch语句的一部分。
 */
switch productBarcode {
case .upc(let numberSystem, let manuFacturer, let product, let check):
    print("UPC：\(numberSystem), \(manuFacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

/*
 如果一个枚举成员的所有关联值都被提取为常量或者变量，可以在成员名称前标注一个let或者var。
 */
switch productBarcode {
case let .upc(numberSystem, manuFacturer, product, check):
    print("UPC：\(numberSystem), \(manuFacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}

// 原始值
/*
 关联值的替代选择。
 枚举成员可以被默认值（原始值）预填充，这些原始值的类型必须相同。
 原始值可以使字符串，字符或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。
 原始值和关联值是不同的：
 1. 原始值是在定义枚举时被预先填充的值。对于一个特定的枚举成员，它的原始值始终不变。
 2. 关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。
 */
enum ASCIIControCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// 原始值的隐式赋值
/*
 使用原始值为整数或者字符串类型的枚举时，不需要显示地为每一个枚举成员设置原始值，会自动为你赋值。
 当使用整数作为原始值事，隐式赋值的值依次递增1，如果第一个枚举成员没有设置原始值，其原始值将为0。
 */
enum OtherPlanet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

/*
 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称。
 */
enum OtherCompassPoint: String {
    case north, south, east, west
}

/*
 使用枚举成员的rawValue属性可以访问该枚举成员的原始值。
 */
let earthOrder = OtherPlanet.earth.rawValue
let sunsetDirection = OtherCompassPoint.west.rawValue

// 使用原始值初始化枚举实例
/*
 如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做rawValue的参数，参数类型即为原始值类型，返回值是枚举成员或nil。
 */

/*
 使用初始化方法来创建一个新的枚举实例
 原始值构造器总是返回一个可选的枚举成员。
 原始构造器是一个可失败构造器，因为并不是每一个原始值都有与之对应的枚举成员。
 */
let possiblePlant = OtherPlanet(rawValue: 7) // possiblePlant类型为 OtherPlant?

let positionToFind = 11
if let somePlanet = OtherPlanet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// 递归枚举
/*
 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。
 使用递归枚举时，编译器会插入一个间接层。
 可以在枚举成员前加上indirect来表示该成员可递归
 */
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplicaion(ArithmeticExpression, ArithmeticExpression)
}

/*
 也可以在枚举类型开头加上indirect关键字来表明它的所有成员都是可递归的。
 */
indirect enum OtherArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplicaion(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplicaion(sum, ArithmeticExpression.number(2))

/*
 要操作具有递归性质的数据结构，使用递归函数是一种直截了当的方式。
 */
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplicaion(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))

