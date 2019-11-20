//: Playground - noun: a place where people can play

import Cocoa

// 集合类型
/*
 数组：有序数据的集
 集合：无序无重复数据的集
 字典：无序的键值对的集
 */
// 集合的可变性：
/*
 如果创建一个Arrays、Sets、Dictionaries并且把它分配成一个变量，这个集合将会是可变的。
 这意味着我们可以在创建之后添加更多或移除已存在的数据项来改变这个集合的大小。如果我们把Arrays、Sets或Dictionaries分配成常量，那么它就是不可变的，它的大小不能被改变。
 */


// 数组
/*
 使用有序列表存储同一类型的多个值。相同的值可以多次出现一个数组的不同位置中。Swift的Array类型被桥接到Foundation中的NSArray类。
 数组的简单语法
 Array<Element>，其中Element是这个数组中唯一允许存在的数据类型。
 可以缩写数组的类型为 [Element]。尽管两种格式功能上相同，我们更推荐缩写并且全书涉及到数组类型的时候都会使用简写。
 */
//var array: Array<Int> = []

// 创建一个空数据组
/*
 使用构造语法来创建一个特定数据类型构成的空数组。
 通过构造函数的类型，someInts的值类型被推断为[Int]
 */
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
/*
 添加一个元素
 */
someInts.append(3)
/*
 如果上下文中已经提供了类型信息，你可以使用空数组语句创建一个空数组
 */
someInts = []

// 创建一个带有默认值得数组
/*
 Array类型提供了一个可以创建特定大小并且所有数据都被默认的构造方法。
 */
var threeDoubles = Array(repeating: 0.0, count: 3); // threeDoubles是一种[Double]数组，等价于[0.0, 0.0, 0.0]

// 通过两个数组相加创建一个数组
/*
 使用加法操作符 + 来组合两种已存在的相同类型数组。新数组的数据类型会被两个数组的数据类型中判断出来
 */
//
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// 用数组字面量构造数组
/*
  被声明为字符串类型的数组，记作[String]。这个数组被规定只有String一种数据结构
 */
var shoppingList: [String] = ["Eggs", "Milk"]

/*
 由于Swift的类型推断机制，用字面量构造拥有相同类型值数组的时候，可以不把数组的类型定义清楚。
 */
var otherShoppingList = ["Eggs", "Milk"]

// 访问和修改数组
/*
 通过数组的方法和属性来访问和修改数组，或者使用下标语法。
 */
/*
 使用数组的只读属性count来获取数组中的数据项数量
 */
print("The shopping list contains \(shoppingList.count) items.")

/*
 使用布尔值属性isEmpty作为检查count属性的值是否为0的捷径
 */
//
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

/*
 使用append(_:)方法在数组后面新的数据项。
 */
//
shoppingList.append("Flour")

/*
 也可用加法赋值运算符（+=）也可以直接在数组后面添加一个或多个拥有相同类型的数据项
 */
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

/*
 使用下标语法获取数组中的数据项
 */
var firstItem = shoppingList[0]

/*
 用下标来改变某个已有索引值对应的数据值
 */
shoppingList[0] = "Six eggs"

/*
 利用下标一次改变一系列数据值
 */
shoppingList[4...6] = ["Bananas", "Apples"]

/*
 调用数组的Insert(_:atIndex:)方法来在某个具体索引值之前添加数据项：
 */
//
shoppingList.insert("Maple Syrup", at: 0)

/*
 调用remove(at:)方法来移除数组中的某一项。
 这个方法把数组在特定索引值中存储的数据项移除并且返回这个被移除的数据项。
 */
let mapleSyrup = shoppingList.remove(at: 0)

/*
 如果只是想把数组的中最后一项移除可以使用removeLast()
 */
let apples = shoppingList.removeLast()

// 数组的遍历
for item in shoppingList {
    print(item)
}

/*
 如果需要每个数据项的值和索引值，可以使用enumerated()方法进行数组遍历。
 */
for (index, item) in shoppingList.enumerated() {
    print("item \(index + 1):\(item)")
}

// 集合
/*
 集合用来存储相同类型并且没有确定顺序的值。
 当即和元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
 */

// 集合类型的哈希值
/*
 一个类型为了存储在集合中，该类型必须是可哈希化的，该类型必须提供一个方法来计算它的哈希值。
 一个哈希值是Int类型的，相等的对象哈希值必须相同，比如a == b, 因此必须a.hashValue == b.hashValus
 Swift的所有基本类型默认都是可哈希化的，可以作为集合的值的类型或者字典的键的类型。
 自定义类型作为集合值或者在字典键的类型，但需要使自定义类型遵循Swift标准库中的Hashable协议。
 */


// 集合类型的语法
/*
 集合类型被写为Set<Element>，和数组不同的是，集合没有等价的简化形式。
 */

// 创建和构造一个空的集合
/*
 通过构造器语法创建一个特定类型的空集合
 */
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count)")

/*
 上下文提供了类型信息，比如作为函数的参数或者已知类型的变量或者常量，我们可以通过一个空的数组字面量创建一个空的Set:
 */
letters.insert("a")
letters = [] // letters现在是一个空的Set,但是它依然是Set<Character>

// 用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// 简化
/*
 由于这个特定集合制定了值为String类型，根据Swift类型推断功能，可以采用简化方式
 */
var otherFavoriteGenres: Set = ["Rock", "Classical", "Hip hop"] // 由于数组字面量中的所有元素类型相同，Swift可以推断出Set<String>为正确类型

// 访问和修改一个集合
//
/*
 Set中的数量
 */
