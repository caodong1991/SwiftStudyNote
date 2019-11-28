//: Playground - noun: a place where people can play

import Cocoa

// 构造过程
/*
 构造过程是使用类、结构体或枚举类型一个实例的准备过程。
 在新实例可用前必须执行这个过程。
 它包括设置实例中每个存储属性的初始值和执行其他必须的设置或构造过程。
 通过定义构造器来实现构造过程，Swift的构造器无需返回值。
 它们的主要任务是保证某种类型的新实例在第一次使用前完成正确的初始化。
 类的实例也可以通过实现析构器来执行它释放之前自定义的清理工作。
 */

// 存储属性的初始赋值
/*
 类和结构体在创建实例时，必须为所有存储属性设置合适的初始值。
 存储型属性的值不能处于一个未知的状态。
 可以在构造器中为存储属性赋初值，也可以在定义属性时为其设置默认值。
 当为存储型属性分配默认值或者在构造器中为设置初始值时，它们的值是被直接设置的，不会触发任何属性观察者。
 */

// 构造器
/*
 在创建某特定类型的新实例时调用。
 最简形式类似以一个不带任何参数的实例方法，以关键字init命名。
 */
struct Fahrenheit {
    var temperature: Double {
        didSet {
            print("Temperature:\(temperature)")
        }
    }
    init() {
        print("构造器初始化")
        temperature = 32.0
    }
}

var f = Fahrenheit()
f.temperature = 56.0

// 默认属性值
/*
 在属性声明时为其设置默认值。
 如果属性总是使用相同的初始值，那么为其设置一个默认值比每次都在构造器中赋值要好。
 使用默认值让属性的初始化和声明结合的更紧密。让构造器更简洁，更清晰，且能通过默认值自动推导出属性的类型。
 同时，也能充分利用默认构造器、构造器继承等特性。
 */
struct AnotherFahrenheit {
    var temperature = 32.0
}

// 自定义构造过程
/*
 可以通过输入形参和可选属性类型来自定义构造过程，也可以在构造过程中分配常量属性。
 */

// 形参的构造过程
/*
 自定义构造过程中，可以在定义中提供构造形参，指定所需值的类型和名字。
 */
//
struct Celsius {
    var temperaturelnCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperaturelnCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperaturelnCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperaturelnCelsius) // 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperaturelnCelsius) // 0.0

// 形参命名和实参标签
/*
 构造形参可以同时使用在构造器里使用的形参命名和一个外部调用构造器时使用的实参标签。
 在调用构造器时，主要通过构造器中的参数名和类型来确定需要调用的构造器。
 如果在定义构造器时没有提供实参标签，Swift会为构造器的每个形参自动生成一个名字相同的实参标签。
 */
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// 不带实参标签的构造器形参
/*
 为构造器的某个形参不提供实参标签，可以使用下划线_来显代显式的实参标签来重写默认行为。
 */
//
struct AnotherCelsius {
    var temperaturelnCelsius = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temperaturelnCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperaturelnCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperaturelnCelsius = celsius
    }
}

let bodyTemperature = AnotherCelsius(37.0)

// 可选属性类型
/*
 如果自定义的类型有一个逻辑上允许值为空的存储型属性，无论是因为它无法在初始化时赋值，还是因为在它在之后某个时机可以赋值为空，都需要将它声明为可选类型。
 可选类型的属性将自动初始化为nil，表示这个属性是特意在构造过程设置为空。
 */
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text:"Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese"

// 构造过程中常量属性的赋值
/*
 可以在构造过程中的任意时间点修改常量属性的值，只要在构造过程结束时是一个确定的值。
 一旦常量属性被赋值，它将永远不可更改。
 对类的实例来说，它的常量属性只能定义它的类的构造过程中修改；不能在子类中修改。
 */
//
class AnotherSurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let beetsQuestion = AnotherSurveyQuestion(text: "How about beets")

// 默认构造器
/*
 如果结构体和类的所有属性都有默认值，同时没有自定义的构造器，那么Swift会给这些结构体和类创建一个默认构造器。
 这个默认构造器将简单创建一个所有属性值都设置为默认值的实例。
 */
//
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

// 结构体的逐一成员构造器
/*
 结构体如果没有定义任何自定义构造器，它们将自动获得一个逐一成员构造器。
 不像默认构造器，即使存储型属性没有默认值，结构体也能会获得逐一成员构造器。
 用来初始化结构体新实例里成员属性的快捷方法。
 */
struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

/*
 当调用一个逐一成员构造器时，可以省略任何一个有默认值的属性。
 对于被省略的属性，构造器会使用默认值。
 */
let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)

let zeroByZero = Size()
print(zeroByTwo.width, zeroByTwo.height)

