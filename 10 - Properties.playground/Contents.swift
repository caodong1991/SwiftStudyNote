//: Playground - noun: a place where people can play

import Cocoa

// 属性
/*
 属性将值与特定的类、结构体、或枚举关联。
 存储属性会将常量和变量存储为实例的一部分，而计算属性则是直接计算值。
 计算属性可以用于类、结构体和枚举，而存储属性只能用于类和结构体。
 存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接与类型本身关联，这种属性称为类型属性。
 可以定义属性观察器来监控属性值的变化。
 可以利用属性包装器来复用多个属性的getter和setter中的代码
 */

// 存储属性
/*
 一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量。
 可以在定义存储属性的时候指定默认值。也可以在构造过程中设置或者修改存储属性的值，甚至修改常量存储属性的值。
 */
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

// 常量结构体的存储属性
/*
 如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使定义变量存储属性。
 */
//
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// rangeOfFourItems.firstValue = 6
/*
 上面报错，这种行为是由于结构体属于值类型。当值类型的实例被声明为常量的时候，他的所有属性也就成了常量。
 把一个引用类型的实例赋给一个常量后，仍然可以修改实例的变量属性。
 */

// 延迟加载存储属性
/*
 第一次被调用的时候才会计算其初始值的属性。在属性声明前使用lazy来表示一个延迟存储属性。
 必须将延迟的存储属性声明为变量，因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造完成之前必须要有初始值，因此无法声明延迟属性。
 如果一个被标记为lazy的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
 */
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
print(manager.importer.fileName)

// 存储属性和实例变量
/*
 swift统一用属性来实现，属性没有对应的实例变量，属性的备份存储也无法直接访问。
 避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。
 属性的全部信息，包括命名、类型和内存管理特征，作为类型定义的一部分，都定义在一个地方。
 */

// 计算属性
/*
 除存储属性外，类、结构体和枚举可以定义计算属性。
 计算属性不直接存储值，而是提供一个getter和一个可选的setter，来间接获取和设置其他属性或变量的值。
 */
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initSquareCenter = square.center
print("\(square.center.x) ---- \(square.center.y)")
square.center = Point(x: 15.0, y: 15.0)
print("\(square.origin.x) ---- \(square.origin.y)")

// 简化setter声明
/*
 如果计算属性的setter没有定义表示新值的参数名，则可以使用默认名称newValue。
 */
//
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// 简化setter声明
/*
 如果整个getter是单一表达式，getter会隐式地返回这个表达式结果。
 */
struct CompactReact {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// 只读计算属性
/*
 只有getter没有setter的计算属性就是只读计算属性。
 只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
 必须使用var关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。
 只读计算属性的声明可以去掉get关键字和花括号：
 */
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//属性观察器
/*
 属性观察器监控和响应属性值的变化，每次属性被设置的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外。
 可以为除了延迟存储属性之外的其他存储性添加属性观察器，
 也可以在子类中通过重写属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。
 不需要为非重写的计算属性添加属性观察器，因为可以通过它的setter直接监控和响应值的变化
 在父类初始化方法调用之后，在子类构造器中给父类的属性赋值时，会调用父类属性的willSet和didSet观察器。
 而在父类初始化方法调用之前，给子类的属性赋值时不会调用子类属性的观察器
 将带有观察器的属性通过in-out方式传入函数，willSet和didSet也会调用。
 这是因为in-out参数采用了拷入拷出内存模式：即在函数内部使用的是参数的copy，函数结束后，又对参数重新赋值。
 */
/*
 可以为属性添加其中一个或两个观察器：
 * willSet 在新值被设置之前调用
 * didSet 在新的值被设置之后调用
 willSet观察器会将新的属性值作为常量参数传入，
 在willSet的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称newValue表示。
 didSet观察器会将旧的属性值作为参数传入，
 可以为该参数指定一个名称或使用默认参数名oldValue。
 如果在didSet方法中再次对属性赋值，那么新值就会覆盖旧值。
 */
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) Steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

// 属性包装器
/*
 属性包装器在管理属性如何存储和定义属性的代码之间添加了一个分隔层。
 当使用属性包装器时，只需在定义属性包装器时编写一次管理代码，然后应用到多个属性上来进行复用。
 */
/*
 以private的方式声明变量时，只能在内部实现中使用。
 再写其他地方的代码通过使用wrappedValue的setter和getter来获取这个值，不能直接使用。
 */
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = min(newValue, 12)
        }
    }
}

/*
 通过在属性之前写上包装器名称作为特性的方式，可以把一个包装器应用到一个属性上。
 */
