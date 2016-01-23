//
//  AppServiceLocaltor.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 17/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class AppServiceLocator {
    
    lazy var personDataSource: MemoryDataSource<Person> = {
        return MemoryDataSource<Person>()
    }()
    
    var personRespository: PersonRespositoryProtocol {
        return PersonRepository(datasource: personDataSource)
    }
    
    //continue...
}