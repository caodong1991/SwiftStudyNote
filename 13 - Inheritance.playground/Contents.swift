//: Playground - noun: a place where people can play

import Cocoa

// 继承
/*
 一个类可以继承另一个类的方法，属性和其他特性。
 当一个类继承其他类时，继承类叫子类，被继承类叫超类或父类。
 类可以调用和访问超类的方法、属性和下标，并且可以重写这些方法，属性和下标来优化或修改它们的行为。
 */
//定义一个基类
/*
 不继承于其它类的的类，称之为基类。
 */
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

// 子类生成
/*
 子类生成指的是在一个已有类的基础上创建一个新的类。
 子类继承超类的特性，并且可以进一步完善。
 还可以为子类添加新的特性。
 */
/*
 为了指明某个类的超类，将超类名写在子类名的后面，用冒号分隔。
 */
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

/*
 子类还可以继续被其他类继承
 */
class Tandem: Bicycle {
    var currenNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currenNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem:\(tandem.description)")

// 重写
/*
 子类可以为继承来的实例方法，类方法，实例属性，或下标脚本提供自己定制的实现。这种行为叫重写。
 如果要重写某个特性，你需要在重写定义的前面加上override关键字。这么做，就表明了是想提供一个重写的版本，而非错误地提供了一个相同的定义。
 override关键字会提醒Swift编译器去检查该类的超类（或其中一个父类）是否有匹配重写版本的声明
 */
// 访问超类的方法，属性及下标
/*
 在合适的地方，通过使用super前缀来访问超类版本的方法，属性或下标脚本
 */
// 重写方法
/*
 在子类中，可以重写继承来的实例方法或类方法，提供一个定制或替代的方法实现。
 */
class Train: Vehicle {
    override func makeNoise() {
         print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

// 重写属性
/*
 可以重写继承来的实例属性或类型属性，提供自己定制的getter和setter，或添加属性观察器
 */

// 重写属性的Getters和Setters
/*
 可以将一个继承来的只读属性重写为一个读写属性，只需要你在重写版本的属性里提供getter和settter即可，
 但是，不可以将一个继承来的读写属性重写为一个只读属性。
 */
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car:\(car.description)")

// 重写属性观察器
/*
 不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器，因为这些值是不可以被设置的。
 不可以同时提供重写的setter和重写的属性观察器。
 */
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.gear)")

// 防止重写
/*
 可以通过把方法，属性或下标脚本标记为final来防止他们被重写，在声明关键字前加上final特性。
 在类扩展中的方法，属性或下标也可以在扩展的定义里标记final
 可以通过关键字class前添加final修饰符final class 来将整个类标记为final。这样的类不可被继承的。
 */




