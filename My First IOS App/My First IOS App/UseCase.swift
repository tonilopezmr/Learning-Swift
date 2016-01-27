//
//  UseCase.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

struct UseCase {
    let getSubjectList: GetSubjects
    let getSubject: GetSubject
    let createSubject: CreateSubject
    let deleteSubject: DeleteSubject
    let updateSubject: UpdateSubject
}