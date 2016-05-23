//: Playground - noun: a place where people can play

import Cocoa

// 实例方法:提供访问和修改实例属性的方法或提供与实例目的相关的功能，并以此来支撑实例的功能。
class Counter {
    var count = 0
    func increment() {
        count = count + 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
print(counter.count)
counter.increment()
print(counter.count)
counter.incrementBy(5)
print(counter.count)
counter.reset()
print(counter.count)

// 方法的局部参数名称和外部参数名称
class Counter1 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

let counter1 = Counter1()
counter1.incrementBy(5, numberOfTimes: 3)
print(counter1.count)

// 修改方法的外部参数名称
// 有时为方法的第一个参数提供一个外部参数名称是非常有用的，尽管这不是默认的行为。可以添加一个现实的外部名称作为第一个参数的前缀来把这个局部名称当做外部名称使用。
// 如果不想为方法的第二个及后续的参数提供一个外部名称，可以通过使用下划线_作为该参数的显示外部名称，这样做将覆盖默认行为。

// self 属性
// 使用这条规则的主要场景是实例方法的某个参数名称与实例的某个属性名称相同的时候。在这种情况下，参数名称享有优先权，并且在引用属性时必须使用一种更严格的方式。这时可以使用self属性来区分参数名称和属性名称。
struct Point{
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    print("This point is to the line where x == 1.0")
}

// 在实例方法中修改值类型

