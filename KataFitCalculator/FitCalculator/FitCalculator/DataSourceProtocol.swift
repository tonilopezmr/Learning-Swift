//
//  DataSourceRespository.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 20/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

protocol DataSourceProtocol {
    typealias ItemType
    func add(person: ItemType)
    func get(index: Int) -> ItemType
}
