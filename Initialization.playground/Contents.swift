//: Playground - noun: a place where people can play

import Cocoa

// 构造过程
// 构造过程是使用类、结构体或枚举类型一个实例的准备过程。在新实例可用前必须执行这个过程。
// 通过定义构造器来实现构造过程，Swift的构造器无序返回值。

// 存储属性的初始赋值
// 类和结构体在创建实例时，必须为所有存储属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。
// 可以在构造器中为存储属性赋初值，也可以在定义属性时为其设置默认值。
// 当为存储属性设置默认值或者在构造器中为其赋值时，它们的值是直接设置的，不会触发任何属性观察者。

// 构造器
// 在创建某特定类型的新实例时调用，最简形式类似以一个不带任何参数的实例方法，以关键字init命名。

struct Fahrenheit {
    var temperature: Double {
        didSet {
            print("Temperature:\(temperature)")
        }
    }
    init() {
        print("构造器初始化")
        temperature = 32.0
    }
}

var f = Fahrenheit()
f.temperature = 56.0

// 默认属性值
// 如果属性总是使用相同的初始值，那么为其设置一个默认值比每次都在构造器中赋值要好，使用默认值让属性的初始化和声明结合的更紧密。让构造器更简洁，更清晰，且能通过默认值自动推导出属性的类型。

struct Fahrenheit1 {
    var temperature = 32.0
}

// 自定义构造过程
// 可以通过输入参数和可选属性类型来自定义构造过程，也可以在构造过程中修改常量属性。
// 构造参数：自定义构造过程中，可以在定义中提供构造参数，指定所需值的类型和名字。
struct Celsius {
    var temperaturelnCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperaturelnCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperaturelnCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperaturelnCelsius)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperaturelnCelsius)

// 参数的内部名称和外部名称
// 在调用构造器时，主要通过构造器中的参数名和类型来确定需要调用的构造器。如果在定义构造器时没有提供参数的外部名字，Swift会为每个构造器的参数自动生成一个跟内部名字相同的外部名。

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// 不带外部名的构造器参数
// 为构造器的某个参数不停工外部名字，可以使用下划线_来显示描述它的外部名。
struct Celsius1 {
    var temperaturelnCelsius = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temperaturelnCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperaturelnCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperaturelnCelsius = celsius
    }
}

let bodyTemperature = Celsius1(37.0)

// 可选属性类型
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text:"Do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "Yes, I do like cheese"

// 构造过程中常量属性的修改
// 可以在构造过程中的任意时间点修改常量属性的值，只要在构造过程结束时是一个确定的值。一旦常量属性被赋值，它将永远不可更改。
class SurveyQuestion1 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

// 默认构造器
// 如果结构体和类的所有属性都有默认值，同时没有自定义的构造器，那么Swift会给这些结构体和类创建一个默认构造器。这个默认构造器将简单创建一个所有属性值都设置为默认值的实例。
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

// 结构体的逐一成员构造器 用来初始化结构体新实例里成员属性的快捷方法。
struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

// 值类型的构造器代理
// 构造器可以通过调用其他构造器来完成部分构造过程，这一过程称为构造器代理，他能减少多个构造器之间的代码重复。
// 对于值类型, 可以使用self.init在自定义的构造器中引用其它的属于相同值类型的构造器。并且只能在内部调用self.init。
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init(){}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// 类的继承和构造过程
// 类里面的所有存储型属性--包括所有继承自父类的属性--都必须在构造过程中设置初始值。
// 指定构造器和便利构造器
// 指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。
// 便利构造器是类中比较次要的、辅助型的构造器。你可以定义便利构造器来调用同一个类中指定构造器，并为其参数提供默认值。
// 语法
// 指定构造器
//init(parameters) {
//    statements
//}

//便利构造器也要采用相同样式的写法，但需要在init关键字之前放置convenience关键字
//convenience init(parameters) {
//
//}


// 类的构造器代理规则
// 1.指定构造器必须调用其直接父类的指定构造器。
// 2.便利构造器必须调用同一类中定义的其他构造器。
// 3.便利构造器必须最终以调用一个指定构造器结束。

// 两段式构造过程
// Swift中类的构造过程包含两个阶段。第一个阶段，每个存储型属性通过引入它们的类的构造器来设置初始值。每当一个存储型属性被确定后，第二阶段开始，它给每个类一次机会在新实例准备使用之前进一步定制它们的存储型属性。第二个阶段开始，它给每个类一次机会在新实例准备使用之前进一步定制它们的存储型属性。
























