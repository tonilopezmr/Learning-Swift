//
//  CalculateCalories.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 18/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

struct CalculateCalories {
    let personRepository: PersonRespositoryProtocol
    
    func execute(index: Int) -> Double {
        let person = personRepository.get(index);
        
        let result = Double(10*person.kg) + (6.26*person.height);
        return (result + 5) - Double(5*person.age);
    }
}