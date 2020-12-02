import Foundation

// 控制流
// for-in循环
/*
 遍历一个数组所有元素
 */
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)")
}

/*
 遍历一个字典
 */
let numberOfLegs = ["spider": 8, "ant":6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

/*
 for-in循环还可以使用数字范围。
 */
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)") // index是一个每次循环遍历开始时被自动赋值的常量。这种情况下，index在使用前不需要声明，只需要将它包含在循环的声明中，就可以对其进行隐式声明，而无需使用let关键字声明。
}

/*
 如果如果不需要区间序列内每一项的值，可以使用下滑线_替代变量名来忽略这个值。
 */
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to be power of \(power) is \(answer)")

/*
 使用半开区间运算符
 */
let minutes = 60
for tickMark in 0..<minutes {
    print(tickMark) // 每一分钟都渲染一个刻度线(60次)
}

/*
 使用stride(from:to:by:) 函数跳过不需要的标记
 */
let minuteInterval = 5
for tickMark in stride(from: 0, to: minuteInterval, by: minutes) {
    print(tickMark) // 每五分钟渲染一个刻度线(0,5,10,15,20,25,30...45,50,55)
}

/*
 可以在闭区间使用 stride(from:through:by:) 起到同样作用
 */
let hours = 12
let hoursInterval = 3
for tickMark in stride(from: 3, through: hours, by: hoursInterval) {
    print(tickMark) // 每3小时渲染一个刻度线(3,6,9,12)
}

// While循环
/*
 运行一系列语句直到条件变成false。这类循环适合使用在第一次迭代前迭代次数未知的情况下。
 swift提供两种while循环形式
 while：循环，每次在循环开始时计算条件是否符合。循环从计算单一条件开始，如果条件为true，会重复运行一系列语句，直到条件变为false。
 Repeat-While 循环，每次在循环结束时计算条件是否符合。在判断循环条件之前，先执行一次循环的代码块，然后重复循环直到条件为false。
 */

// while
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
print("Game Start!")
while square < finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
    print("当前在第\(square)格")
}
print("Game Over!")

// Repeat-While
square = 0
diceRoll = 0
print("Game Start!")
repeat {
    // 顺着梯子爬上去或者顺着蛇滑下去
    square += board[square]
    // 掷骰子
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    print("当前在第\(square)格")
} while square < finalSquare
print("Game Over!")

// 条件语句
/*
 if语句：当条件较为简单且可能的情况很少时
 switch语句：适用于条件较复杂、有更多排列组合的时候。并且在需要用到模式匹配的情况下会更有用。
 */

// if
/*
 if语句最简单的形式就是只包含一个条件，当且仅当该条件为true时，才执行相关代码
 */
var temperaturelnFahrenheit = 90
if temperaturelnFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperaturelnFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("it's not that cold. Wear a t-shirt.")
}

//Switch
/*
 switch语句会尝试把某个值与若干个模式进行匹配。
 Switch语句最简单的形式就是把某个值与一个或若干个相同类型的值作比较，由多个case构成。
 每一个case分支都是必须包含至少一条语句。一个case也可以包含多个模式，用逗号分开。
 在某些不可能涵盖所有值得情况下，可以使用默认default分支来满足。
 */
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet.")
case "z":
    print("The last letter of the alphabet.")
default:
    print("Some other character.")
}
//
// 不存在隐式的贯穿
/*
 在Swift中，当匹配的case分支中的代码执行完毕后，程序会终止switch语句，而不会继续执行下一个case分支。
 所以不需要再case分支中显示地使用break语句。
 虽然在Swift中break不是必须的，但你依然可以在case分支中的代码执行完毕前使用break跳出。
 */
// 下面代码会报编译错误
/*
 let anothetCharacter: Character = "a"
 switch anothetCharacter {
 case "a": // 无效，这个分支下面没有语句
 case "A":
     print("The letter A")
 default:
     print("Not The letter A")
 }
 */

/*
 上面代码的switch语句不会一起匹配"a"和"A"。为了让单个case同时匹配"a"和"A"，可以将这两个值组合一个复合匹配，并且逗号分开
 */

let anothetCharacter: Character = "a"
switch anothetCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not The letter A")
}

/*
 如果想要贯穿至特定的分支，可以使用fallthrough
 */
switch anothetCharacter {
case "a":
    fallthrough
case "A":
    print("The letter A")
default:
    print("Not The letter A")
}

// 区间匹配
/*
 case分支的模式也可以是一个值的区间。
 */
let approxinmateCount = 62
let countedthings = "Moon orbiting Saturn"
var naturakCount: String
switch approxinmateCount {
case 0:
    naturakCount = "no"
case 1..<5:
    naturakCount = "a few"
case 5..<12:
    naturakCount = "several"
case 12..<100:
    naturakCount = "dozens of"
case 100..<1000:
    naturakCount = "hunderds of"
default:
    naturakCount = "many"
}
print("There are \(naturakCount) \(countedthings)")

