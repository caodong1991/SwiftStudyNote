// 内存安全
/*
 默认情况下，Swift会阻止你代码里不安全的行为。
 例如，Swift会保证变量在使用之前就完成初始化，在内存被回收之后就无法被访问，并且数组的索引会做越界检查。
 Swift也保证同时访问同一块内存时不会冲突，通过约束代码里对于存储地址的写操作，去获取那一块内存的访问独占权。
 因为Swift 自动管理内存，所以大部分时候你完全不需要考虑内存访问的事情。
 然而，理解潜在的冲突也是很重要的，可以避免你写出访问冲突的代码。
 而如果你的代码确实存在冲突，那在编译时或者运行时就会得到错误。
 */

// 理解内存访问冲突
/*
 内存的访问，会发生在你给变量赋值，或者传递参数给函数时。
 内存访问的冲突会发生在你的代码尝试同时访问同一个存储地址的时侯。同一个存储地址的多个访问同时发生会造成不可预计或不一致的行为。
 在Swift里，有很多修改值的行为都会持续好几行代码，在修改值的过程中进行访问是有可能发生的。
 */
// 向one所在的内存区域发起一次写操作
var one = 1

// 向one所在的内存区域发起一次读操作
print("We're number \(one)!")

// 内存访问性质
/*
 内存访问冲突时，要考虑内存访问上下文中的这三个性质：
 - 访问是读还是写，
 - 访问的时长,
 - 以及被访问的存储地址。
 特别是，冲突会发生在当你有两个访问符合下列的情况：
 * 至少有一个是写访问
 * 它们访问的是同一个存储地址
 * 它们的访问在时间线上部分重叠
 读和写访问的区别很明显：一个写访问会改变存储地址，而读操作不会。
 存储地址是指向正在访问的东西（例如一个变量，常量或者属性）的位置的值 。
 
 内存访问的时长要么是瞬时的，要么是长期的。
 如果一个访问不可能在其访问期间被其它代码访问，那么就是一个瞬时访问。
 正常来说，两个瞬时访问是不可能同时发生的。大多数内存访问都是瞬时的。
 
 有几种被称为长期访问的内存访问方式，会在别的代码执行时持续进行。
 瞬时访问和长期访问的区别在于别的代码有没有可能在访问期间同时访问，也就是在时间线上的重叠。
 一个长期访问可以被别的长期访问或瞬时访问重叠。
 重叠的访问主要出现在使用in-out参数的函数和方法或者结构体的mutating方法里。
 */

func oneMore(than number: Int) -> Int {
    return number + 1
}

// 所有读和写访问都是瞬时的
var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)

// In-Out参数的访问冲突
/*
 一个函数会对它所有的in-out参数进行长期写访问。
 in-out参数的写访问会在所有非in-out参数处理完之后开始，直到函数执行完毕为止。
 如果有多个in-out参数，则写访问开始的顺序与参数的顺序一致。
 
 长期访问的存在会造成一个结果，你不能在访问以in-out形式传入后的原变量，即使作用域原则和访问权限允许——任何访问原变量的行为都会造成冲突。
 */

var stepSize = 1
func increament(_ number: inout Int) {
    number += stepSize
}

// 错误：stepSize访问冲突
increament(&stepSize)

/*
 解决这个冲突的一种方式，是显示拷贝一份。
 读访问在写操作之前就已经结束了，所以不会有冲突。
 */
var copyOfStepSize = stepSize
increament(&copyOfStepSize)
stepSize = copyOfStepSize

/*
 长期写访问的存在还会造成另一种结果，往同一个函数的多个in-out参数里传入同一个变量也会产生冲突。
 */
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}


var playerOneScore = 42
var playerTwoScore = 30
/*
 用playerOneScore和playerTwoScore作为实际参数不会产生冲突——一共有两个写入访问在同一时间重叠，但它们访问的是不同的内存地址。
 相反，传入playerOneScore作为两个形式参数的值则产生冲突，因为它尝试执行两个写入访问到同一个内存地址且是在同一时间执行。
 因为操作符也是函数，它们也会对in-out参数进行长期访问。
 */
balance(&playerOneScore, &playerTwoScore) // 正常
//balance(&playerOneScore, &playerOneScore) // 错误：playerOneScore访问冲突

// 方法里self的访问冲突
/*
 一个结构体的mutating方法会在调用期间对self进行写访问。
 */
struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // 正常

//oscar.shareHealth(with: &oscar) // 错误：oscar 访问冲突

// 属性的访问冲突
/*
 如结构体，元组和枚举的类型都是由多个独立的值组成的，例如结构体的属性或元组的元素。
 因为它们都是值类型，修改值的任何一部分都是对于整个值的修改，意味着其中一个属性的读或写访问都需要访问整一个值。
 */
var playerInformation = (health: 10, energy: 20)
balance(&playerInformation.health, &playerInformation.energy) // 错误：playerInformation 的属性访问冲突

/*
 对于一个存储在全局变量里的结构体属性的写访问重叠了
 */
var holly = Player(name: "Holly", health: 10, energy: 10)
balance(&holly.health, &holly.energy)  // 错误

/*
 大多数对于结构体属性的访问都会安全的重叠。
 */
func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)  // 正常
}

/*
 限制结构体属性的重叠访问对于保证内存安全不是必要的。
 保证内存安全是必要的，但因为访问独占权的要求比内存安全还要更严格——意味着即使有些代码违反了访问独占权的原则，也是内存安全的，所以如果编译器可以保证这种非专属的访问是安全的，那Swift就会允许这种行为的代码运行。特别是当你遵循下面的原则时，它可以保证结构体属性的重叠访问是安全的：
 你访问的是实例的存储属性，而不是计算属性或类的属性
 结构体是本地变量的值，而非全局变量
 结构体要么没有被闭包捕获，要么只被非逃逸闭包捕获了
 如果编译器无法保证访问的安全性，它就不会允许那次访问。
 */
