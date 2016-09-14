//: Playground - noun: a place where people can play

import Cocoa

// 自动引用计数
// 自动引用计数实践
// 下面的例子展示了自动引用计数的工作机制
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?
reference1 = Person(name: "John Applesseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

// 类实例之间的循环强引用
// 循环强引用：如果两个类实例互相持有对方的强引用，因而每个实例都让对方一直存在。

class Person1 {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }

}
class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Person1?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person1?
var unit4A: Apartment?
john = Person1(name: "john Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

// 解决实例之间的循环强引用
// Swift提供了两种办法来解决在使用类的属性时所遇到的循环强引用问题：若引用（weak reference）和无主引用（unowned reference）。
// 弱引用和wu











