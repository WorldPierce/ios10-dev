//: Playground - noun: a place where people can play

import UIKit
//? is where var may or may not have a value
var lotteryWinnings: Int?
// lotterWinnigs! NEVER DO THIS ! unwraps optional if there is no value it crahses

if lotteryWinnings != nil {
    print(lotteryWinnings!)
}


//prefered way of checking if optional is nil
if let winnings = lotteryWinnings {
    print(winnings)
}

class Car {
    var model: String?
}

var vehicle: Car?

if let v = vehicle {
    if let m = v.model {
        print(m)
    }
}
//? is used for optional
//print(vehicle?.model)
vehicle = Car()
vehicle?.model = "Bronco"
//one line version of above
if let v = vehicle, let m = v.model {
    print(m)
}


var cars: [Car]?

cars = [Car]()

// if let where(where is replaced by ","
if let carsArr = cars , carsArr.count > 0 {
    //only execute if not nil and if more than 0 elements
} else {
    cars?.append(Car())
    print(cars?.count)
}

//implicitly unwrapped optional

class Person {
    private var _age: Int! //if not initialized and accessed program will crash
    //can make getter method as saftey code to avoid crash
    var age: Int {
        if _age == nil {
            _age = 0
        }
        return _age
    }
    
    func setAge(newAge: Int) {
        self._age = newAge
    }
}

var jack = Person()
print(jack.age)

class Dog {
    var species: String
    //Contructor in swift
    init(someSpecies: String) {
        self.species = someSpecies
    }
}

var lab = Dog(someSpecies: "Black Lab")
print(lab.species)
