//: Playground - noun: a place where people can play

import Cocoa

// 方法
/*
 方法时与某些特定类型相关联的函数。类、结构体、枚举都可以定义实例方法和类方法。
 实例方法为给定类型的实例封装了具体的任务和功能。
 类型方法与类型本身相关联。
 */

// 实例方法
/*
 实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
 实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能，并以此来支撑实例的功能。
 实例方法要写在它所属的类型的前后大括号之间。
 实例方法能够隐式访问它所属类型的所有类型的所有的其他实例方法和属性。
 实例方法不能脱离于现存的实例而被调用。
 */

class Counter {
    var count = 0
    func increment() {
        count = count + 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

/*
 和调用属性一样，用点语法调用实例方法。
 方法的参数可以同时有一个参数名（局部名称）和参数标签（外部名称）
 */
let counter = Counter()  // 0
counter.increment()      // 1
counter.increment(by: 5)   // 6
counter.reset()          // 0

// self属性
/*
 类型的每一个实例都有一个隐含属性叫做self，self完全等同于该实例本身。
 可以在一个实例方法中使用这个隐含的self属性来引用当前实例。
 
 */
class OtherCounter {
    var count = 0
    func increment() {
        self.count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

/*
 实际上，不必要在代码里面经常写self。
 不论何时，只要在一个方法中使用一个已知的属性或方法名称，如果没有明确地写self，swift假定是指当前实例的属性或者方法。
 使用这条规则的主要场景是实例方法的某个参数名称与实例的某个属性名称相同的时候。
 在这种情况下，参数名称享有优先权，并且在引用属性时必须使用一种更严格的方式。
 这时可以使用self属性来区分参数名称和属性名称。
 */
struct Point{
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the line where x == 1.0")
}

// 在实例方法中修改值类型
/*
 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
 但是如果需要在某个特定的方法中修改结构体或者枚举的属性，可以为这个方法选择可变（mutating）行为，
 然后就可以其从方法内部改变它的属性，并且这个方法做的任何改变在方法执行结束时还会保留在原始结构中。
 方法还可以给它隐含的Self属性赋值一个全新的实例，这个实例在方法结束后将替换原来的实例。
 要使用可变方法，将关键字mutating放到方法的func关键字之前。
 */
struct OtherPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double,y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint1 = OtherPoint(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint1.x), \(somePoint1.y))")

/*
 不能在结构体类型的常量上调用可变方法，因为其属性不能被改变，即使属性是变量属性。
 */
let fixedPoint = OtherPoint(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0) // 报错

// 在可变方法中给self赋值
/*
 可变方法能够赋给隐含属性self一个全新的实例。
 */
struct AnotherPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = AnotherPoint(x: x + deltaX, y: y + deltaY)
    }
}

/*
 枚举的可变方法可以把self设置为相同的枚举类型中不同的成员
 */
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()  // .height
ovenLight.next() // .off

// 类型方法
/*
 类型方法是类型本身调用的方法。
 在方法的func关键字之前加上关键字static，来指定类型方法。
 类还可以用关键字class来指定，从而允许子类重写父类该方法的实现。
 类型方法和实例方法一样用点语法调用。
 */
class SomeClass {
    class func someTypeMethod() {
        
    }
}
SomeClass.someTypeMethod()

/*
 在类型方法的方法体中，self属性指向这个类型本身。
 任何未限定的方法和属性名称，都可以被本类中其他的类型方法和类型属性引用。
 一个类型方法可以直接通过类型方法的名称调用本类中的其他类型方法，而无需在方法名称前面加上类型名称。
 在结构体和枚举中，也能够直接通过类型属性的名称访问本类中的类型属性，而不需要前面加上类型名称。
 */
struct LevelTracker {
    static var highesUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highesUnlockedLevel {
            highesUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highesUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highesUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now level 6")
} else {
    print("level 6 has not yet been unlocked")
}















