import Foundation

// 访问控制
/*
 访问控制可以限定其它源文件或模块对您的代码的访问。
 这个特性可以让你隐藏代码的实现细节，并且能提供一个借口让别人访问和使用你的代码。
 你可以明确地给单个类型（类、结构体、枚举）设置访问级别，也可以给这些类的属性、方法、构造器、下标等设置访问级别。
 协议也可以被限定在一定访问级别的范围内使用，包括协议里的全局常量、变量和函数。
 Swift不仅提供了多种不同的访问级别，还为某些典型场景提供了默认的访问级别，这样就不需要我们在每段代码中都显示声明访问级别。
 如果只是开发一个单target的引用程序，完全可以不用显示声明代码的访问级别。
 */

// 模块和源文件
/*
 Swift中的访问控制模型基于模块和源文件这两个概念。
 模块指的是独立的代码单元，框架或应用程序会作为一个独立的模块来构建和发布。
 在Swift中，一个模块可以使用import关键字导入另外一个模块。
 在Swift中，Xcode的每个target（例如框架或应用程序）都被当作独立的模块处理。
 如果你是为了实现某个通用的功能，或者是为了封装一些常用方法而将代码打包成独立的框架，这个框架就是Swift中的一个模块。
 当它被导入到某个应用程序或者其他框架时，框架的内容都将属于这个独立的模块。
 源文件就是Swift模块中的源代码文件（实际上，源文件属于一个应用程序或框架）。
 尽管我们一般会将不同的类型分别定义在不同的源文件中，但是同一个源文件也可以包含多个类型、函数等的定义。
 */

// 访问级别
/*
 Swift为代码中的实体提供了五种不同的访问级别。
 这些访问级别不仅与源文件中定义的实体相关，同时也与源文件所属的模块相关。
 * open和public 可以让实体被同一模块源文件中的所有实体访问，在模块外也可以通过导入该模块来访问源文件里的所有实体。
                通常情况下，你会使用open或public来指定框架的外部接口。
 * internal 让实体被同一模块源文件中的任何实体访问，但是不能被模块外的实体访问。
            通常情况下，如果某个接口只在应用程序或框架内部使用，就可以将其设置为 internal 级别。
 * fileprivate 限制实体只能在其定义的文件内部访问。
               如果功能的部分实现细节只需要在文件内使用时，可以使用fileprivate来将其隐藏。
 * private 限制实体只能在其定义的作用域，以及同一文件内的extension访问。
           如果功能的部分细节只需要在当前作用域内使用时，可以使用private来将其隐藏。
 
 open为最高访问级别（限制最少），private为最低访问级别（限制最多）。
 open只能作用于类和类的成员，它和public的区别主要在于open限定的类和成员能够在模块外能被继承和重写。
 将类的访问级别显示指定为open表明你已经设计好了类的代码，并且充分考虑过这个类在其他模块中用作父类时的影响。
 */

// 访问级别的基本原则
/*
 Swift中的访问级别遵循一个基本原则：实体不能定义在具有更低访问级别（更严格）的实体中。
 * 一个public的变量，其类型的访问级别不能是internal、fileprivate或是private。
   因为无法保证变量的类型在使用变量的地方也具有访问权限。
 * 函数的访问级别不能高于它的参数类型和返回类型的访问级别。
   因为这样就会出现函数可以在任何地方被访问，但是它的参数类型和返回类型却不可以的情况。
 */

// 默认访问级别
/*
 代码中所有的实体，如果不显式的指定它们的访问级别，那么它们将都有一个internal的默认访问级别（有一些情况列外）。
 因此大多数情况下不需要显示指定实体的访问级别。
 */

// 单个target应用程序的访问级别
/*
 当编写一个单target应用程序时，应用的所有功能都是为该应用服务，而不需要提供给其他应用或者模块使用，所以你不需要明确设置访问级别，使用默认的访问级别internal即可。
 但是，你也可以使用fileprivate或private访问级别，用于隐藏一些功能的实现细节。
 */

