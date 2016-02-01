//
//  SubjectDataSourceProtocol.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

protocol DataSourceProtocol {
    typealias ItemType
    func add(item: ItemType) -> ItemType
    func remove(item: ItemType)
    func update(item: ItemType)
    func get(item: ItemType) -> ItemType
    func getAll() -> [ItemType]
}