// 值类型的构造器代理
/*
 构造器可以通过调用其他构造器来完成部分构造过程，这一过程称为构造器代理，他能减少多个构造器之间的代码重复。
 构造器代理的实现规则和形式在值类型和类类型中与所不同，
 值类型（结构体和枚举类型）不支持继承，所以构造器代理的过程相对简单，因为它们只能代理给自己的其他构造器。
 类类型支持继承，类有责任保证其所有继承的存储型属性在构造时也能正确的初始化。
 对于值类型, 可以使用self.init在自定义的构造器中引用其它的属于相同值类型的构造器。
 并且只能在构造器内部调用self.init。
 如果为某个值类型定义了一个自定义的构造器，将无法访问到默认构造器（如果是结构体，还将无法访问逐一成员构造器）。
 如果希望默认构造器、逐一成员构造器以及你自己的自定义构造器都能用来创建实例，可以将自定义的构造器写到扩展中，而不是写到值类型的原始定义中。
 */
//
//
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init(){}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// 类的继承和构造过程
/*
 类里面的所有存储型属性--包括所有继承自父类的属性--都必须在构造过程中设置初始值。
 swift为类类型提供了两种构造器来确保实例中所有存储型属性都能获得初始值，它们被称为指定构造器和便利构造器。
 */

// 指定构造器和便利构造器
/*
 指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性，并调用合适的父类构造器让构造过程沿着父类链继续往上进行。
 类倾向于拥有极少的指定构造器，普遍的是一个类只拥有一个指定构造器。
 指定构造器让构造过程沿着父类链继续往上进行。
 每个类都必须至少拥有一个指定构造器。在某些情况下，许多类通过继承了父类中的指定构造器而满足了这个条件。
 
 便利构造器是类中比较次要的、辅助型的构造器。
 可以定义便利构造器来调用同一个类中指定构造器，并为部分形参提供默认值。
 也可以定义便利构造器来创建一个特殊用途或特定输入值的实例。
 */

// 指定构造器和便利构造器的语法
/*
 指定构造器的写法跟值类型简单构造器一样。
 init(parameters) {
     statements
 }
 */
/*
 便利构造器也要采用相同样式的写法，但需要在init关键字之前放置convenience关键字
 convenience init(parameters) {

 }
 */

// 类类型的构造器代理
/*
 为了简化指定构造器和便利构造器之间的调用关系，Swift构造器之间的代理调用遵循以下三条规则：
 1.指定构造器必须调用其直接父类的指定构造器。
 2.便利构造器必须调用同一类中定义的其他构造器。
 3.便利构造器必须最终以调用一个指定构造器结束。
 
 - 指定构造器必须总是向上代理
 - 便利构造器必须是横向代理
 */

// 两段式构造过程
/*
 Swift中类的构造过程包含两个阶段。
 第一个阶段，类中的每个存储型属性赋一个初始值。
 每当一个存储型属性被确定后，第二阶段开始，它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性。
 
 两段式构造过程的使用让构造过程更安全，同时在整个类层级结构中给予了每个类完全的灵活性。
 两段式构造过程可以防止属性值在初始化之前被访问，也可以防止属性被另外一个构造器赋予不同的值。
 
 Swift编译器将执行四种有效的安全检查，以确保两段式构造过程不出错地完成:
 安全检查1
 指定构造器必须保证它所在类的所有属性都必须先初始化完成，之后才能将其它构造器任务向上代理给父类中的构造器。
 一个对象的内存只有在其所有存储型属性确定之后才能完全初始化。
 为了满足这一规则，指定构造器必须保证它所在类的属性在它往上代理之前先完成初始化。
 
 安全检查2
 指定构造器必须在为继承的属性设置新值之前向上代理调用父类构造器。否则，指定构造器赋予的新值将被父类中的构造器所覆盖。
 
 安全检查3
 便利构造器必须为任意属性（包括所有同类中定义的）赋新值之前代理调用其他构造器，否则，便利构造器赋予的新值将被该类的指定构造器所覆盖。
 
 安全检查4
 构造器在第一阶段完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能饮用self作为一个值。
 
 类的实例在第一阶段结束以前并不是完全有效的。只有第一阶段完成以后，累的实例才是有效的，才能访问属性和调用方法。
 
 两段式构造过程展示：
 阶段1：
 * 类的某个指定构造器或便利构造器被调用。
 * 完成类的新实例内存的分配，但此时内存还没有被初始化。
 * 指定构造器确保其所在类引入的所有存储型属性都已赋初值。存储型属性所属的内存完成初始化。
 * 指定构造器切换到父类的构造器，对其存储属性完成相同的任务。
 * 这个过程沿着类的继承链一直往上执行，直到达继承链的最顶部。
 * 当到达了继承链最顶部，而且继承链的最后一个类已确保所有的存储型属性都已经赋值，这个实力的内存被认为已经完成初始化。
 此时阶段1完成。
 
 阶段2：
 * 从继承链顶部往下，继承链中每个类的指定构造器都有机会进一步自定义实例。构造器此时可以访问self、修改它的属性并调用实例方法等等。
 * 最终，继承链中任意的便利构造器有机会自定义实例和使用self。
 */

// 构造器的继承和重写
/*
 swift中的子类不会默认继承父类的构造器。可以防止一个父类的简单构造器被一个更精细的子类继承，而在用来创建子类时的新实例时没有完全或错误被初始化。
 父类的构造器仅会在安全和适当的某些情况下被继承。
 若希望自定义的子类中能提供一个或多个跟父类相同的构造器，可以在子类中提供这些构造器的自定义实现。
 当在编写一个和父类中指定构造器相匹配的子类构造器时，实际上是在重写父类的这个指定否早起，因此在定义子类构造器时带上override修饰符。
 即使重写的是系统自动提供的默认构造器,也要带上override修饰符。
 如果编写了一个和父类便利构造器相匹配的子类构造器，不需要加override修饰符。因为子类不能直接调用父类的便利构造器，严格意义上来讲，并未对父类便利构造器提供重写。
 */
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()  // 默认构造器
print("Vehicle: \(vehicle.description)")

class Bicyle: Vehicle {
    override init() { // 自定义指定构造器
        super.init() // 代理调用父类的默认构造器
        numberOfWheels = 2
    }
}
let bicyle = Bicyle()
print("Bicyle: \(bicyle.description)")

/*
 如果子类的构造器没有在阶段2过程中做自定义操作，并且父类有一个无参数的指定构造器，可以在所有子类的存储属性赋值之后省略super.init()的调用。
 */
class HoverBoard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() 在这里被隐式调用
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)" // 子类可以在构造过程中修改继承类的变量属性,但是不能修改继承来的常量属性
    }
}

let hoverBoard = HoverBoard(color: "sliver")
print("HoverBoard：\(hoverBoard.description)")

// 构造器的自动继承
/*
 子类在默认情况下不会继承父类的构造器。但是如果满足特定条件，父类构造器时可以被自动继承的。
 假设为子类中引入的所有新属性都提供了默认值，以下两个规则将适用：
 1. 如果子类没有定义任何指定构造器，它将自动继承父类所有的指定构造器
 2. 如果子类提供了所有父类指定构造器的实现，无论是通过规则1自动继承过来的，还是提供了自定义实现，它将自动继承父类所有的便利构造器。
 即使在子类添加了更多的便利构造器，这两条规则仍然适用。
 子类可以将父类的指定构造器实现为便利构造器来满足规则2.
 */

// 指定构造器和便利构造器实践
class Food {
    var name: String
    init(name: String) {  // 指定构造器，确保所有存储型属性都被初始化
        self.name = name // 没有父类，构造器不需要调用super.init()来完成构造过程
    }
    
    convenience init() {  // 便利构造器
        self.init(name: "[Unnamed]") // 横向代理到指定构造器
    }
}

let namedMeat = Food(name: "Bacon")

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) { // 指定构造器
        self.quantity = quantity
        super.init(name: name) // 向上代理到父类的指定构造器
    }
    
    // 尽管将父类的指定构造器重写为便利构造器，但是它依然提供了父类的所有指定构造器的实现，自动继承了父类的所有便利构造器
    override convenience init(name: String) { // 使用了跟父类中指定构造器相同的形参，由于这个便利构造器重写了父类的指定构造器，因此必须在前面使用override修饰符
        
        self.init(name: name, quantity: 1) // 横向代理到指定构造器
    }
}

/*
 RecipeIngredient的父类是Food，它有一个便利构造器init()。这个便利构造器会被RecipeIngredient继承。
 这个继承版本的init()在功能上跟Food提供的版本是一样的，只是它会代理到RecipeIngredient版本的init(name:)，而不是Food提供的版本
 */
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class AnotherShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "✔" : " ✘"
        return output
    }
}

var breakfastList = [AnotherShoppingListItem(),
                     AnotherShoppingListItem(name: "Bacon"),
                     AnotherShoppingListItem(name: "Eggs", quantity: 6),]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

// 可失败构造器
/*
 定义一个构造器可失败的类，结构体或者枚举是很有用的。
 失败指的是，如果构造器传入无效的形参，或缺少某种需要的外部资源，又或是不满足某种必要的条件等。
 为了妥善处理这种构造过程中可能会失败的情况。可以在一个类、结构体或是枚举类型的定义中，添加一个或多个可失败构造器。
 其语法为在init关键字后面添加问号 init?
 可失败构造器的参数名和参数类型，不能与其他非可失败构造器的参数名，及其参数类型相同。
 可失败构造器会创建一个类型为资深类型的可选类型的对象。通过return nil 语句来表明可失败构造器在何种情况下应该失败。
 严格来说，构造器都不支持返回值。
 */
