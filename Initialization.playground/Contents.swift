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



        