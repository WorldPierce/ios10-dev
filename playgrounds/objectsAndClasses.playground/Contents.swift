//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var tires = 4
    var headLights = 2
    var horsePower = 468
    var model = ""
    
    func drive(){
        //accelerate
    }
    
    func brake() {
        
    }
}


var bmw = Vehicle()
bmw.model = "328i"
bmw.brake()

func passByRefernce(vehicle: Vehicle) {
    vehicle.model = "New Model"
}

print(bmw.model)
passByRefernce(vehicle: bmw)
print(bmw.model)

var someonesAge = 20
func passByValue(age: Int) {
    _ = age
}
passByValue(age: someonesAge)