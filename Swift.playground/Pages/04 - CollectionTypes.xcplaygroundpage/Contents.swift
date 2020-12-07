import Foundation

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
 添加元素
 */
someInts.append(3)
someInts.append(contentsOf: 4...10)

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
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

// 添加
/*
 使用append(_:)方法在数组后面新的数据项。
 append(contentsOf:)在末尾添加多个数据项
 */
shoppingList.append("Flour")
shoppingList.append(contentsOf: ["ccc", "ddd"])

/*
 也可用加法赋值运算符（+=）也可以直接在数组后面添加一个或多个拥有相同类型的数据项
 */
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

// 索引
/*
 startIndex返回第一个元素的位置，对数组来说，永远是0.
 endIndex返回最后一个元素索引+1的位置，对数组来说，永远等同于count。
 如果数组为空，startIndex == endIndex
 */
print(shoppingList.startIndex)
print(shoppingList.endIndex)

/*
 indices 获取数组的索引区间
 */
for i in shoppingList.indices {
    print(i)
}

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

// 查找
/*
 判断是否包含指定元素
 contains判断数组是否包含给定元素
 contains(where:)判断数组是否包含符合给定条件的元素
 */
print(shoppingList.contains("Six eggs"))

let result = shoppingList.contains { (item) -> Bool in
    return item.hasPrefix("Six")
}
print(result)
print(shoppingList.contains { $0.hasPrefix("Six") })  // 简写

/*
 判断所有元素符合某个条件
 allSatisfy(_:)判断数组的每一个元素都符合给定的条件
 */
print(shoppingList.allSatisfy { $0.hasSuffix("s") })

/*
 查找元素
 first返回数组第一个元素(可选)，如果数组为空，返回nil
 last返回数组最后一个元素(可选)，如果数组为空，返回nil
 first(where:)返回数组第一个符合给定条件的元素(可选)
 last(where:)返回数组最后一个符合给定条件的元素(可选)
 */
if let firstItem = shoppingList.first {
    print(firstItem)
}
if let lastItem = shoppingList.last {
    print(lastItem)
}

if let firstItem = shoppingList.first(where: { $0.hasSuffix("s")}) {
    print(firstItem)
}
if let lastItem = shoppingList.last(where: { $0.hasPrefix("Six")}) {
    print(lastItem)
}

/*
 查找索引
 firstIndex 返回给定的元素在数组中出现的第一个位置(可选)
 lastIndex 返回给定的元素在数组中出现的最后一个位置(可选)
 */
if let index = shoppingList.firstIndex(of: "Six eggs") {
    print(index)
}

if let index = shoppingList.lastIndex(of: "Bananas") {
    print(index)
}

/*
 查找最大最小元素
 max() 返回数组最大的元素
 min() 返回数组最小的元素
 max(by:) 利用给定的方式比较元素并返回数组最大的元素
 min(by:) 利用给定的方式比较元素并返回数组最小的元素
 */
if let max = shoppingList.max() {
    print(max)
}
if let min = shoppingList.min() {
    print(min)
}
if let max = shoppingList.max(by: { a, b in a < b }) {
    print(max)
}
if let min = shoppingList.min(by: { a, b in a < b }) {
    print(min)
}

// 插入
/*
 调用数组的insert(_:at:)方法来在某个具体索引值之前添加数据项。
 insert(contentsOf:at:)在指定位置插入多个数据项。
 */
shoppingList.insert("Maple Syrup", at: 0)
shoppingList.insert(contentsOf: ["aaa", "bbb"], at: 0)
/*
 字符数组插入
 字符串也是Collection, Element类型是Character
 */
var chars: [Character] = ["a", "b", "c"]
chars.insert(contentsOf: "hello", at: 0)
print(chars)


// 删除
/*
 调用remove(at:)方法来移除数组中的某一项。
 这个方法把数组在特定索引值中存储的数据项移除并且返回这个被移除的数据项。
 注意：该方法返回的并不是可选值，没有数组越界检查。
 */
let mapleSyrup = shoppingList.remove(at: 0)

/*
 removeFirst()移除并返回数组的第一个元素
 注意：该方法返回的并不是可选值，没有数组越界检查。
 */
let fistItem = shoppingList.removeFirst()



/*
 如果只是想把数组的中最后一项移除可以使用removeLast()
 注意：该方法返回的并不是可选值，没有数组越界检查。
 */