// 框架的访问级别
/*
 当你开发框架时，就需要把一些对外的接口定义为open或public访问级别，以便使用者导入该框架后可以正常使用其功能。
 这些被你定义为对外的接口，就是这个框架的API。
 框架的内部实现仍然可以使用默认的访问级别internal，当你需要对框架内部其它部分隐藏细节时可以使用private或fileprivate。
 对于框架的对外API部分，你就需要将它们设置为open或public了。
 */

// 单元测试target的访问级别
/*
 当你的应用程序包含单元测试target时，为了测试，测试模块需要访问应用程序模块中的代码。
 默认情况下只有open或public级别的实体才可以被其他模块访问。
 然而，如果在导入应用程序模块的语句前使用@testable特性，然后在允许测试的编译设置（Build Options -> Enable Testability）下编译这个应用程序模块，单元测试目标就可以访问应用程序模块中所有内部级别的实体。
 */

// 访问控制语法
/*
open class SomeOpenClass {}
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass{}

class SomeDefaultInternalClass {} // 隐式internal
var someDefaultConstant = 0  // 隐式internal
*/

// 自定义类型
/*
 如果想为一个自定义类型指定访问级别，在定义类型时进行指定即可。
 新类型只能在它的访问级别限制范围内使用。
 例如，定义了一个fileprivate级别的类，那这个类就只能在定义它的源文件中使用，可以作为属性类型、函数参数类型或者返回类型等等。
 一个类型的访问级别也会影响到类型成员(属性、方法、构造器、下标)的默认访问级别。
 如果你将类型指定为private或者fileprivate级别，那么该类型的所有成员的默认访问级别也会变成private或者fileprivate 级别。
 如果你将类型指定为internal或public（或者不明确指定访问级别，而使用默认的internal），那么该类型的所有成员的默认访问级别将是 internal。
 一个public类型的所有成员的访问级别默认为internal级别，而不是public级别。
 如果你想将某个成员指定为public级别，那么你必须显式指定。
 这样做的好处是，在你定义公共接口的时候，可以明确地选择哪些接口是需要公开的，哪些是内部使用的，避免不小心将内部使用的接口公开。
 */
public class SomePublicClass {  // 显式 public 类
    public var somePublicProperty = 0  // 显式 public 类成员
    var someInternalProperty = 0  // 隐式 internal 类成员
    fileprivate func someFilePrivateMethod() {}  // 显式 fileprivate 类成员
    private func somePrivateMethod() {}  // 显式 private 类成员
}

class SomeInternalClass {                       // 隐式 internal 类
    var someInternalProperty = 0                 // 隐式 internal 类成员
    fileprivate func someFilePrivateMethod() {}  // 显式 fileprivate 类成员
    private func somePrivateMethod() {}          // 显式 private 类成员
}

fileprivate class SomeFilePrivateClass {        // 显式 fileprivate 类
    func someFilePrivateMethod() {}              // 隐式 fileprivate 类成员
    private func somePrivateMethod() {}          // 显式 private 类成员
}

private class SomePrivateClass {                // 显式 private 类
    func somePrivateMethod() {}                  // 隐式 private 类成员
}

// 元组类型
/*
 元组的访问级别将由元组中访问级别最严格的类型来决定的。
 例如，如果构建了一个包含两种不同类型的元组，其中一个类型为internal，另一个类型为private，那么这个元组的访问级别为private。
 */

// 函数类型
/*
 函数的访问级别根据访问级别最严格的参数类型或返回类型的访问级别来决定。
 但是，如果这种访问级别不符合函数定义所在环境的默认访问级别，那么就需要明确地指定该函数的访问级别。
 */
/*
 错误定义
 func someFunction() -> (SomeInternalClass, SomePrivateClass) {
     // 此处是函数实现部分
 }
 */
/*
 正确定义
 private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
     // 此处是函数实现部分
 }
 */

// 枚举类型
/*
 枚举成员的访问级别和该枚举类型相同，你不能为枚举成员单独指定不同的访问级别。
 */
public enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 原始值和关联值
/*
 枚举定义中的任何原始值或关联值的类型的访问级别至少不能低于枚举类型的访问级别。
 例如，你不能在一个internal的枚举中定义private的原始值类型。
 */

// 嵌套类型
/*
 嵌套类型的访问级别和包含它的类型的访问级别相同，嵌套类型是public的情况除外。
 在一个public的类型中定义嵌套类型，那么嵌套类型自动拥有internal的访问级别。
 如果你想让嵌套类型拥有public访问级别，那么必须显式指定该嵌套类型的访问级别为public。
 */

// 子类
/*
 你可以继承同一模块中的所有有访问权限的类，也可以继承不同模块中被open修饰的类。
 一个子类的访问级别不得高于父类的访问级别。
 例如，父类的访问级别是internal，子类的访问级别就不能是public。
 此外，在同一模块中，你可以在符合当前访问级别的条件下重写任意类成员（方法、属性、构造器、下标等）。
 在不同模块中，你可以重写类中被open修饰的成员。
 可以通过重写给所继承类的成员提供更高的访问级别。
 */
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}

/*
 我们甚至可以在子类中，用子类成员去访问级别更低的父类成员，只要这一操作在相应访问级别的限制范围内。
 也就是说，在同一源文件中访问父类fileprivate级别的成员，在同一模块内访问父类internal级别的成员。
 */
public class AnotherA {
    fileprivate func someMethod() {}
}

internal class AnotherB: AnotherA {
    override internal func someMethod() {
        super.someMethod()
    }
}
    

// 常量、变量、属性、下标
/*
 常量、变量、属性不能拥有比它们的类型更高的访问级别。
 例如，你不能定义一个public级别的属性，但是它的类型却是private级别的。
 同样，下标也不能拥有比索引类型或返回类型更高的访问级别。
 如果常量、变量、属性、下标的类型是private级别的，那么它们必须明确指定访问级别为private：
 */
private var privateInstance = SomePrivateClass()

// Getter 和 Setter
/*
 常量、变量、属性、下标的Getters和Setters的访问级别和它们所属类型的访问级别相同。
 Setter的访问级别可以低于对应的Getter的访问级别，这样就可以控制变量、属性或下标的读写权限。
 在var或subscript关键字之前，你可以通过fileprivate(set)，private(set)或internal(set)为它们的写入权限指定更低的访问级别。
 这个规则同时适用于存储型属性和计算型属性。
 即使你不明确指定存储型属性的Getter和Setter，Swift也会隐式地为其创建Getter和Setter，用于访问该属性的存储内容。
 使用fileprivate(set)，private(set)和internal(set)可以改变 Setter 的访问级别，这对计算型属性也同样适用。
 */
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

/*
 可以在必要时为Getter和Setter显式指定访问级别。
 */
public struct AnotherTrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

// 构造器
/*
 自定义构造器的访问级别可以低于或等于其所属类型的访问级别。
 唯一的例外是必要构造器，它的访问级别必须和所属类型的访问级别相同。
 如同函数或方法的参数，构造器参数的访问级别也不能低于构造器本身的访问级别。
 */

// 默认构造器
/*
 Swift会为结构体和类提供一个默认的无参数的构造器，只要它们为所有存储型属性设置了默认初始值，并且未提供自定义的构造器。
 默认构造器的访问级别与所属类型的访问级别相同，除非类型的访问级别是public。
 如果一个类型被指定为public级别，那么默认构造器的访问级别将为internal。
 如果你希望一个public级别的类型也能在其他模块中使用这种无参数的默认构造器，你只能自己提供一个public访问级别的无参数构造器。
 */

// 结构体默认的成员逐一构造器
/*
 如果结构体中任意存储型属性的访问级别为private，那么该结构体默认的成员逐一构造器的访问级别就是private。
 否则，这种构造器的访问级别依然是internal。
 如同前面提到的默认构造器，如果你希望一个public级别的结构体也能在其他模块中使用其默认的成员逐一构造器，你依然只能自己提供一个 public访问级别的成员逐一构造器。
 */

