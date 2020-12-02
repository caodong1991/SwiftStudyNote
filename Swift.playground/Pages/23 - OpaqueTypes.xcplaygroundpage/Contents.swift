import Foundation

// 不透明类型
/*
 具有不透明返回类型的函数或方法会隐藏返回值的类型信息。
 函数不再提供具体的类型作为返回类型，而是根据它支持的协议来描述返回值。
 在处理模块和调用代码之间关系时，隐藏类型信息非常有用，因为返回的底层数据类型仍然可以保持私有。
 而且不同于返回协议类型，不透明类型能保证类型的一致性，编译器能获取到类型信息，同时模块使用者却不能获取到。
 */

// 不透明类型解决的问题
protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

/*
 利用泛型来实现垂直翻转之类的操作
 然而，这种方式有一个很大的局限：翻转操作的结果会暴露我们用构造结果的泛型类型
 */
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())


// 返回不透明类型
/*
 可以认为不透明类型和泛型相反。
 泛型允许调用一个方法时，为这个方法的形参和返回值制定一个与实现无关的类型.
 不透明类型允许函数实现时，选择一个与调用代码无关的返回类型。
 */
struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: middle, bottom: bottom)
    return trapezoid
}

let trapezoid = makeTrapezoid()
print(trapezoid.draw())

/*
 也可以将不透明返回类型和泛型结合起来。
 */
func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriandles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriandles.draw())

/*
 如果函数中有多个地方返回了不透明类型，那么所有可能的返回值都必须是同一类型。
 即使对于泛型函数，不透明返回类型可以使用泛型参数，但扔需要保证返回类型唯一。
 */
/*
 非法示例
 func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
     if shape is Square {
         return shape // 错误，返回类型不一致
     }
     return FlippedShape(shape: shape) // 错误，返回类型不一致
 }
 */

struct AnotherFlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        if shape is Square {
            return shape.draw()
        }
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

/*
 返回类型始终唯一的要求，并不会影响再返回的不透明类型中使用泛型。
 */
func `repeat`<T: Shape>(shape: T, count: Int) -> some Collection {
    return Array<T>(repeating: shape, count: count)
}

// 不透明类型和协议类型的区别
/*
 虽然使用不透明类型作为函数返回值，看起来和返回协议类型非常相似，但这两者有一个主要区别，就在于是否需要保证类型一致性。
 一个不透明类型只能对应一个具体的类型，即便函数调用者并不能知道是哪一种类型；
 协议类型可以同时对应多个类型，只要它们都遵循同一协议。
 总的来说，协议类型更具灵活性，底层类型可以存储更多样的值，而不透明类型对这些底层类型有更强的限定。
 */
/*
 采用返回协议类型的版本
 */
func protoFlip<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape
    }
    return FlippedShape(shape: shape)
}

let protoFlippedTriangle = protoFlip(smallTriangle)
let sameThing = protoFlip(smallTriangle)
//protoFlippedTriangle == sameThing  // 错误

/*
 将协议类型作为函数的返回类型能更加灵活，函数只要返回遵循协议的类型即可。
 然而，更具灵活性导致牺牲了对返回值执行某些操作的能力。
 相比之下，不透明类型则保留了底层类型的唯一性。
 Swift 能够推断出关联类型，这个特点使得作为函数返回值，不透明类型比协议类型有更大的使用场景。
 */
protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container { }

/*
// 错误：有关联类型的协议不能作为返回类型。
func makeProtocolContainer<T>(item: T) -> Container {
    return [item]
}

// 错误：没有足够多的信息来推断 C 的类型。
func makeProtocolContainer<T, C: Container>(item: T) -> C {
    return [item]
}
 */

func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}
let opaqueContainer = makeOpaqueContainer(item: 12)
let twelve = opaqueContainer[0]
print(type(of: twelve))
