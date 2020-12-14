import Foundation

// 协议
/*
 协议定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法、属性以及其他需要的东西。
 类、结构体或枚举都可以遵循协议，并为协议定义的这些要求提供具体实现。
 某个类型能够满足某个协议的要求，就可以说该类型遵循这个协议。
 除了遵循协议的类型必须实现的要求外，还可以对协议进行扩展，通过扩展来实现一部分要求或者实现一些附加功能，这样遵循协议的类型就能够使用这些功能。
 */

// 语法
protocol SomeProtocol {

}

/*
 要让自定义类型遵循某个协议，在定义类型时，需要在类型名称后加上协议名称，中间以冒号：分割。
 遵循多个协议时，各协议之间用逗号，分割。
 */
/*
struct SomeStructure: FirstProtocol, AnotherProtocol {

}
*/

/*
 若是一个类拥有父类，应该将父类名放在遵循的协议名之前，以逗号,分隔。
 */
/*
class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    
}
*/

// 属性要求
/*
 协议可以要求所有遵循该协议的类型提供特定名字和类型的实例属性或类型属性。
 协议不指定属性是存储属性还是计算属性，它只指定属性的名称和类型。
 此外，协议还指定属性是可读的还是可读可写的。
 如果协议要求属性是可读可写的，那么该属性不能是常量或只读的计算型属性。
 如果协议要求属性是可读的，那么该属性不仅可以是可读的，如果代码需要的话，还可以是可写的。
 协议总是用var关键字来声明变量属性，在类型声明后加上{ set get }来表示属性是可读可写的，可读属性则用 { get } 来表示。
 */

protocol OtherSomeProtocol {
    var mustBeSettable: Int { get set}
    var doseNotNeedToBeSettable: Int { get }
}

/*
 在协议中定义类型属性时，总是使用static关键字作为前缀。
 当类类型遵循协议时，除了static关键字，还可以使用class关键字来声明类型属性。
 */
protocol AnotherSomeProtocol {
    static var someTypeProperty: Int { get set }
}

/*
 只含有一个实例属性要求的协议
 */
protocol FullyNamed {
    var fullName: String { get }
}

/*
 遵循协议的简单结构体
 */
struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")


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
/*
 协议可以要求遵循协议的类型实现某些指定的实例方法或类方法。
 这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法体。
 可以在协议中定义具有可变参数的方法，不支持为协议中的方法提供默认参数。
 在协议中定义类方法的时候，总是使用static关键字作为前缀。即使在类实现时，类方法要求使用class或static作为关键字前缀。
 */
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

// 异变方法要求
/*
 有时需要在方法中改变（或变异）方法所属的实例。
 例如，在值类型（即结构体和枚举）的实例方法中，将mutating关键字作为方法的前缀，写在func关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值。
 如果在协议定义中定义了一个实例方法，该方法会改变遵循该协议的类型实例，那么在定义协议时需要在方法前加mutating关键字。这使得结构体和枚举能够遵循此协议并满足此方法需求
 
 实现协议中的mutating方法时，若是类类型，则不用写mutating关键字。而对于结构体和枚举，则必须写mutating关键字。
 */
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

// 构造器要求
/*
 协议可以要求遵循协议的类型实现指定的初始化器.
 在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体。
 */
protocol SomeProtocolOhter {
    init(someParameter: Int)
}

// 协议构造器要求的类实现
/*
 可以在遵循协议的类中实现构造器，无论是作为指定构造器，还是作为便利构造器。
 无论哪种情况，都必须为构造器实现标上required修饰符。
 使用required修饰符可以确保所有子类也必须提供此构造器的实现，从而也能遵循协议。
 如果此类已经被标记为final，那么不需要在协议构造器的实现中使用required修饰符，因为final类不能有子类。
 */
class SomeClass: SomeProtocolOhter {
    required init(someParameter: Int) {
        // 构造器的实现部分
    }
}

/*
 如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么该构造器的实现需要同时标注required和override修饰符。
 */

