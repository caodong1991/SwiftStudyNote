//: Playground - noun: a place where people can play

import Cocoa

// 存储属性：一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量。
// 可以在定义存储属性的时候指定默认值。

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

// 常量结构体的存储属性
// 如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使定义变量存储属性。
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// rangeOfFourItems.firstValue = 6
// 上面报错，这种行为是由于结构体属于值类型。当值类型的实例被声明为常量的时候，他的所有属性也就成了常量。
// 把一个引用类型的实例赋给一个常量后，仍然可以修改实例的变量属性。

// 延迟存储属性: 第一次被调用的时候才会计算其初始值的属性。在属性声明前使用lazy来表示一个延迟存储属性。
// 必须将延迟的存储属性声明为变量，因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造完成之前必须要有初始值，因此无法声明延迟属性。

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
print(manager.importer.fileName)

// 计算属性：不直接存储值，而是提供一个getter和一个可选的setter，来间接获取和设置其他属性或变量的值。
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
let  initSquareCenter = square.center
print("\(square.center.x) ---- \(square.center.y)")
square.center = Point(x: 15.0, y: 15.0)
print("\(square.origin.x) ---- \(square.origin.y)")

// 便捷setter声明
// 如果计算属性的setter没有定义表示新值的参数名，则可以使用默认名称newValue。
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

// 只读计算属性
// 只有getter没有setter的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
// 必须使用var关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。
// 只读计算属性的声明可以去掉get关键字和花括号：
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

// 属性观察器：属性观察器监控和响应属性值的变化，每次属性被设置的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外。
// 可以为除了延迟存储属性之外的其他存储性添加属性观察器，也可以通过重写属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。
// 不需要为非重写的计算属性添加属性观察器，因为可以通过它的setter直接监控和响应值的变化
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) Steps")
            }
//            totalSteps = 0
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360

// 如果在一个属性的didSet观察器里为它赋值，这个值会替换该观察器之前设置的值。
print(stepCounter.totalSteps)

// 全局变量和局部变量
// 全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量。


// 类型属性：不管类型有多少个实例，这些属性都只有唯一一份。用于定义特定类型所有实例共享的数据。000
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
// 类型属性是通过类型本身来获取和设置，而不是通过实例。
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
















