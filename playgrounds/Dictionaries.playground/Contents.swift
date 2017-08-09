//: Playground - noun: a place where people can play

import UIKit

var nameOfInts = [Int: String]()

nameOfInts[3] = "three"
nameOfInts[7] = "seven"
nameOfInts = [:] //clears dicta

//explicitly declared (not neccessary)
var airports: [String: String] = ["YYZ": "Toronto Pearson", "LAX": "Los Angeles International"]

print(airports.count)

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow" //overwrites
print(airports.count)

for (key, val) in  airports {
    print("\(key): \(val)")
}

for key in airports.keys {
    print("Key: \(key)")
}

for val in airports.values {
    print("Value: \(val)")
}

var abilities: [String: Array<Any>]