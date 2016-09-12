//: Playground - noun: a place where people can play

import Cocoa

// 析构过程
// 析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。析构器用关键字deinit标示。
// 在类的定义中，每个类最多只能有一个析构器，而且析构器不带任何参数。

//deinit {
//    // 执行析构过程
//}

// 析构器是在实例释放发生前被自动调用的，析构器不允许被主动调用的。子类继承了父类的析构器，并且在子类析构器实现的最后，父类的析构器会被自动调用。即使子类没有提供自己的析构器，父类的析构器也同样会被调用。

// 析构器操作
struct Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfConinsRequested: Int) -> Int {
        let numberOfConinsToVend = min(numberOfConinsRequested, coinsInBank)
        coinsInBank -= numberOfConinsToVend
        return numberOfConinsToVend
    }
    static func receive(conins: Int) {
        coinsInBank += conins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")
playerOne!.win(2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse)")
print("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")




