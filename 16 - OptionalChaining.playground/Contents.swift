//: Playground - noun: a place where people can play

import UIKit

// 可选链
/*
 可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。
 如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。
 多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil。
 */

// 使用可选链式调用代替强制展开
/*
 通过在想调用的属性、方法，或下标的可选值后面放一个问号？，可以定义一个可选链。
 这一点很像在可选值后面放一个叹号！来强制展开它的值。
 它们主要区别在于当可选值为空时可选链式调用值会调用失败，然而强制展开将会触发运行时错误。
 可选链式调用返回的结果都是一个可选值。
 通过这个返回值来判断可选链式调用是否调用成功，如果调用有返回值则说明调用成功，返回nil则说明失败。
 可选链式调用的返回结果与原本的返回结果具有相同类型，但是被包装成了一个可选值。
 例如，使用可选链式调用访问属性，当可选链式调用成功时，如果属性原本的返回结果是Int类型，则会变为Int？类型。
 */

class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue;
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name;
    }
}

class Address {
    var buildingName: String? // 大厦名称
    var buildingNumber: String? // 大厦号码
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber)\(street)"
        } else {
            return nil
        }
    }
}



let john = Person()

/*
 使用！强制展开
 */
//let roomCount = john.residence!.numberOfRooms   //  residence是可选类型，为nil，触发运行时错误

/*
 可选链式 ？ 调用
 */
if let roomCount = john.residence?.numberOfRooms {
    print("john's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

/*
 注意，即使numberOfRooms是非可选的Int,只要使用可选链式调用就意味着numberOfRooms会返回一个Int?而不是Int。
 */
john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms { // 返回值为1的Int?类型的值
    print("john's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

// 为可选链式调用定义模型类
/*
 通过使用可选链式调用可以调用多层属性、方法和下标。
 这样可以在复杂的模型中向下访问各种子属性、并且判断能否访问子属性的属性、方法和下标。
 */

// 通过可选链式调用访问属性
/*
 可以通过可选链式调用一个可选值上访问它的属性，并判断访问是否成功。
 还可以通过可选链式调用来设置属性值。
 
 */
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress
/*
 上面代码中的赋值过程是可选链式调用的一部分，这意味着可选链式调用失败时，等号右侧的代码不会被执行。
 下面代码完成了同样的事情，但是它会使用一个函数来创建Address实例，然后将该实例返回用于赋值。
 该函数会在返回前打印"Function was called"，这使你能验证等号右侧的代码是否被执行。
 */
func creatAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}

john.residence?.address = creatAddress()

// 通过可选链式调用来调用方法
/*
 可以通过可选链式调用来调用方法，并判断是否调用成功，即使这个方法没有返回值。
 如果这个方法没有返回值，在可选值上通过可选链式调用来调用这个方法，该方法的返回类型回事Void?，而不是 Void。
 因为通过可选链式调用得到的返回值都是可选的。
 这样就可以使用 if 语句来判断能否成功调用，即使方法本身没有定义返回值。通过判断返回值是否为 nil 可以判断调用是否成功。
 */
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

/*
 同样的，可以据此判断通过可选链式调用为属性赋值是否成功
 */
if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}

// 通过可选链式调用访问下标
/*
 通过可选链式调用，可以在一个可选值上访问下标，并且判断下标调用是否成功。
 可选链式调用访问可选值的下标时，应该将问号放在下标方括号的前面而不是后面。
 可选链式调用的问号一般直接跟在可选表达式的后面。
 */
john.residence?.rooms.append(Room(name: "Living Room"))
john.residence?.rooms.append(Room(name: "Kitchen"))

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

/*
 类似的，可以通过下标，用可选链式调用来赋值
 */
john.residence?[0] = Room(name: "Bathroom")

// 访问可选类型的下标
/*
 如果下标返回可选类型值，可以在下标的结尾后面放一个问号来在其可选值上进行可选链式调用。
 */
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

// 连接多层可选链式调用
/*
 可以通过连接多个可选链式调用在更深的模型层级中访问属性、方法以及下标。
 然而，多层可选链式调用不会增加返回值的可选层级。
 也就是说：
 * 如果你访问的值是不可选的，可选链式调用将会返回可选值。
 * 如果你访问的值就是可选的，可选链式调用不会让可选返回值变得更可选。
 因此：
 * 通过可选链式调用访问一个Int值，将会返回Int?，无论使用了多少层可选链式调用。
 * 类似的，通过可选链式调用访问Int?值，依旧会返回Int?值，并不会返回Int??。
 */
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

// 在方法的可选返回值上进行可选链式调用
/*
 可以在一个可选值上通过可选链式调用来调用方法，并且可以根据需要继续在方法的可选返回值上进行可选链式调用。
 */
if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}

/*
 如果要在该方法的返回值上进行可选链式调用，在方法的院落好后面加上问号即可。
 */
if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
