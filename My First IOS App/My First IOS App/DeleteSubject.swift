 //
//  DeleteSubject.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class DeleteSubject {
    private let repository: SubjectRespositoryProtocol
    
    init(repository: SubjectRespositoryProtocol){
        self.repository = repository
    }
    
    func execute(subject: Subject){
        repository.remove(subject)
    }
 }