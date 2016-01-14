//
//  generics.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 14/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class GenericExamples: ExampleProtocol{
    
    func example() {
        print(repeatSomeThing("All I want for christmas", numberOfThings: 4))
    }
    
    func repeatSomeThing<T>(something: T, numberOfThings: Int) -> [T]{
        var result = [T]()
        
        for _ in 1...numberOfThings {
            result.append(something)
        }
        
        return result
    }
}