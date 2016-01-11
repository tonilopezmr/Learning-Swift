//
//  controlFlow.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 11/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation


class ControlFlowExample{
    func example(){
        var optionalString: String? = "Hello"
        print(optionalString == nil)
        
        var optionalName: String? = "John Appleseed"
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello, \(name)"
        }
        
        print("Greeting: " + greeting)
        
        let nickName: String? = nil
        let fullName: String = "John Appleseed"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        
        print("Informal Greeting: " + informalGreeting)
        
        switchExample()
        dictionaryForIn()
    }
    
    func switchExample(){
        //Switch
        
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
        }
    }
    
    func dictionaryForIn(){
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
        ]
        
        var largest = 0
        for (kind, numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                }
            }
        }
        print("Largest number: \(largest)")
    }
}