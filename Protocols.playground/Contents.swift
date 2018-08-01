//: Playground - noun: a place where people can play

import Cocoa

// 协议为方法、属性，以及其他特定的任务需求或功能定义蓝图

// 语法
//protocol SomeProtocol {
//
//}

//struct SomeStructure: FirstProtocol, AnotherProtocol {
//
//}

//class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
//    
//}

// 属性要求
// 协议可以要求所有遵循该协议的类型提供特定名字和类型的实例属性或类型属性

//protocol SomeProtocol {
//    var mustBeSettable: Int { get set}
//    var doseNotNeedToBeSettable: Int { get }
//}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")

print(john)

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

// 方法要求
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number:\(generator.random())")
print("And another one: \(generator.random())")

// 异变方法需求
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print("\(lightSwitch)")


// 初始化器要求

