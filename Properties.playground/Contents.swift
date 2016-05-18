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
// 必须将延迟的存储属性
        