//: Playground - noun: a place where people can play

import Cocoa

// 集合类型
// 集合的可变性：如果创建一个Arrays、Sets、Dictionaries并且把它分配成一个变量，这个集合将会是可变的。这意味着我们可以在创建之后添加更多或移除已存在的数据项来改变这个集合的大小。如果我们把Arrays、Sets或Dictionaries分配成常量，那么它就是不可变的，它的大小不能被改变。

// 数组  使用有序列表存储同一类型的多个值。相同的值可以多次出现一个数组的不同位置中。Swift的Array类型被桥接到Foundation中的NSArray类。
// 数组的简单语法
// Array<Element>，其中Element是这个数组中唯一允许存在的数据类型。可以缩写数组的类型为 [Element]。尽管两种格式功能上相同，我们更推荐缩写并且全书涉及到数组类型的时候都会使用简写。

// 创建一个空数据组
var someInts = [Int]()  // 通过构造函数的类型，someInts的值类型被推断为[Int]
var array1: Array<Int> = []
print(array1.count)

someInts.append(3)
someInts = []

// 创建一个带有默认值得数组
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)  // 创建特定大小并且所有数据都被默认的构造方法

// 通过两个数组相加创建一个数组
// 使用加法操作符 + 来组合两种已存在的相同类型数组。新数组的数据类型会被两个数组的数据类型中判断出来
var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

// 用字面量构造数组
var shoppingList: [String] = ["Eggs", "Milk"]  // 被声明为字符串类型的数组，记作[String]。这个数组被规定只有String一种数据结构
// 由于类型推断机制
var otherShoppingList = ["Eggs", "Milk"]
var array2 = ["1", 1]
array2.append(1)
//otherShoppingList.append(1)   // error, otherShoppingList是[String],是单一类型数组。array2是多种类型的数组

// 访问和修改数组
// 通过数组的方法和属性来访问和修改数组，或者使用下标语法。
// 使用数组的只读属性count来获取数组中的数据项数量
shoppingList.count
// 使用布尔值属性isEmpty作为检查count属性的值是否为0的捷径
shoppingList.isEmpty
// 使用append(_:)方法在数组后面新的数据项。也可用加法赋值运算符（+=）也可以直接在数组后面添加一个或多个拥有相同类型的数据项
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

// 使用下标语法获取数组中的数据项
var firstItem = shoppingList[0]

// 用下标来改变某个已有索引值对应的数据值
shoppingList[0] = "Six eggs"

// 利用下标一次改变一系列数据值
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)
// 调用数组的Insert(_:atIndex:)方法来在某个具体索引值之前添加数据项：
shoppingList.insert("Maple Syrup", atIndex: 0)

// 调用removeAtIndex(_:)方法来移除数组中的某一项。这个方法把数组在特定索引值中存储的数据项移除并且返回这个被移除的数据项。
let mapleSyrup = shoppingList.removeAtIndex(0)
print(mapleSyrup)

// 如果只是想把数组的中最后一项移除可以使用removeLast()
let apples = shoppingList.removeLast()

// 数组的遍历
for item in shoppingList {
    print(item)
}

for (index, item) in shoppingList.enumerate() {
    print("item \(index + 1):\(item)")
}

// 集合
// 集合用来存储相同类型并且没有确定顺序的值。当即和元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
// 集合类型的哈希值











