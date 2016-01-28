//
//  Objects.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 13/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class Shape {
    var x: Double = 0
    var y: Double = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func description() -> String {
        return "A shape named \(name)."
    }
}

func ==(lhs: Shape, rhs: Shape) -> Bool {
    return lhs.name == rhs.name
}

class Square: Shape{
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        x = 10.3
        y = 20.2
    }
    
    
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func description() -> String {
        return "A square with sides of length \(sideLength) and "+super.description()
    }
}