//
//  Circle.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 14/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class Circle: ShapeProtocol {
    var x: Double
    var y: Double
    
    var radio: Double
    
    init(radio: Double, x: Double, y: Double){
        self.radio = radio
        self.x = x
        self.y = y
    }
    
    func area() -> Double{
        return 3.14*radio*radio
    }
    
    func perimeter() -> Double{
        return 2*3.14*radio
    }
}