//
//  ShapeProtocol.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 14/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

//Classes, enumerations, and structs can all adopt protocols.
protocol ShapeProtocol {
    var x: Double {get}
    var y: Double {get}
    mutating func area() -> Double
    mutating func perimeter() -> Double
}