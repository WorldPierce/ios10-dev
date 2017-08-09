//: Playground - noun: a place where people can play

import UIKit

var length = 5, width = 10
var area = length * width

var length2 = 6, width2 = 12
var area2 = length2 * width2

// -> <return type> specifies return type
func calculateArea(length: Int, width: Int) -> Int {
    return length * width
}

let newArea = calculateArea(length: 5, width: 4)

var balance = 500.00
var shoes = 350.00



func purchaseItem(currentBalance: Double, itemPrice: Double) -> Double {
    if(currentBalance >= itemPrice) {
        print("Purchased item for: $\(itemPrice)")
        return currentBalance - itemPrice
    } else {
        print("Not enough money in account.")
        return currentBalance
    }
}
balance = purchaseItem(currentBalance: balance, itemPrice: shoes)

//keyword inout lets you modify parameter passed in NOTE must use & on function call 
func purchaseItem2(currentBalance: inout Double, itemPrice: Double) {
    if(currentBalance >= itemPrice) {
        print("Purchased item for: $\(itemPrice)")
        currentBalance =  currentBalance - itemPrice
    } else {
        print("Not enough money in account.")
    }
}

purchaseItem2(currentBalance: &balance, itemPrice: shoes)


func add(num1: Double, num2: Double) -> Double {
    return num1 + num2
}

func subtract(num1: Int, num2: Int) -> Int {
    return num1 - num2
}

func multiply(num1: Float, num2: Float) -> Float {
    return num1 * num2
}

func divide(num1: Double, num2: Double) -> Double {
    return num1 / num2
}

var one = add(num1: 1,num2: 2)
var two = subtract(num1: 7, num2: 6)
var three = multiply(num1: 213.2, num2: 2)
var four = divide(num1: 100, num2: 10)


