//
//  SubjectRepository.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

struct SubjectRepository<T: DataSourceProtocol where T.ItemType == Subject>: SubjectRespositoryProtocol {
    
    let datasource: T
    
    func add(item: Subject) {
        datasource.add(<#T##item: Subject##Subject#>)
    }
    
    func remove(item: Subject) {
        datasource.remove(<#T##item: Subject##Subject#>)
    }

    func update(item: Subject) {
        datasource.update(<#T##item: Subject##Subject#>)
    }
    
    func get(item: Subject) -> Subject {
        return datasource.get(<#T##item: Subject##Subject#>)
    }
    
    func getAll() -> [Subject]{
        return datasource.getAll()
    }
}