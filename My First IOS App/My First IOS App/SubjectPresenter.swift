//
//  SubjectPresenter.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class SubjectPresenter: SubjectPresenterProtocol {
    private let useCase: UseCase
    private weak var ui: SubjectUI?
    
    init(ui: SubjectUI, useCase: UseCase){
        self.ui = ui
        self.useCase = useCase
    }
    
    func viewDidLoad(){
        ui?.showLoader()
        useCase.getSubjectList.execute { subjects in
            self.ui?.hideLoader()
            if subjects.isEmpty {
                self.ui?.showEmptyCase()
            }else{
                self.ui?.showItems(subjects)
            }
        }
    }
    
    func onItemClick(item: Subject){
        deleteSubject(item)
    }
    
    func createSubject(subject: Subject){
        useCase.createSubject.execute(subject)
        ui?.showMessage("Subject \(subject.name) has been created")
    }
    
    func deleteSubject(subject: Subject){
        useCase.deleteSubject.execute(subject)
        ui?.showMessage("Subject \(subject.name) has been deleted")
    }
    
    func viewWillApear(){}
    func viewDidAppear(){}
    func viewWillDisappear(){}
    func viewDidDisappear(){}
}