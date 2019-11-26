//: Playground - noun: a place where people can play

import Cocoa

// 类与结构体
// 定义语法：类与结构体有着类似的定义方式。

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
// 结构体和类都是用构造器语法来生成新的实例。构造器语法的最简单形式是在结构体或者类的类型名称后跟随一对空括号。通过这种方式所创建的类或者结构体实例，其属性均会被初始化为默认值。
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 属性访问
// 使用点语法，可以访问实例的属性。
print("The wifth of someResolution is \(someResolution.width)")
// 可以访问子属性
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// 使用点语法为变量属性赋值
someVideoMode.resolution.width = 1280

// 结构体类型的成员逐一构造器：所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。
let vga = Resolution(width: 640, height: 480)

// 结构体和枚举是值类型
// 值类型被赋予给一个变量、常量、或者被传递给一个函数的时候，其值会被拷贝。
// 所有基本类型都是值类型，并且在底层都是以结构体的形式所实现。

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is now \(hd.width) pixels wide")

// 类是引用类型
// 引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝，因此，引用的是已存在的实例本身而不是拷贝。
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print(tenEighty.frameRate)

// 恒等运算符
// 判定两个常量或者变量是否引用同一个类实例。
// ===等价于 !==不等价于

// 类和结构体的选择
// 1.该数据结构的主要目的是用来封装少量相关简单数据值。
// 2.有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
// 3.该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
// 4.该数据结构不需要去继承另一个既有类型的属性或者行为。