let apples = shoppingList.removeLast()

/*
 popLast()移除并返回数组的最后一个元素(可选)，数组为空返回nil
 注意：该方法返回的是可选值、注意与上述删除方法的区别
 */
if let popItem = shoppingList.popLast() {
    print(popItem)
}

/*
 移除多个元素
 removeFirst(_:)移除数组前面多个元素
 removeLast(_:)移除数组后面对个元素
 removeSubrange(1...2)移除数组中给定范围的元素
 removeAll()移除数组所有元素
 removeAll(where:)移除数组中符合给定条件的元素
 removeAll(keepingCapacity:)移除数组所有元素，保留数组容量
 */
shoppingList.removeFirst(2)
shoppingList.removeLast(2)
shoppingList.removeSubrange(1...2)
//shoppingList.removeAll()
//shoppingList.removeAll(where: { $0.hasPrefix("S") })
shoppingList.removeAll(keepingCapacity: true)
print(shoppingList.capacity)

// ArraySlice
/*
 ArraySlice是数组或者其他ArraySlice的一段连续切片，和原数组共享内存。
 当改变ArraySlice的时候，ArraySlice会copy出来，形成单独内存。
 ArraySlice拥有和Array基本完全类似的方法。
 */
let colors = ["Neutral", "Orange", "White", "Black", "Red", "Yellow"]  // Array<String>
colors[1...5] // ArraySlice<String>

/*
 通过Drop得到ArraySlice
 dropFirst(:)"移除"原数组前面指定个数的元素得到一个ArraySlice
 dropLast(:)"移除"原数组后面指定个数的元素得到一个ArraySlice
 drop(:)"移除"原数组符合指定条件的元素得到一个ArraySlice
 */
let numberArray = [5, 2, 10, 1, 0, 100, 46, 99]
print(numberArray.dropFirst())   // [2, 10, 1, 0, 100, 46, 99]
print(numberArray.dropFirst(3))  // [1, 0, 100, 46, 99]
print(numberArray.dropLast())    // [5, 2, 10, 1, 0, 100, 46]
print(numberArray.dropLast(3))   // [5, 2, 10, 1, 0]
print(numberArray.drop { $0 < 15 })  // [100, 46, 99]

/*
 通过prefix得到ArraySlice
 prefix() 获取数组前面指定个数的元素组成的ArraySlice
 prefix(upTo:) 获取数组到指定位置（不包含指定位置）前面的元素组成的ArraySlice
 prefix(through:) 获取数组到指定位置（包含指定位置）前面的元素组成的ArraySlice
 prefix(while:) 获取数组前面符合条件的的元素（到第一个不符合条件的元素截止）组成的ArraySlice
 */
print(numberArray.prefix(4))               // [5, 2, 10, 1]
print(numberArray.prefix(upTo: 4))         // [5, 2, 10, 1]
print(numberArray.prefix(through: 4))      // [5, 2, 10, 1, 0]
print(numberArray.prefix { $0 < 10 })      // [5, 2]

/*
 通过suffix 得到ArraySlice
 suffix() 获取数组后面指定个数的元素组成的ArraySlice
 suffix(from:) 获取数组从指定位置到结尾（包含指定位置）的元素组成的ArraySlice
 */
print(numberArray.suffix(3))           // [100, 46, 99]
print(numberArray.suffix(from: 5))     // [100, 46, 99]

/*
 通过Range得到ArraySlice
 可以通过对数组索引指定Range获取ArraySlice，可以使用闭区间、半开半闭区间、单侧区间、甚至可以使用...来获取整个数组组成的ArraySlice
 */
print(numberArray[3...5])         // [1, 0, 100]
print(numberArray[3..<5])         // [1, 0]
print(numberArray[...2])          // [5, 2, 10]
print(numberArray[..<2])          // [5, 2]
print(numberArray[6...])          // [46, 99]
print(numberArray[...])           // [5, 2, 10, 1, 0, 100, 46, 99]

/*
 ArraySlice转为Array
 ArraySlice无法直接复制一个Array的常量或变量，需要使用Array(slice)
 */
let slice = numberArray[3...5]
let otherNumberArray = Array(slice)

/*
 ArraySlice和原Array是相互独立的，它们添加删除元素不会影响对方
 */
