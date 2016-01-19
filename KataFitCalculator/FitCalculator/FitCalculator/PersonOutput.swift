//
//  PersonOutput.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 19/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

struct ContactOutput {
    func getName() -> String {
        print("Name ", terminator: "")
        return readLine() ?? "Unknown"
    }
    
    func getAge() -> Int {
        print("Age: ", terminator: "")
        return Int(readLine()!) ?? -1
    }
    
    func getHeight() -> Double{
        print("height: ", terminator: "")
        return Double(readLine()!) ?? -1
    }
    
    func getKg() -> Double {
        print("kg: ", terminator: "")
        return Double(readLine()!) ?? -1
    }
}