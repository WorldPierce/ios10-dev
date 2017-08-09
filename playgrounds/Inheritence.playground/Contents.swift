//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var tires = 4
    var make: String?
    var model: String?
    var currentSpeed: Double = 0
    
    init() {
        print("Parent class initialized.")
    }
    
    func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 2
    }
    
    func brake() {
        
    }
}

class SportsCar: Vehicle {
    override init() {
        super.init()
        print("Child class init")
        make = "BMW"
        model = "3 Series"
    }
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 3
    }
}

class Truck: Vehicle {
    override init() {
        super.init()
    }
    
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease
    }
}

let car = SportsCar()
