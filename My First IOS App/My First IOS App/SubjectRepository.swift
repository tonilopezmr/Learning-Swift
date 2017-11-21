//
//  SubjectRepository.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class SubjectRepository<T: DataSourceProtocol where T.ItemType == Subject>: SubjectRespositoryProtocol {
    
    let datasource: T
    
    init(datasource2: T){
        datasource = datasource2
    }
    
    func add(item: Subject) ->Subject{
        return datasource.add(item)
    }
    
    func remove(item: Subject) {
        datasource.remove(item)
    }

    func update(item: Subject) {
        datasource.update(item)
    }
    
    func get(item: Subject) -> Subject {
        return datasource.get(item)
    }
    
    func getAll() -> [Subject]{
        return datasource.getAll()
    }
}