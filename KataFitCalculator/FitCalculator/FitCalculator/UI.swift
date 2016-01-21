//
//  UI.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 21/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

protocol Ui {
    func showError()
    func showPerson(person: Person)
    func showCalculateFit(person: Person)
}