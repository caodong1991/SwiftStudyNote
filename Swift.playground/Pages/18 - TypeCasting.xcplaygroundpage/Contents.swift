import Foundation

// 类型转换
/*
 类型转换可以判断实例的类型，也可以将实例看做是其父类或者子类的实例。
 类型转换在swift中使用is和as操作符实现。
 is：检查值的类型
 as：转换它的类型
 也可以用来检查一个类是否遵循了某个协议。
 */

// 为类型转换定义类层次
/*
 可以将类型转换用在类和子类的层次结构上，检查特定类实例的类型并且转换这个类实例的类型称为这个层次结构中的其他类型。
 */
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String  // 导演
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String // 艺术家
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

/*
 library的类型是在它被初始化时根据它数组中所包含的内容推断出来的。
 swift的类型检测器能够推断出Movie和Song有共同的父类MediaItem,所以推断出MediaItem类作为library的类型。
 library里存储的媒体依然是Movice和Song类型的。
 但是，若迭代依次取出的实例会是MediaItem类型的。
 */
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

// 类型检查
/*
 用类型检查操作符is来检查一个实例是否属于特定子类。
 若实例属于那个子类型，类型检查操作符返回true否则返回false
 */
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs") // 2 3

// 向下转型
/*
 某类型的一个常量或变量可能在幕后实际上属于一个子类。
 当确定是这种情况时，可以尝试用类型转换操作符 as? 或 as! 向下转到它的子类型。
 因为向下转型可能会失败，类型转型操作符带有两种不同形式。
 条件形式 as?  返回一个你试图向下转型成的类型的可选值。
 强制形式 as! 把试图向下转型和强制解包转换结果结合为一个操作。
 当不确定向下转型可以成功时，用类型转换的条件形式 as? 。
 条件形式的类型转换总是返回一个可选值，并且向下转是不可能的，可选值将是nil。能够检查向下转型是否成功。
 只有确定向下转型一定会成功时，才使用强制形式 as!.
 当试图向下转型为一个不正确的类型时，强制形式的类型转换会触发一个运行时错误。
 转换没有真的改变实例或它的值。根本的实例保持不变；只是简单把它作为它被转换成的类型来使用。
 */
for item in library {
    if let movie = item as? Movie {
        print("Movie:'\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song:'\(song.name)', by\(song.artist)")
    }
}

// Any和AnyObject的类型转换
/*
 swift为不确定类型提供了两种特殊的类型别名：
 * Any可以表示任何类型，包括函数类型。
 * AnyObject可以表示任何类类型的实例
 只有确定需要它们的行为和功能时才使用Any和AnyObject。
 最好还是代码中指明需要使用的类型。
 */
/*
 使用Any类型类和混合不同类型一起工作，包括函数类型和非类类型。
 */
var things = [Any]()
things.append(0) // Int
things.append(0.0) // Double
things.append(42) // Int
things.append(3.14159) // Double
things.append("hell0") // String
things.append((3.0, 5.0)) // 元组
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman")) // 类类型
things.append({ (name: String) -> String in "Hello, \(name)" }) // 函数类型

/*
 可以在switch表达式的case中使用is 和 as 操作符来找出只知道是Any或AnyObject类型的常量或变量的具体类型。
 */
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as an Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \(someString)")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at\(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

/*
 Any类型可以表示所有类型的值，包括可选类型。
 Swift会在用Any类型来表示一个可选值的时候，给一个警告。
 确实想使用Any类型来承载可选值，可以使用as操作符显示转换为Any。
 */
let optionalNumber: Int? = 3
//things.append(optionalNumber)  // 警告
things.append(optionalNumber as Any)


