//
//  PersonRepositoryProtocol.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

protocol SubjectRespositoryProtocol {
    func add(item: Subject)
    func remove(item: Subject)
    func update(item: Subject)
    func get(item: Subject) -> Subject
    func getAll() -> [Subject]
}