    
//  PersonRepositoryProtocol.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 17/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation


protocol PersonRespositoryProtocol {
    func add(person: Person)
    func get(index: Int) -> Person
}