let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintained value of \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)

if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value")
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

// 枚举类型的可失败构造器
/*
 可以通过一个带一个或多个形参的可失败构造器来获取枚举类型中特定的枚举成员。
 如果提供的形参无法匹配任何枚举成员，则构造失败。
 */
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "f")
if fahrenheitUnit != nil {
    print("This is a defined tempreature unit, so initialization succeeded.")
}

let unknowUnit = TemperatureUnit(symbol: "X")
if unknowUnit == nil {
    print("This is a defined tempreature unit, so initialization failed.")
}

// 带原始值的枚举类型的可失败构造器
/*
 带原始值的枚举类型会自带一个可失败构造器init?(rawValue)，该可失败构造器有一个合适的原始值类型的rawValue形参，选择找到相匹配的枚举成员，找不到则构造失败。
 */
enum AnotherTemperatureUnit: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let anotherFahrenheitUnit = AnotherTemperatureUnit(rawValue: "f")
if anotherFahrenheitUnit != nil {
    print("This is a defined tempreature unit, so initialization succeeded.")
}

let anotherUnknowUnit = AnotherTemperatureUnit(rawValue: "X")
if anotherUnknowUnit == nil {
    print("This is a defined tempreature unit, so initialization failed.")
}

// 构造失败的传递
/*
 类、结构体、枚举的可失败构造器可以横向代理到它们自己其他的可失败构造器。
 类似的，子类的可失败构造器也能向上代理到父类的可失败构造器。
 无论是向上代理还是横向代理，如果你代理到其它可失败构造器触发构造器失败，整个构造器过程将立即终止，接下来的任何构造代码不会再被执行。
 可失败构造器也可以代理到其他的不可失败构造器。通过这种方式，可以增加一个可能的失败状态到现有的构造过程中。
 */
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

// 重写一个可失败构造器
/*
 如同其他的构造器，可以在子类中重写父类的可失败构造器。
 或者也可以用子类的非可失败构造器重写一个父类的可失败构造器。
 这使可以定义一个不会构造失败的子类，即使父类构造器允许构造失败。
 当用子类的非可失败构造器重写父类的可失败构造器时，向上代理到父类的可失败构造器的唯一方式是对父类的可失败构造器的返回值进行强制解包。
 可以用非可失败构造器重写可失败构造器，但反过来缺不行
 */
class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitleDocument: Document {
    override init() {
        super.init(name: "[Untitled]")! // 使用强制解包来调用父类的可失败构造器
    }
}

// init! 可失败构造器
/*
 可以通过在init后面添加一个感叹号的方式来定义一个可失败构造器 init!
 该可失败构造器将会构建一个对应类型的隐式解包可选类型的对象。
 可以在init?中代理到init!,反之亦然，可以用init?重写init!，反之亦然。
 可以用init代理到init!.
 不过一旦init!构造失败，则会触发一个断言。
 */

// 必要构造器
/*
 在类的构造器前添加required修饰符表明该类的子类都必须实现该构造器。
 在子类重写父类的必要构造器时，必须在子类的构造器前也添加required修饰符，表明该构造器要求也应用于继承链后面的子类。
 在重写父类中必要的指定构造器时，不需要添加override修饰符。
 */
class SomeClass {
    required init () {
        
    }
}

class SomeSubclass: SomeClass {
    required init() {
        
    }
}

// 通过闭包或函数设置属性的默认值
/*
 如果某个存储属性的默认值需要一些自定义或设置，可以使用闭包或全局函数为其提供定制的默认值。
 每当某个属性所在类型的新实例被构造时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给这个属性。
 这种类型的闭包或函数通常会创建一个跟属性类型相同的临时变量，然后修改它的值以满足预期的初始状态，最后返回这个临时变量，作为属性的默认值。
 
 模板
 class SomeClass {
     let someProperty: SomoType = {
         // 在这个闭包中给someProperty 创建一个默认值
         // someValue必须和SomeType类型相同
         return someValue
     }()
 }
 注意闭包结尾的花括号后面接了一对空的小括号。这用来告诉Swift立即执行此闭包。
 如果忽略了这对括号，相当于将闭包本身作为值赋值给了这个属性，而不是将闭包的返回值赋值给属性。
 如果使用闭包来初始化属性，请记住在闭包执行时，实例的其他部分都还没有初始化。
 这意味着不能在闭包里访问其他属性，即使这些属性有默认值。
 同样，也不能使用隐式的self属性，或者调用任何实例方法。
 */

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for i in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1)) // true
print(board.squareIsBlackAt(row: 7, column: 7)) // false


