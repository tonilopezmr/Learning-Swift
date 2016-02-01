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
    
    init(){
       self.items = [0: Subject(id: 0, name: "Matematicas"), 1: Subject(id: 1, name: "Lengua"), 2: Subject(id: 2, name: "Carapapas")]
    }
    
    func add(item: Subject) -> Subject{
        let newItem: Subject = Subject(id: getNewId(), name: item.name)
        items[newItem.id] = newItem
        return newItem
    }
    
    private func getNewId() -> Int{
        var id: Int = -1
        
        for(var i = 0; i < items.keys.count; i++){
            if !items.keys.contains(i) {
                id = i
                break
            }
        }
        
        return id
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