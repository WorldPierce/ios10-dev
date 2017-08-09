//: Playground - noun: a place where people can play

import UIKit

var employeeSalaries: [Double] = [10000.0, 20000.0, 300000.0 ,300000.0]
print(employeeSalaries.count)
employeeSalaries.append(39000.4)
print(employeeSalaries.count)

employeeSalaries.remove(at: 1)
print(employeeSalaries.count)

//array intitializer
var students = [String]()
var students2 = [String] // NOT initialized

