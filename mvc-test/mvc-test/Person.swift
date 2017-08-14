//
//  Person.swift
//  mvc-test
//
//  Created by Billy Pierce on 8/13/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import Foundation
// all classes in model folder
class Person {
    private var _firstName: String
    private var _lastName: String
    
    var firstName: String {
        get {
            return _firstName
        }
        set {
            _firstName = newValue
        }
    }
    var lastName: String {
        return _lastName
    }
    
    init(first: String, last: String) {
        self._firstName = first
        self._lastName = last
    }
    var fullName: String {
        return "\(_firstName) \(_lastName)"
    }
}
