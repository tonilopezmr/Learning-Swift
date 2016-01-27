//
//  MemoryDataSource.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class MemoryDataSource<T>: DataSourceProtocol {
    var items: [T] = []
    
    func add(item: T){
        items.append(item)
    }
    
    func remove(item: T){
        
    }
    func update(item: T){}
    func get(item: T) -> T{}
    func getAll() -> [T]{}
}