//
//  Presenter.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 22/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

struct Presenter{
    let ui: Ui
    let calculateCalories: CalculateCalories
    
    func onInitialize(){
        ui.showWelcome()
    }
    
    func onContinue(){
        ui.showWelcome()
    }
    
    private func isValidName(input: String) -> Bool {
        return !input.isEmpty
    }
    
    private func isValidKg(input: Int) -> Bool {
        return input > 0
    }
    
    private func isValidAge(input: Int) -> Bool {
        return input > 18
    }
    
    private func isValidHeight(input: Int) -> Bool {
        return input > 140
    }
    
    private func isPersonInfoValid(name: String, kg: Int, age: Int, height: Int) -> Bool{
        return !isValidName(name) || !isValidKg(kg) || !isValidAge(age) || !isValidHeight(height)
    }
    
    func onInputContact(){
        let name = ui.getName()
        let kg = ui.getKg()
        let height = ui.getHeight()
        let age = ui.getAge()
        
        if isPersonInfoValid(name, kg: kg, age: age , height: height) {
            ui.showError()
            return onInputContact()
        }
        
        let person: Person = NewPerson (name: name, kg: kg, age: age, height: height)
        let kcal: Double = calculateCalories.execute(person) * 1.55
        
        ui.showCalculateFit(kcal, person: person)                
    }
}

struct NewPerson: Person {
    let name: String
    let kg: Int
    let age: Int
    let height: Int
}