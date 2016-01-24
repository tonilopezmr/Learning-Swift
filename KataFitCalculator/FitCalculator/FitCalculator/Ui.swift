//
//  UI.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 21/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

protocol Ui {
    func showWelcome()
    func showError()
    func showPerson(person: Person)
    func showCalculateFit(kcal: Double, person: Person)
    
    func getName() -> String
    func getAge() -> Int
    func getHeight() -> Int
    func getKg() -> Int
}