var someNumberArray = [10, 46, 99]
var someSlice = someNumberArray.dropLast()
someNumberArray.append(333)
someSlice.append(555)
print(someNumberArray)
print(someSlice)

// 数组重排
/*
 数组元素的随机化
 shuffle() 在原数组上将数组元素打乱，只能作用在数组变量上
 shuffled()返回原数组的随机化数组，可以作用在数组变量和常量上
 */
var numbers1 = [Int](1...8)
numbers1.shuffle()
print(numbers1)

let numbers2 = [Int](1...8)
var shuffledNumbers = numbers2.shuffled()
print(shuffledNumbers)

/*
 数组的逆序
 reverse() 在原数组上将数组逆序，只能作用在数组变量上。
 reversed() 返回原数组的逆序"集合表示"，可以作用在数组变量和常量上，该方法不会分配新内存空间。
 */
var numbers3 = [Int](1...8)
numbers3.reverse()
print(numbers3)

let numbers4 = [Int](1...8)
var reversedNumbers = numbers4.reversed()
print(reversedNumbers)

/*
 数组的分组
 partition 将数组以某个条件分组，数组前半部分否是不符合条件的元素，数组后半部分都是符合条件的元素。
 */
var numbers5 = [10, 20, 45, 30, 98, 101, 30, 4]
let index = numbers5.partition { (element) -> Bool in
    element > 30
}
print(numbers5)
let partition1 = numbers5[..<index]
let partition2 = numbers5[index...]
print(partition1)
print(partition2)

/*
 数组的排序
 sort() 在原数组上将元素排序，只能作用于数组变量
 sorted() 返回原数组的排序结果数组，可以作用于数组变量和常量上。
 */
var numbers6 = [10, 20, 45, 30, 98, 101, 30, 4]
numbers6.sort()
print(numbers6)

let numbers7 = [10, 20, 45, 30, 98, 101, 30, 4]
var sortedNumbers = numbers7.sorted()
print(sortedNumbers)

/*
 交换数组两个元素
 swapAt(_:_:)交换指定位置的两个元素
 */
var numbers8 = [10, 20, 45, 30, 98, 101, 30, 4]
numbers8.swapAt(numbers8.startIndex, numbers8.endIndex - 1)
print(numbers8)

// 数组拼接
/*
 字符串数组拼接
 joined() 拼接字符串数组里的所有元素为一个字符串
 joined(separator:) 以给定的分隔符拼接字符串数组里的所有元素为一个字符串
 */
var strings = ["hello", "world"]
print(strings.joined())
print(strings.joined(separator: ", "))

/*
 元素为Sequence数组的拼接
 joined() 拼接数组里的所有元素为一个更大的Sequence
 joined(separator:) 以给定的分隔符拼接数组里的所有元素为一个更大的Sequence
 */
let ranges = [0..<3, 8..<10, 15..<17]
for range in ranges {
    print(range)
}
for i in ranges.joined() {
    print(i)
}

let nestedNumbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let joined = nestedNumbers.joined(separator: [-1, -2])
print(joined)

// 数组的遍历
/*
 for-in
 */
for item in shoppingList {
    print(item)
}

/*
 * forEach
 - 无法使用break或continue跳出或者跳过循环
 - 使用return只能退出当前一次循环的执行体
 */
shoppingList.forEach { (item) in
    if item == "Six eggs" {
        return
    }
    print(item)
}

/*
 迭代器
 */
var shoppingListIterator = shoppingList.makeIterator()
while let item = shoppingListIterator.next() {
    print(item)
}

/*
 如果需要每个数据项的值和索引值，可以使用enumerated()方法进行数组遍历。
 */
for (index, item) in shoppingList.enumerated() {
    print("item \(index + 1):\(item)")
}

for index in 0..<shoppingList.count { // 等价普通写法
    print("item \(index + 1):\(shoppingList[index])")
}

// 集合
/*
 集合用来存储相同类型并且没有确定顺序的值。
 当即和元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
 三个特性：确定性、互斥性、无序性。
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
/*
 Set中的数量
 使用count获取Set里元素个数
 */
print("I have \(favoriteGenres.count) favorite music genres.")

/*
 使用isEmpty判断Set是否为空
 */
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

/*
 insert(_:)添加一个新元素
 update(with:)如果已经有相等的元素，替换为新元素。如果Set没有，则插入。示例在哈希值处。
 */
