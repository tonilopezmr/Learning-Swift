//
//  arrays.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 10/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class ArrayExample: ExampleProtocol{
    func example(){
        print("*** Array examples ****")
        
        var names = ["Jesus", "Angel", "Toni"]
        print(names[0])
        
        names += ["Manuel", "Maria"]
        print(names)
        
        names[2..<4] += ["Marta", "Ana"]
        print(names)
        
        print("*** Dictionary examples ****")
        
        var ages = ["Jesus":17, "Angel":21, "Toni":22]
        print(ages)
        
        ages["Jesus"] = 18
        print(ages)
    }
}