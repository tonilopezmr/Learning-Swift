//
//  MockDataSource.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class MockDataSource: DataSourceProtocol {

    var items: [Int: Subject] = [:]
    
    func add(item: Subject){
        items[item.id] = item
    }
    
    func remove(item: Subject){
        let index = items.indexForKey(item.id)
        items.removeAtIndex(index!)
    }
    
    func update(item: Subject){
        items.updateValue(item, forKey: item.id)
    }
    
    func get(item: Subject) -> Subject{
        return items[item.id]!
    }
    
    func getAll() -> [Subject]{
        return Array(items.values)
    }
}