//: Playground - noun: a place where people can play

import Cocoa

// 一个类可以继承另一个类的方法，属性和其他特性。当一个类继承其他类时，继承类叫子类，被继承类叫超类或父类。

// 不继承于其它类的的类，称之为基类。
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
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

// 子类还可以继续被其他类继承
class Tandem: Bicycle {
    var currenNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currenNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem:\(tandem.description)")

// 重写：子类可以为继承来的实例方法，类方法，实例属性，或下标脚本提供自己定制的实现。
// 如果要重写某个特性，你需要在重写定义的前面加上override关键字。

// 访问超类的方法，属性及下标脚本
// 在合适的地方，通过使用super前缀来访问超类版本的方法，属性或下标脚本
// 重写方法

class Train: Vehicle {
    override func makeNoise() {
         print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

// 重写属性
// 重写属性的Getters和Setters
// 可以将一个继承来的只读属性重写为一个读写属性，只需要你在重写版本的属性里提供getter和settter即可，但是，不可以将一个继承来的读写属性重写为一个只读属性。

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
// 可以通过把方法，属性或下标脚本标记为final来防止他们被重写，在声明关键字前加上final特性。




