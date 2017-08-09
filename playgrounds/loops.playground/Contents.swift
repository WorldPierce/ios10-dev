//: Playground - noun: a place where people can play

import UIKit

var sal = [45000.0, 45000.0, 35000.0, 20000.0]


var x = 0
//do while swift
repeat {
    sal[x] = sal[x] + (sal[x] * 0.10)
    x+=1
} while (x < sal.count)

for x in 1..<5 {
    print("Index is \(x)")
}

//for in loop
for i in 0..<sal.count {
    sal[i] = sal[i] + (sal[i] * 0.10)
    //print(sal[i])
}

//for each
for salary in sal {
    //salary = salary / 5
    print("Salary: \(salary)")
}