// 协议
/*
 如果想为一个协议类型明确地指定访问级别，在声明协议时指定即可。
 这将限制该协议只能在适当的访问级别范围内被遵循。
 协议中的每个方法或属性都必须具有和该协议相同的访问级别。
 你不能将协议中的方法或属性设置为其他访问级别。
 这样才能确保该协议的所有方法或属性对于任意遵循者都可用。
 如果你定义了一个public访问级别的协议，那么该协议的所有实现也会是public访问级别。
 这一点不同于其他类型，例如，类型是public访问级别时，其成员的访问级别却只是internal。
 */

// 协议继承
/*
 如果定义了一个继承自其他协议的新协议，那么新协议拥有的访问级别最高也只能和被继承协议的访问级别相同。
 例如，你不能将继承自internal协议的新协议访问级别指定为public协议。
 */

// 协议遵循
/*
 一个类型可以遵循比它级别更低的协议。
 例如，你可以定义一个public级别类型，它能在别的模块中使用，
 但是如果它遵循一个internal协议，这个遵循的部分就只能在这个internal协议所在的模块中使用。
 遵循协议时的上下文级别是类型和协议中级别最小的那个。
 如果一个类型是public级别，但它要遵循的协议是internal级别，那么这个类型对该协议的遵循上下文就是internal级别。
 当你编写或扩展一个类型让它遵循一个协议时，你必须确保该类型对协议的每一个要求的实现，至少与遵循协议的上下文级别一致。
 例如，一个public类型遵循一个internal协议，这个类型对协议的所有实现至少都应是internal级别的。
 Swift和Objective-C一样，协议遵循是全局的，也就是说，在同一程序中，一个类型不可能用两种不同的方式实现同一个协议。
 */


// Extension
/*
 Extension可以在访问级别允许的情况下对类、结构体、枚举进行扩展。
 Extension的新增成员具有和原始类型成员一致的访问级别。
 例如，使用extension扩展了一个public或者internal类型，则extension中的成员就默认使用internal访问级别。
 如果使用extension扩展一个fileprivate类型，则extension中的成员默认使用fileprivate访问级别。
 如果使用extension扩展了一个private类型，则extension的成员默认使用private访问级别。
 可以通过修饰语重新指定extension的默认访问级别（例如，private），从而给该extension中的所有成员指定一个新的默认访问级别。
 这个新的默认访问级别仍然可以被单独成员指定的访问级别所覆盖。
 如果你使用extension来遵循协议的话，就不能显式地声明extension的访问级别。
 extension每个protocol要求的实现都默认使用protocol的访问级别。
 */

// Extension 的私有成员
/*
 扩展同一文件内的类，结构体或者枚举，extension里的代码会表现得跟声明在原类型里的一模一样。
 也就是说你可以这样：
 在类型的声明里声明一个私有成员，在同一文件的extension里访问。
 在extension里声明一个私有成员，在同一文件的另一个extension里访问。
 在extension里声明一个私有成员，在同一文件的类型声明里访问。
 这意味着你可以使用extension来组织你的代码，而且不受私有成员的影响。
 */
protocol SomeProtocol {
    func doSomething()
}

struct SomeStruct {
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}
// 泛型
/*
 泛型类型或泛型函数的访问级别取决于泛型类型或泛型函数本身的访问级别，还需结合类型参数的类型约束的访问级别，根据这些访问级别中的最低访问级别来确定。
 */

// 类型别名
/*
 你定义的任何类型别名都会被当作不同的类型，以便于进行访问控制。
 类型别名的访问级别不可高于其表示的类型的访问级别。
 例如，private级别的类型别名可以作为private、fileprivate、internal、public或者open类型的别名，
 但是public级别的类型别名只能作为public类型的别名，不能作为internal、fileprivate或private类型的别名。
 这条规则也适用于为满足协议遵循而将类型别名用于关联类型的情况。
 */

