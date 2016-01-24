//
//  PersonOutput.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 19/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

struct PersonOutput: Ui {
    
    func showWelcome() {
        print("\n*** Welcome to CalculateFit   *** \n")
    }
    
    func showError() {
        print("Ooops! One Error!")
    }
    
    func showPerson(person: Person){
        print("\(person.name): Kg: \(person.kg)  Age: \(person.age)  height: \(person.height) cm")
    }
    
    func showCalculateFit(kcal: Double, person: Person){
        showPerson(person)
        print("Needs \(kcal) kcal per day")
    }
    
    func getName() -> String {
        print("Name ", terminator: "")
        return readLine() ?? "Unknown"
    }
    
    func getAge() -> Int {
        print("Age: ", terminator: "")
        return Int(readLine()!) ?? -1
    }
    
    func getHeight() -> Int{
        print("height (cm): ", terminator: "")
        return Int(readLine()!) ?? -1
    }
    
    func getKg() -> Int {
        print("kg: ", terminator: "")
        return Int(readLine()!) ?? -1
    }
}