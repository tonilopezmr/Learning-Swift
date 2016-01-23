//
//  MemoryDataSource.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 23/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class MemoryDataSource<T>: DataSourceProtocol {
    var items: [T] = []
    
    func add(item: T){
        items.append(item)
    }
    func get(index: Int) -> T{
        return items[index]
    }
}