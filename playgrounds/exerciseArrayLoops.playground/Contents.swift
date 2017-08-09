//: Playground - noun: a place where people can play

import UIKit

var arr = [String]()

var myArr: Array<Double> = [5,4,3,2,1]

arr.append("Item 1")
arr.append("Item 2")
arr.append("Item 3")
myArr.append(6)
myArr.append(7)
myArr.append(8)
arr.remove(at: 0)
myArr.remove(at: 5)
arr.removeAll()
myArr.sort()

var oddNumbers = [Int]()

for x in stride(from: 1, to: 100, by: 2) {
    oddNumbers.append(x)
    //print(x)
}

var sums = [Int]()

for x in oddNumbers {
    sums.append(x + 5)
    //print(x + 5)
}

var x = 0
repeat {
    print("The sum is: \(sums[x])")
    x += 1
} while (x < sums.count)