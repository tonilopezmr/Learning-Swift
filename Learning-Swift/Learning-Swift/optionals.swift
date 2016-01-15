//
//  optionals.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 15/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class OptionalBindingExample: ExampleProtocol {
    
    func example() {
        var possibleNumber = "3423"
        
        if let actualNumber = Int(possibleNumber) {
            print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
        } else {
            print("\'\(possibleNumber)\' could not be converted to an integer")
        }
        
        sample(nil)
    }
    
    func sample(assumedString: String?) {
        if assumedString != nil {
            print(assumedString)
        }
        
        if let string = assumedString {
            print(string)
        }
    }
}