print("I have \(favoriteGenres.count) favorite music genres.")

/*
 检查Count是否为0
 */
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

/*
 添加一个新元素
 */
favoriteGenres.insert("Jazz")

/*
 删除一个元素
 */
if let removeGenre = favoriteGenres.remove("Rock") { // 如果该值是Set的一个元素则删除并返回被删除的元素值，否则返回nil
    print("\(removeGenre)? I'm over ir.")
} else {
    print("I never much cared for that.")
}
 
/*
 删除所有元素
 */
//favoriteGenres.removeAll(）

/*
 判断Set是否包含一个特定的值
 */
favoriteGenres.contains("Fuck")

// 遍历一个集合
for genre in favoriteGenres {
    print(genre)
}

/*
 集合没有确定的顺序，为了按照特定顺序来遍历一个Set可以使用sorted()方法，返回一个有序数组，这个数组的元素排列由操作符<对元素进行比较的结果来确定
 */
for genre in favoriteGenres.sorted() {
    print(genre)
}

// 集合的操作
/*
 组合两个集合，判断两个集合共有元素，判断两个集合是否全包含、部分包含或者不相交
 */

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitprimeNumbers: Set = [2, 3, 5, 7]

/*
 使用union(_:)方法根据两个集合的所有值创建一个新的集合。并集
*/
let unionArray = oddDigits.union(evenDigits).sorted()

/*
 使用intersect(_:)方法根据两个集合中都包含的值创建一个新的集合。交集
 */
let intersectArray = oddDigits.intersection(evenDigits).sorted()

/*
 使用symmetricDifference(_:)方法根据两个集合不相交的值创建一个新的集合。交集的补集
 */
let symmetricDifferenceArray = oddDigits.symmetricDifference(singleDigitprimeNumbers).sorted()

/*
 使用subtract(_:)方法根据不在另一个集合中的值创建一个新的集合。
*/
let subtractArray = oddDigits.subtracting(singleDigitprimeNumbers).sorted()


// 集合成员关系和相等
let houseAnimals: Set = ["🐶", "🐱"]
let otherHouseAnimals: Set = ["🐶", "🐱"]

let farmeAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals:Set = ["🐦", "🐭"]

/*
 使用“是否相等”运算符（==）来判断两个集合是否包含全部相同的值。
 */
if houseAnimals == otherHouseAnimals {
    print("houseAnimals == otherHouseAnimals")
} else {
    print("houseAnimals != otherHouseAnimals")
}
/*
 使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
 */
if houseAnimals.isSubset(of: farmeAnimals) {
    print("houseAnimals is subset of farmeAnimals")
} else {
    print("houseAnimals is not subset of farmeAnimals")
}

/*
 使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
*/
farmeAnimals.isSuperset(of: houseAnimals)
/*
 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
*/
houseAnimals.isStrictSubset(of: farmeAnimals)
farmeAnimals.isStrictSuperset(of: houseAnimals)

/*
 使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值。(是否没有交集)
*/
farmeAnimals.isDisjoint(with:cityAnimals)

// 字典
// 字典类型的快捷语法
/*
 swift的字典使用Dictionary<key, value>定义。一个字典的key必须遵守Hashable协议
 */

// 创建一个空字典
/*
 构造语法
 */
var namesOfIntegers = [Int: String]()
/*
 如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作[:]
 */
//
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

// 用字典字面量来创建字典
var airpots:[String: String] = ["YYZ":"Toronto", "DUB":"Dublin"]

/*
 我们在用字典字面量构造字典时，如果它的键和值都有各自一致的类型，那么就不必写出字典的类型。airports字典也可以用这种简短方式定义：
 */
var otherAirpots = ["YYZ":"Toronto", "DUB":"Dublin"]

// 访问和修改字典
/*
 字典的只读属性count来获取某个字典的数据项数量
 */
print("The dictionary of airpotrs contains \(airpots.count) iterms.")

/*
 isEmpty来快捷地检查字典的count属性是否等于0
 */
if airpots.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

/*
 使用下标语法来添加新的数据项
 */
airpots["LHR"] = "London"

/*
 也可以使用下标语法来改变特定键对应的值
 */
airpots["LHR"] = "London Healthrow"

/*
 updateValue(_:forKey)方法可以设置或者更新特定键对应的值，在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的值。
 这个方法返回更新值之前的原值(可选值)。我们可以检查更新是否成功。
 */
if let oldValue = airpots.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

/*
 使用下标语法来在字典中检索特定对应的值。字典的下标访问会返回对应值的类型的可选值。
 */
if let airportName = airpots["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

/*
 通过下标语法来通过某个键的对应值赋值nil来从字典里删除一个键值对
 */
//
airpots["APL"] = "Apple Internation"
airpots["APL"] = nil

/*
 removeValue(forKey:)方法也可以用来在字典中移除键值对。
 这个方法在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有对应值的情况下返回 nil
 */
if let removedValue = airpots.removeValue(forKey: "DUB") {
    print("The Removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

// 字典遍历
/*
 遍历时，数据项以（key, value）元组形式返回，并且可以使用临时常量或变量来分解这些元组。
 */
for (airportCode, airportName) in airpots {
    print("\(airportCode):\(airportName)")
}

/*
 通过访问keys或者values属性，也可以遍历字典的键或者值
 */
for airportCode in airpots.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airpots.values {
    print("Airport name: \(airportName)")
}

/*
 若需要某个字典的键集合或者值集合来作为某个接受Array实例，可以直接使用keys或者values属性构造一个新数组
 */
let airportCodes = [String](airpots.keys)
let airportNames = [String](airpots.values)



