favoriteGenres.insert("Jazz")

/*
 remove(_:)删除一个元素，如果该值是Set的一个元素则删除并返回被删除的元素值，否则返回nil
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
 removeFirst() 删除Set的第一个元素，因为Set是无序的，所以第一个元素并不是放入的第一个元素，是哈希值排序好的第一个元素
 */
favoriteGenres.removeFirst()

/*
 判断Set是否包含一个特定的值
 */
favoriteGenres.contains("Fuck")

// 遍历一个集合
/*
 for-in
 */
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
 使用symmetricDifference(_:)方法根据两个集合不相交的值创建一个新的集合。交集的补集、对称差集
 */
let symmetricDifferenceArray = oddDigits.symmetricDifference(singleDigitprimeNumbers).sorted()

/*
 使用subtract(_:)方法根据不在另一个集合中的值创建一个新的集合。相对补集
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
 
// 集合类型的哈希值
/*
 一个类型为了存储在集合中，该类型必须是可哈希化的，该类型必须提供一个方法来计算它自身的哈希值。
 一个哈希值是Int类型的，相等的对象哈希值必须相同，比如a == b, 因此必须a.hashValue == b.hashValus
 Swift的所有基本类型默认都是可哈希化的，可以作为集合的值的类型或者字典的键的类型。
 自定义类型作为集合值或者在字典键的类型，但需要使自定义类型遵循Swift标准库中的Hashable协议。
 */
/*
 自定义类型实现Hashable协议
 */
struct Person {
    var name: String
    var age: Int
}

extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}

var personSet = Set<Person>()
personSet.insert(Person(name: "zhangsan", age: 28))

/*
 update(with:)如果已经有相等的元素，替换为新元素。如果Set没有，则插入
 */
personSet.insert(Person(name: "lisi", age: 29))
personSet.update(with: Person(name: "zhangsan", age: 38))
personSet.update(with: Person(name: "wamgwu", age: 18))

/*
 filter(_:)返回一个新的Set，新Set的元素是原始Set符合条件的元素
 */
let otherPersonSet = personSet.filter { $0.age > 20}
print(personSet)
print(otherPersonSet)

// 字典
// 字典类型的快捷语法
/*
 swift的字典使用Dictionary<key, value>定义。
 字典存储无序的互相关联的同一类型的键和同意类型的值的集合
 一个字典的key必须遵守Hashable协议
 */

// 创建一个空字典
var namesOfIntegers = Dictionary<Int, String>() // 全写，构造器初始化
//var namesOfIntegers = [Int: String]()   // 简写，构造器初始化
//var namesOfIntegers: Dictionary <Int, String> = [:] // 字面量

/*
 如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作[:]
 */
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

/*
 合并两个字典
 */
print("merge before: \(airpots)")
airpots.merge(["LHR": "London", "SH": "ShangHai"]) { (currentValue, _) in currentValue}
airpots.merge(["LHR": "New London", "SH": "ShangHai"]) { (_, newValue) in newValue}

/*
 虽然字典是无序的，但是每个key-Value键值对在扩容之前，位置是稳定的。
 如果需要保持顺序的key-value键值对，可以使用KeyValuePairs
 */
let imagePaths = ["Star": "/glyphs/star.png",
                  "portrait": "/images/content/portrait.jpg",
                  "spacer": "/images/shared/spacer.gif"]
//let glyphIndex = imagePaths.firstIndex(where: { $0.value.hasPrefix("/glyphs") })
let glyphIndex = imagePaths.firstIndex { (_, value) -> Bool in
    value.hasPrefix("/glyphs")
}
if let index = glyphIndex {
    print(index)
    print("The '\(imagePaths[index].key)' image is a glyphs.")
} else {
    print("No glyphs found!")
}

let recordTimes: KeyValuePairs = ["florence Griffith-Joyber": 10.49,
                                  "Evelyn Ashford": 10.76,
                                  "Evelyn Ashford": 10.79,
                                  "Marlies Gohr": 10.81]
print(recordTimes.first!)

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

/*
 因为字典时无序的，如果要以特定的顺序遍历字典的键或值，使用键或值的Sorted()方法
 */
for airportCode in airpots.keys.sorted() {
    print("Airport code: \(airportCode)")
}
