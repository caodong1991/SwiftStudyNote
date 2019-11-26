import UIKit

// 高级运算符
// 位运算符
/*
 位运算符可以操作数据结构中每个独立的比特位。
 */
// 按位取反运算符
/*
 ~: 按位取反运算符，对一个数值的全部比特位进行取反。
 按位取反运算符是一个前缀运算符，直接放在运算数之前，并且它们之间不能添加任何空格。
 */
let initialBits: UInt8 = 0b0000_1111
let invertedBits = ~initialBits // 等于 0b1111_0000

// 按位与运算符
/*
 &: 按位与运算符，对两个数的比特位进行合并。
 返回一个新的数，只有两个数的对应位都为1的时候，新数对应位才为1。
 */

let firstSixBits: UInt8 = 0b1111_1100
let lastSixBits: UInt8 = 0b0011_1111
let middleFourBits = firstSixBits & lastSixBits // 等于0b0011_1100

// 按位或运算符
/*
 |: 按位或运算符，可以对两个数的比特位进行比较。
 返回一个新的数，只要两个数的对应位中有任意一个为1时，新数的对应位就为1。
 */
let someBits: UInt8 = 0b1011_0010
let moreBits: UInt8 = 0b0101_1110
let combinedBits = someBits | moreBits // 等于 0b1111_1110

// 按位异或运算符
/*
 ^: 按位异或运算符，可以对两个数的比特位进行比较。
 返回一个新的数，当两个数的对应位不相同时，新数的对应位就为1，并且对应位相同时则为0。
 */
let firstBits: UInt8 = 0b0001_0100
let otherBits: UInt8 = 0b0000_0101
let outputBits = firstBits ^ otherBits // 0b0001_0001

// 按位左移、按位右移运算符
/*
 <<: 按位左移运算符 >>: 按位右移运算符
 可以对一个数的所有位进行指定位数的左移和右移。
 对一个数进行按位左移或按位右移，相当于对这个数进行乘以2或除以2的运算。
 将一个整数左移一位，等价于将这个数乘以2。
 将一个整数右移一位，等价于将这个数除以2。
 */

// 无符号整数的移位运算
/*
 规则：
 1. 已存在的为按指定的位数进行左移和右移。
 2. 任何因移动而超出整型存储范围的位都会被丢弃。
 3. 用0来填充移位后产生的空白位。
 这种方法称为逻辑移位。
 */

let shiftBits: UInt8 = 4 // 即二进制的 0b0000_0100
shiftBits << 1           // 0b0000_1000
shiftBits << 2           // 0b0001_0000
shiftBits << 5           // 0b1000_0000
shiftBits << 6           // 0b0000_0000
shiftBits >> 2           // 0b0000_0010

/*
 可以使用移位运算符对其他的数据类型进行编码和解码
 */
let pink: UInt32 = 0xCC6699  // 粉色的颜色值：#CC6699
let redComponent = (pink & 0xFF0000) >> 16  // 0xCC, 即204
let greenComponent = (pink & 0x00FF00) >> 8 // 0x66, 即102
let blueComponent = pink & 0x0000FF         // 0x99, 即153

// 有符号整数的移位运算
/*
 有符号整数使用第1个比特位，通常被称为符号位，来表示这个数的正负。
 符号位为0代表正数，为1代表负数。
 其余的比特位，通常称为数值位，存储了实际的值。
 有符号正整数和无符号数的存储方式是一样的，都是从0开始算起。
 负数的存储方式略有不同。它存储2的n次方减去其实际值的绝对值，这里的n是数值位的位数。
 负数的表示通常被称为二进制补码，用这种方法来表示负数乍看起来有点奇怪，但它有几个优点。
 1. 如果想对-1和-4进行加法预算，我们只需要对这两个数的全部8个比特位执行标准的二进制相加，包括符号位，
    并且将计算结果中超出8位的数值丢弃：
      0 1111_1100 = -4
    + 0 1111_1111 = -1
    = 1 1111_1011 = -5
 2. 使用二进制补码可以使负数的按位左移和右移运算得到跟正数相同的效果，
    即每向左移一位将自身的数值乘以2，每向右一位就将自身的数值除以2。
    规则：对有符号整数进行按位右移运算时，遵循与无符号整数相同的规则，但是对于移位产生的空白位使用符号位进行填充，而不是0。
    这个行为可以确保有符号整数的符号位不会因为右移运算而改变，这通常称为算术移位。
 由于正数和负数的特殊存储方式，在对它们进行右移的时候，会使它们越来越接近0。
 在移位的过程中保持符号位不变，意味着负整数在接近0的过程中一直保持为负。
 */

// 溢出运算符
/*
 当向一个整数类型的常量或变量赋予超过它容量的值时，Swift默认会报错，而不是允许生成一个无效的数。
 */
var potenttialOverflow = Int16.max
//potenttialOverflow += 1  // 这里会报错

/*
 数值溢出时采取截断处理，而非报错。
 swift提供了三个溢出运算符来让系统支持整数溢出运算：
 溢出加法 &+
 溢出减法 &-
 溢出乘法 &*
 */

// 数值溢出
/*
 数值有可能出现上溢或者下溢。
 */
var unsignedOverflow = UInt8.max  // 255  1111_1111
unsignedOverflow = unsignedOverflow &+ 1 // 0 1_0000_0000 只能保留8位：0000_0000

unsignedOverflow = UInt8.min  // 0  0000_0000
unsignedOverflow = unsignedOverflow &- 1  // 255 0000_0000 - 0000_0001 = 1111_1111

var signedOverflow = Int8.min  // -128  1000_0000
signedOverflow = signedOverflow &- 1 // 127 1000_0000 - 0000_0001 = 0111_1111

// 优先级和结合性

// 运算符函数
/*
 类和结构体可以为现有的运算符提供自定义的实现，这通常被称为运算符重载。
 */
/*
 二元中缀运算符。
 */
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.y, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anothetVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anothetVector

// 前缀和后缀运算符
/*
 要实现前缀或后缀运算符，需要在声明运算符函数的时候func关键字之前指定prefix或者postfix修饰符
 */
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

// 复合赋值运算符
/*
 复合赋值运算符将赋值运算符 = 与其他运算符进行结合。
 在实现的时候，需要把运算符的左参数设置成 inout类型，因为这个参数的值在运算符函数内直接被修改。
 */
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

/*
 不能对赋值运算符重载
 不能对三元条件运算符重载
 */

// 等价运算符
/*
 通常情况下，自定义的类和结构体没有对等价运算符进行默认实现。
 等价运算符通常被称为相等运算符 == 与不等运算符 !=。
 为了使用等价运算符对自定义的类型进行判等运算，需要为相等运算符提供自定义实现，实现方法与其他中缀运算符一样，并且增加对标准库Equatable协议的遵循。
 */
extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twothree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twothree == anotherTwoThree {
    print("these two vectors are equivalent")
}

/*
 多数情况下，可以使用swift提供的等价运算默认实现：
 只拥有存储属性，并且它们全都遵循Equatable协议的结构体
 只拥有关联类型，并且它们全都遵循Equatable协议的结构体
 没有关联类型的枚举
 */
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("Threse two vectors are also equivalent")
}

// 自定义运算符
/*
 新的运算符要是用operator关键字在全局作用域内进行定义，同时还要指定prefix、infix或者postfix修饰符。
 */
prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 2.0, y: 4.0)
let afterDoubling = +++toBeDoubled

// 自定义中缀运算符的优先级
infix operator +-: AdditionPrecedence

extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector

