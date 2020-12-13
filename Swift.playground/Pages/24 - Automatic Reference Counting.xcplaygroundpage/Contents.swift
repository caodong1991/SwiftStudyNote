import Foundation

// 自动引用计数
/*
 Swift 使用自动引用计数（ARC）机制来跟踪和管理你的应用程序的内存。通常情况下，Swift 内存管理机制会一直起作用，你无须自己来考虑内存的管理。ARC 会在类的实例不再被使用时，自动释放其占用的内存。
 */

// 自动引用计数的工作机制
/*
 每当你创建一个新的类实例时，ARC 会分配一块内存来储存该实例的信息。内存中会包含实例的类型信息，以及这个实例所关联的任何存储属性的值。此外，当实例不再被使用时，ARC 释放实例所占用的内存，并让释放的内存能挪作他用。这确保了不再被使用的实例，不会一直占用内存空间。
 然而，当ARC回收并释放了正在被使用中的实例后，该实例的属性和方法将不能再被访问和调用。实际上，如果你试图访问这个实例，你的应用程序很可能会崩溃。为了确保使用中的实例不会被销毁，ARC 会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。哪怕实例的引用数为 1，ARC 都不会销毁这个实例。
 为了使上述成为可能，无论你将实例赋值给属性、常量或变量，它们都会创建此实例的强引用。之所以称之为“强”引用，是因为它会将实例牢牢地保持住，只要强引用还在，实例是不允许被销毁的。
 */

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
/*
 循环强引用：如果两个类实例互相持有对方的强引用，因而每个实例都让对方一直存在。
 通过定义类之间的关系为弱引用或无主引用，来替代强引用，从而解决循环强引用的问题。
 */

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

/*
 内存泄露
 */
john = nil
unit4A = nil

// 解决实例之间的循环强引用
/*
 Swift提供了两种办法来解决在使用类的属性时所遇到的循环强引用问题：若引用（weak reference）和无主引用（unowned reference）。
 弱引用和无主引用允许循环引用中的一个实例引用另一个实例而不保持强引用。这样实例能够互相引用而不产生循环强引用。
 当其他的实例有更短的生命周期时，使用弱引用，也就是说，当其他实例析构在先时。
 相比之下，当其他实例有相同的或者更长生命周期时，请使用无主引用。
 */

// 弱引用
/*
 弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 销毁被引用的实例。这个特性阻止了引用变为循环强引用。
 声明属性或者变量时，在前面加上 weak 关键字表明这是一个弱引用。
 因为弱引用不会保持所引用的实例，即使引用存在，实例也有可能被销毁。
 因此，ARC 会在引用的实例被销毁后自动将其弱引用赋值为 nil。并且因为弱引用需要在运行时允许被赋值为 nil，所以它们会被定义为可选类型变量，而不是常量。
 你可以像其他可选值一样，检查弱引用的值是否存在，这样可以避免访问已销毁的实例的引用。
 */
