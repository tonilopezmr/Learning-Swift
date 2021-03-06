//
//  SubjectPresenterProtocol.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

protocol SubjectPresenterProtocol {
    func viewDidLoad()
    func viewWillApear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    func onItemClick(item: Subject)
}