// 元组
/*
 可以使用元组在同一个switch语句中测试多个值。元组中的元素可以是值，也可以是区间。
 使用下划线（_）来匹配所有可能的值。
 */
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(\(somePoint.0), 0) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside the box")
}

// 值绑定
/*
 case分支允许将匹配的值声明为临时常量或变量，并且在case分支体内使用，这种行为就叫值绑定。
 */
let anotherPoint = (2, 0)
switch anotherPoint {
case(let x, 0):
    print("on the x-axis with an x value of \(x)")
case(0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// where
/*
 case分支的模式可以使用where语句来判断额外的条件
 */
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y) is on the line x == y)")
case let (x, y) where x == -y:
    print("(\(x), \(y) is on the line x == -y)")
case let (x, y):
    print("(\(x), \(y) is just some arbitrary point)")
}

// 复合型Cases
/*
 当多个条件可以使用同一种方法处理时，可以将这几种可能放在同一个case后面，并且用逗号隔开。
 当case后面的任意一种模式匹配的时候，这条分支就会被匹配。
 如果匹配列表过长，还可以分行书写
 */
let otherSomeCharacter: Character = "e"
switch otherSomeCharacter {
case "a", "e", "i", "o", "u":
    print("\(otherSomeCharacter) is vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(otherSomeCharacter) is a consonant")
default:
    print("\(otherSomeCharacter) id not a vowel or a consonant")
}

/*
 复合匹配同样可以包含值绑定。
 复合匹配里所有的匹配模式，都必须包含相同的值绑定，并且每一个绑定都必须获取到相同类型的值。
 */
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

// 控制转移语句
// continue
/*
 continue语句告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。
 */
let puzzleInput = "greet minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

// break
/*
 break会立即结束整个控制流的执行。
 break可以在switch或循环语句中使用，用来提前结束switch或循环语句
 循环语句中的break，当在一个循环体中使用break时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号}后的第一行代码。不会本次循环迭代的代码被执行，也不会再有下次的循环迭代产生。
  Switch语句中的break，switch代码块中使用break时，会立即中断该switch代码块的执行，并且跳转到表示switch代码块结束的大括号}后的第一行代码。
 */
let numberSymbol: Character = "三"
var possinleIntegerValue: Int?
switch numberSymbol {
case "1", "一":
    possinleIntegerValue = 1
case "2", "二":
    possinleIntegerValue = 2
case "3", "三":
    possinleIntegerValue = 3
default:
    break
}

if let integerValue = possinleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue))")
} else {
    print("An integer value could not be found for \(numberSymbol)")
}

// 贯穿 fallthroungh
/*
 switch不存在隐式贯穿，所以要更加清晰和可预测，可以避免无意识地执行多个case分支从而引发的错误。
 如果需要C风格的贯穿特性，则在每个需要该特性的case分支中使用fallthrough关键字。
 */
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

// 带标签的语句
/*
 显示地指明break语句想要终止的是哪个循环体或者switch代码块
 */
var i = 0
whileOne: while i < 10 {
    switch i {
    case 8:
        break whileOne
    default:
        i += 1
    }
}
print(i)

square = 0
diceRoll = 0
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    switch square + diceRoll {
    case finalSquare:
        // 骰子数刚好使玩家移动到最终的方格里，游戏结束
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // 骰子数将会使玩家移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
        continue gameLoop
    default:
        // 合法移动，做正常处理
        square += diceRoll
        square += board[square]
    }
}

// 提前退出
/*
 guard的执行取决于一个表达式的布尔值。
 我们可以使用guard语句来要求条件必须为真时,以执行guard语句后的代码。不同于if语句，一个guard语句总是有一个else分句，如果条件不为真则执行else分句中的代码。
 如果guard语句的条件被满足，则继续执行gurad语句大括号后的代码。将变量或常量的可选绑定作为guard语句的条件，都可以保护guard语句后面的代码。
 如果条件不满足，在else分支上的代码就会被执行。这个分支必须转移控制以退出guard语句出现的代码段。它可以用控制转移语句如return、break、continue或者throw做这件事，或者调用一个不返回的方法或函数。
 */

func great(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")

}

great(person: ["name": "Jhon"])
great(person: ["name": "Jane", "location": "Cupertino"])


// 检测API可用性
if #available(iOS 9, macOS 10.10, watchOS 2.0, *) {
    // 在iOS使用iOS9的API，在macOS 使用macOS v10.10的API
} else {
    // 使用先前版本的iOS和OS X的API
}

