class OtherPerson {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: OtherApartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class OtherApartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: OtherPerson?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var otherJohn: OtherPerson?
var otherUnit4A: OtherApartment?
otherJohn = OtherPerson(name: "John Applessed")
otherUnit4A = OtherApartment(unit: "4A")

otherJohn!.apartment = otherUnit4A
otherUnit4A!.tenant = otherJohn

otherJohn = nil
otherUnit4A = nil

// 无主引用
/*
 和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用在其他实例有相同或者更长的生命周期时使用。
 你可以在声明属性或者变量时，在前面加上关键字 unowned 表示这是一个无主引用。
 无主引用通常都被期望拥有值。不过 ARC 无法在实例被销毁后将无主引用设为 nil，因为非可选类型的变量不允许被赋值为 nil。
 使用无主引用，你必须确保引用始终指向一个未销毁的实例。
 如果你试图在实例被销毁后，访问该实例的无主引用，会触发运行时错误。
 
 对于需要禁用运行时的安全检查的情况（例如，出于性能方面的原因），Swift 还提供了不安全的无主引用。与所有不安全的操作一样，你需要负责检查代码以确保其安全性。 你可以通过 unowned(unsafe) 来声明不安全无主引用。如果你试图在实例被销毁后，访问该实例的不安全无主引用，你的程序会尝试访问该实例之前所在的内存地址，这是一个不安全的操作。
 */

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var jodan: Customer?
jodan = Customer(name: "jodan")
jodan!.card = CreditCard(number: 1234_5678_9012_3456, customer: jodan!)

jodan = nil

// 无主引用和隐式解包可选值属性
/*
 两个属性都必须有值，并且初始化完成后永远不会为 nil。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解包可选值属性。
 这使两个属性在初始化完成后能被直接访问（不需要可选解包），同时避免了循环引用。
 */
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        /*
         capitalCity 属性的默认值为 nil，但是不需要解包它的值就能访问它。
         由于 capitalCity 默认值为 nil，一旦 Country 的实例在构造器中给 name 属性赋值后，整个初始化过程就完成了。
         这意味着一旦 name 属性被赋值后，Country 的构造器就能引用并传递隐式的 self。
         使用隐式解包可选值值意味着满足了类的构造器的两个构造阶段的要求。capitalCity 属性在初始化完成后，能像非可选值一样使用和存取，同时还避免了循环强引用。
         */
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

// 闭包的循环强引用
/*
 循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了这个类实例时。
 循环强引用的产生，是因为闭包和类相似，都是引用类型。
 当你把一个闭包赋值给某个属性时，你是将这个闭包的引用赋值给了属性。实质上，这跟上面的问题是一样的——两个强引用让彼此一直有效。
 但是，和两个类实例不同，这次一个是类实例，另一个是闭包。
 */
class HTMLElement {
    let name: String
    let text: String?
    
    // 虽然闭包多次使用了 self，它只捕获 HTMLElement 实例的一个强引用。
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML)

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph!.asHTML)

// 解决闭包的循环强引用
/*
 在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。
 捕获列表定义了闭包体内捕获一个或者多个引用类型的规则。
 跟解决两个类实例间的循环强引用一样，声明每个捕获的引用为弱引用或无主引用，而不是强引用。
 应当根据代码关系来决定使用弱引用还是无主引用。
 
 Swift 有如下要求：只要在闭包内使用 self 的成员，就要用 self.someProperty 或者 self.someMethod()（而不只是 someProperty 或 someMethod()）。这提醒你可能会一不小心就捕获了 self。
 */
// 定义捕获列表
/*
 捕获列表中的每一项都由一对元素组成，一个元素是 weak 或 unowned 关键字，另一个元素是类实例的引用（例如 self）或初始化过的变量（如 delegate = self.delegate）。这些项在方括号中用逗号分开。
 */
/*
 如果闭包有参数列表和返回类型，把捕获列表放在它们前面。
lazy var someClosure = {
    [unowned self, weak delegate = self.delegate]
    (index: Int, stringToProcess: String) -> String in
    // 闭包的函数体
}
 */

/*
 如果闭包没有指明参数列表或者返回类型，它们会通过上下文推断，那么可以把捕获列表和关键字 in 放在闭包最开始的地方。
lazy var someClosure = {
    [unowned self, weak delegate = self.delegate] in
    // 闭包的函数体
}
 */

// 弱引用和无主引用
/*
 在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用。
 相反的，在被捕获的引用可能会变为 nil 时，将闭包内的捕获定义为 弱引用。
 弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为 nil。这使我们可以在闭包体内检查它们是否存在。
 注意: 如果被捕获的引用绝对不会变为 nil，应该用无主引用，而不是弱引用。
 */
class OtherHTMLElement {
    let name: String
    let text: String?
    
    // 虽然闭包多次使用了 self，它只捕获 HTMLElement 实例的一个强引用。
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var otherParagraph: OtherHTMLElement? = OtherHTMLElement(name: "p", text: "hello world")
print(otherParagraph!.asHTML)
otherParagraph = nil









