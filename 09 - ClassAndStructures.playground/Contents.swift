//: Playground - noun: a place where people can play

import Cocoa

// 类与结构体
/*
 通常一个类的实例被称为对象。
 */

// 结构体和类对比
/*
 两者都可以：
 1. 定义属性用于存储值
 2. 定义方法用于提供功能
 3. 定义下标操作用于通过下标语法访问它们的值
 4. 定义构造器用于设置初始值
 5. 通过扩展以增加默认实现之外的功能
 6. 遵循协议以提供某种标准功能
 
 类还有以下功能：
 1. 继承允许一个类继承另一个类的特征
 2. 类型转换允许在运行时检查和解释一个类实例的类型
 3. 析构器允许一个类实例释放任何其所被分配的资源
 4. 引用计数允许对一个类的多次引用
 */

// 类型定义语法
/*
 类与结构体有着类似的定义方式。
 通过struct关键字引入结构体，通过class关键字引入类，并将它们的具体定义放在一对大括号中。
 每当定义一个新的结构体或者类时，都是定义了一个新的Swift类型。
 */
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate  = 0.0
    var name: String?
}

// 类和结构体实例
/*
 创建结构体和类实例的语法非常相似。
 结构体和类都是用构造器语法来生成新的实例。
 构造器语法的最简单形式是在结构体或者类的类型名称后跟随一对空括号。
 通过这种方式所创建的类或者结构体实例，其属性均会被初始化为默认值。
 */
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 属性访问
/*
 使用点语法，可以访问实例的属性。
 */
print("The width of someResolution is \(someResolution.width)")

/*
 可以访问子属性
 */
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

/*
 使用点语法为变量属性赋值
 */
someVideoMode.resolution.width = 1280

// 结构体类型的成员逐一构造器
/*
 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。
 类实例没有默认的成员逐一构造器。
*/
let vga = Resolution(width: 640, height: 480)

// 结构体和枚举是值类型
/*
 值类型被赋予给一个变量、常量、或者被传递给一个函数的时候，其值会被拷贝。
 所有基本类型都是值类型，并且在底层都是以结构体的形式所实现。
 */
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

/*
 hd和cinema是两个完全不同的两个实例。
 将hd赋值给cinema时，hd中所存储的值会拷贝到新的cinema实例中。结果是两个完全独立的实例包含了相同的数值。
 */
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")  // 2048
print("hd is now \(hd.width) pixels wide") // 1920

/*
 枚举也遵循相同的行为准则
 */

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")


// 类是引用类型
/*
 引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝，因此，引用的是已存在的实例本身而不是拷贝。
 */
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate peoperty of tenEighty is now \(tenEighty.frameRate)")

// 恒等运算符
/*
 因为类是引用类型，所以多个常量和变量可能在幕后同时引用同一个实例。
 判定两个常量或者变量是否引用同一个类实例。
 ===相同 !==不相同
 */
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty after to the same VideoMode instance.")
}

// 指针
/*
 swift并不直接指向某个内存地址。
 swift中引用定义方式与其他的常量或变量的一样。
 如果需要直接与指针交互，可以使用标准库提供的指针和缓冲区类型。
 */

// 类和结构体的选择
// 1.该数据结构的主要目的是用来封装少量相关简单数据值。
// 2.有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
// 3.该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
// 4.该数据结构不需要去继承另一个既有类型的属性或者行为。

