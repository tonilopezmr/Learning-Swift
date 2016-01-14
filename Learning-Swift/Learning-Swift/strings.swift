//
//  strings.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 10/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class StringExamples: ExampleProtocol{
    func example(){    
        print("Hello, World!")
        
        //Fundamentals, variables and String
        
        var hello: String = "Hello"  //mutable variables!
        var world: String = "World"
        
        let helloSwift = "Hello Swift! :D"  //inmutable variable!
    
        hello = hello.uppercaseString
        world = world.lowercaseString
        
        print(hello + " " + world)
        print(helloSwift)
        
        let today: String = "January 10th, 2016"
        let output: String = "I'm learning about swift \(today)"
        print(output)
    }
}