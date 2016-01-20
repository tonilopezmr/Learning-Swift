//
//  PersonRepository.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 20/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

struct PersonRepository<T: DataSourceProtocol where T.ItemType == Person>: PersonRespositoryProtocol {
    let datasource: T
    
    func add(person: Person) {
        datasource.add(<#T##person: Person##Person#>)
    }
    
    func get(index: Int) -> Person {
        return datasource.get(<#T##index: Int##Int#>)
    }
}