class SomeSuperClass {
    init(someParameter: Int) {
        // 这里是构造器的实现部分
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocolOhter {
    required override init(someParameter: Int) {
        // 构造器的实现部分
        super.init(someParameter: someParameter)
    }
}

// 可失败构造器
/*
 协议还可以为遵循协议的类型定义可失败构造器要求。
 遵循协议的类型可以通过可失败构造器init?或非可失败构造器init来满足协议中定义的可失败构造器要求。
 协议中定义的非可失败构造器要求可以通过非可失败构造器init或隐式解包可失败构造器init！来满足。
 */

// 将协议作为类型
/*
 尽管协议本身并未实现任何功能，但是协议可以被当做一个功能完备的类型来使用。
 协议作为类型使用，有时被称作存在类型，
 协议作为类型使用，使用场景如下：
 1. 作为函数、方法或构造体中的参数类型或返回类型
 2. 作为常量、变量或属性的类型
 3. 作为数组、字典或其他容器中的元素类型
 
 协议是一种类型，因此协议类型的名称应与其他类型的写法相同，使用大写字母开头的驼峰式写法。
 */
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator // 任何遵循了该协议的类型的实例都可以赋值给generator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator;
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

/*
 generator属性的类型为RandomNumberGenerator，因此任何遵循了RandomNumberGenerator协议的类型的实例都可以赋值给 generator，除此之外并无其他要求。
 并且由于其类型是RandomNumberGenerator，在Dice类中与generator交互的代码，必须适用于所有generator实例都遵循的方法。
 这句话的意思是不能使用由generator底层类型提供的任何方法或属性。
 但是你可以通过向下转型，从协议类型转换成底层实现类型，比如从父类向下转型为子类。
 */
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

// 委托
/*
 委托是一种设计模式，它允许类或结构体将一些需要它们负责的功能委托给其他类型的实例。
 委托模式的实现很简单：
 定义协议来封装那些需要被委托的功能，这样就能确保遵循协议的类型能提供这些功能。
 委托模式可以用来响应特定的动作，或者接收外部数据源提供的数据，而无需关心外部数据源的类型。
 */
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

/*
 为了防止强引用导致的循环引用问题，可以把协议声明为弱引用。
 当协议标记为类专属可以使类在声明协议时强制要使用弱引用。
 若要声明类专属的协议就必须继承于AnyObject
 */

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRool = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRool)
            switch square + diceRool {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRool
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides) - sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
         print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

// 在扩展里添加协议遵循
/*
 即便无法修改源码，依然可以通过扩展令已有类型遵循并符合协议。
 扩展可以为已有类型添加属性、方法、下标以及构造器，因此可以符合协议中的相应要求。
 通过扩展令已有类型遵循并符合协议，该类型的所有实例也会随之获得协议中定义的各项功能。
 */

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides) - sided dice"
    }
}

/*
 可以通过扩展并采纳协议，和在原始定义中遵循并符合协议的效果完全相同。
 协议名称写在类型名之后，以冒号隔开，然后在扩展的大括号内实现协议要求的内容。
 */
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

print(game.textualDescription)

// 有条件的遵循协议
/*
 泛型类型可能只在某些情况下满足一个协议的要求，比如当类型的泛型形式参数遵循对应协议时。
 可以通过扩展类型是列出限制让泛型类型有条件地遵循某协议。
 在采纳协议的名字后面泛型where语句。
 */

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemAsText = self.map { $0.textualDescription}
        return "[" + itemAsText.joined(separator: ", ") + "]"
    }
}

let myDice = [d6, d12]
print(myDice.textualDescription)

// 在扩展里声明采纳协议
/*
 当一个类型已经遵循了某个协议中的所有要求，却还没有声明采纳该协议时，可以通过空的扩展来让它采纳改协议
 既使满足了协议的所有要求，类型也不会自动遵循协议，必须显示地尊徐遵循协议。
 */
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster names \(name)"
    }
}

extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)

// 使用合成实现来采纳协议
/*
 Swift 可以自动提供一些简单场景下遵循 Equatable、Hashable 和 Comparable 协议的实现。在使用这些合成实现之后，无需再编写重复的代码来实现这些协议所要求的方法。
 */

// Equatable
/*
 - 遵循Equatable协议且只有存储属性的结构体。
 - 遵循Equatable协议且只有关联类型的枚举
 - 没有任何关联类型的枚举
 在包含类型原始声明的文件中声明对Equatable协议的遵循，可以得到 == 操作符的合成实现，且无需自己编写任何关于 == 的实现代码。Equatable协议同时包含 != 操作符的默认实现。
 */
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}

// Hashable
/*
 - 遵循 Hashable 协议且只有存储属性的结构体。
 - 遵循 Hashable 协议且只有关联类型的枚举
 - 没有任何关联类型的枚举
 在包含类型原始声明的文件中声明对Hashable协议的遵循，可以得到 hash(into:) 的合成实现，且无需自己编写任何关于 hash(into:) 的实现代码。
 */

// Comparable
/*
 Swift为没有原始值的枚举类型提供了Comparable协议的合成实现。
 如果枚举类型包含关联类型，那这些关联类型也必须同时遵循Comparable协议。
 在包含原始枚举类型声明的文件中声明其对Comparable协议的遵循，可以得到 < 操作符的合成实现，且无需自己编写任何关于 < 的实现代码。
 Comparable 协议同时包含 <=、> 和 >= 操作符的默认实现。
 */
enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}
var levels = [SkillLevel.intermediate, SkillLevel.beginner,
              SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
for level in levels.sorted() {
    print(level)
}

// 协议类型的集合
/*
 协议类型可以在数组或者字典这样的集合中使用。
 */
let things: [TextRepresentable] = [game, d12, simonTheHamster]
for thing in things {
    print(thing.textualDescription)
}

// 协议的继承
/*
 协议能够继承一个或多个其他协议，可以在继承的协议的基础上增加新的要求。
 协议的继承语法与类继承相似，多个被继承的协议间用逗号分隔。
 */
protocol InheritingProrocol: SomeProtocol, AnotherSomeProtocol {
}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextRepresentable: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextRepresentable: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake > 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

print(game.prettyTextRepresentable)

// 类专属的协议
/*
 通过添加AnyObject关键字到协议的继承列表，就可以限制协议只能被类类型采纳（以及非结构体或者非枚举的类型）。
 当协议定义的要求需要遵循协议的类型必须是引用语义而非值语义时，应该采用类类型专属协议。
 */
protocol SomeClassOnlyProtocol: AnyObject, InheritingProrocol {
}

// 协议合成
/*
 要求一个类型同时遵循多个协议是很有用的，
 可以使用协议组合来复合多个协议到一个要求里。
 协议组合行为就和定义的临时局部协议一样拥有构成中所有协议的需求。
 协议组合不定义任何新的协议类型。
 协议组合使用someProtocol&AnotherProtocol的形式。
 可以列举任意数量的协议，用和符号&分开。
 除了协议列表，协议组合也能包含类类型，这允许标明一个需要的父类
 */
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct AnotherPerson: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy Bitthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = AnotherPerson(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name:String, latitude: Double, longitude: Double) {
        self.name = name
        super .init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location:  Location & Named) {
    print("Hello, \(location.name)!")
}
    
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)
// 检查协议一致性
/*
 可以使用is和as操作符来检查协议一致性，即是否遵循某协议，并且可以转换到指定的协议类型。
 检查和转换协议的语法与检查和转换类型是完全一样的。
 * is 用来检查实例是否遵循某个协议，若遵循则返回true,否则返回false
 * as? 返回一个可选值，当实例遵循某个协议时，返回类型为协议类型的可选值，否则返回nil
 * as! 将实例强制向下转换到某个协议类型，如果强转失败，将触发运行时错误
 */

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [Circle(radius: 2.0),
                            Country(area: 243_610),
                            Animal(legs: 4)]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Someing that doesn't have an area")
    }
}

// 可选的协议要求
/*
 协议可以定义可选要求，遵循协议的类型可以选择是否实现这些要求。
 在协议中使用optional关键字作为前缀来定义可选要求。
 可选要求用在需要和OC打交道的代码中。
 协议和可选要求都必须带上@objc属性。
 标记@objc特性的协议只能被继承自OC类的类或@objc类遵循，其他类以及结构体和枚举均不能遵循这种协议。
 使用可选要求时，例如，可选的方法或属性，它们的类型会自动变成可选的。
 比如，一个类型为(Int)->String的方法会变成((Int)->String)?。
 需要注意的是整个函数类型是可选的，而不是函数的返回值。
 协议中的可选要求可通过可选链式来使用，因为遵循协议的类型可能没有实现这些可选要求。
 */
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

class TwoardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count > 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TwoardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

// 协议扩展
/*
 协议可以通过扩展来为遵循的类型提供属性、方法以及下标的实现。
 通过这种方式，可以基于协议本身来实现这些功能，而无需在每个遵循协议的类型中都重复同样的实现，也无需使用全局函数。
 通过协议扩展，所有遵循协议的类型，都能自动获得这个扩展锁增加的方法实现而无需额外修改。
 协议扩展可以为遵循协议的类型增加实例，但不能声明该协议继承自另一个协议。
 协议的继承只能在声明协议处进行指定。
 */
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

/*
 
 */
let anotherGenerator = LinearCongruentialGenerator()
print("Here's random number: \(anotherGenerator.random())")
print("Here's random number Boolean: \(anotherGenerator.randomBool())")

// 提供默认实现
/*
 可以通过协议扩展来为协议要求的方法，计算属性提供默认的实现。
 如果遵循协议的类型为这些要求提供了自己的实现，那么这些自定义实现将会替代扩展中的默认实现被使用。
 通过协议扩展为协议要求提供的默认实现和可选的协议要求不用。
 虽然在这两种情况下，遵循协议的类型都无需自己实现这些要求，但是通过扩展提供的默认实现可以直接调用，而无需使用可选链式调用。
 */
extension PrettyTextRepresentable {
    var prettyTextRepresentable: String {
        return textualDescription
    }
}

// 为协议扩展添加限制条件
/*
 在扩展协议的时候，可以指定一些限制条件，只有遵循协议的类型满足这些限制条件时，才能获得协议扩展提供的默认实现。
 这些限制条件写在协议名之后，使用where子句来描述。
 如果一个遵循的类型满足了为同一个方法或属性提供实现的多个限制型扩展的要求，Swift会使用最匹配限制的实现
 */
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]

print(equalNumbers.allEqual())
print(differentNumbers.allEqual())


