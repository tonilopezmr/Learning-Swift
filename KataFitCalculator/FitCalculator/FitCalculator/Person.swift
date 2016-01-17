//
//  Person.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 17/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

protocol Person {
    var name: String { get }
    var kg: Int { get }
    var age: Int { get }
    var height: Double { get }
}