struct SmallRectangle {
    @TwelveOrLess var hight: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.hight) // 0
rectangle.hight = 10
print(rectangle.hight) // 10
rectangle.hight = 24
print(rectangle.hight) // 10

/*
 当把一个包装器应用到一个属性上时，编译器将合成提供包装器存储空间和通过包装器访问属性的代码。
 属性包装器只负责存储被包装值，所以没有合成这些代码。
 下面就是不利用这个特性语法的情况下，使用属性包装器行为的代码。
 下面代码中将其属性明确地包装在 TwelveOrLess 结构体中，而不是把@TwelveOrLess作为特性写下来。
 */
struct OtherSmallRectangle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get {
            return _height.wrappedValue
        }
        set {
            _height.wrappedValue = newValue
        }
    }
    var width: Int {
        get {
            return _height.wrappedValue
        }
        set {
            _height.wrappedValue = newValue
        }
    }
}

// 设置被包装属性的初始值
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = min(newValue, maximum)
        }
    }
    
    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

/*
 把包装器应用于属性且没有设定初始值时，使用init()构造器来设置包装器。
 */
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width) // 0 0

/*
 当为属性指定初始值时，用init(wrappedValue:)构造器来设置包装器
 */
struct UnitRectangel {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}
var unitRectangle = UnitRectangel()
print(unitRectangle.height, unitRectangle.width) // 1 1

/*
 当在自定义特性后面把实参写在括号里时，使用接受这些实参的构造器来设置包装器。
 */
struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width) // 2 3

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width) // 5 4

/*
 通过将实参包含到属性包装器中，可以设置包装器的初始状态，或者在创建包装器时传递其他的选项。
 这种语法是使用属性包装器最通用的方法。
 当包含属性包装器实参时，可以使用赋值来指定初始值。
 */
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)  // 1

mixedRectangle.height = 20
print(mixedRectangle.height) // 12

// 从属性包装器中呈现一个值
/*
 除了被包装值，属性包装器可以通过定义被呈现值暴露出其他功能。
 */
@propertyWrapper
struct OtherSmallNumber {
    private var number = 0
    var projectedValue = false
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}

struct SomeStructure {
    @OtherSmallNumber var someNumber: Int
}
var someStructure = SomeStructure()
someStructure.someNumber = 4
print(someStructure.$someNumber)  // false
someStructure.someNumber = 55
print(someStructure.$someNumber)  // true

/*
 属性包装器可以返回任何类型的值作为它的被呈现值、
 当从类型的一部分代码中访问被呈现值，例如属性getter或实例方法，可以在属性名称之前省略self.,就像访问其他属性一样。
 */
enum SizeEnum {
    case small, large
}

struct SizedRectangle {
    @OtherSmallNumber var height: Int
    @OtherSmallNumber var width: Int
    
    mutating func resize(to size: SizeEnum) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}


// 全局变量和局部变量
/*
 计算属性和观察属性所描述的功能也可以用于全局变量和局部变量。
 全局变量是在函数、方法、闭包或任何类型之外定义的变量。
 局部变量是在函数、方法或闭包内部定义的变量。
 全局的常量或变量都是延迟计算的，但不需要标记lazy修饰符。
 局部范围的常量和变量从不延迟计算
 */
//


// 类型属性
/*
 实例属性属于一个特定类型的实例，每创建一个实例，实例都拥有属于自己的一套属性值，实例之间的属性相互独立。
 也可以为类型本身定义属性，无论创建了多少个该类的实例，这些属性都只有唯一一份。这种属性就是类型属性。
 类型属性用于定义某个类型所有实例共享的数据。
 存储型类型属性可以是变量或常量，计算型类型属性跟实例的计算型属性一样只能定义成变量属性。
 跟实例的存储型属性不同，必须给存储型类型属性指定默认值，因为类型本身没有构造器，也就无法在初始化过程中使用构造器给类型属性赋值。
 存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。
 */

// 类型属性语法
/*
 类型属性是作为类型定义的一部分写在类型最外层的花括号内，因此它的作用范围也就在类型支持的范围内。
 用static关键字来定义类型属性。
 在为类定义计算型类型属性时，可以改用class关键字来支持子类对父类的实现进行重写。
 */
struct SomeStructrue {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedtypeProperty: Int {
        return 107
    }
}

// 获取和设置类型属性的值
/*
 跟实例属性一样，类型属性也是通过点运算符来访问。
 类型属性是通过类型本身来访问，而不是通过实例。
 */
print(SomeStructrue.storedTypeProperty)
SomeStructrue.storedTypeProperty = "Another value"
print(SomeStructrue.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
rightChannel.currentLevel = 11
















