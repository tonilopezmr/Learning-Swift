//
//  ServiceLocator.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 28/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation
import UIKit

class ServiceLocator {
    
    private func provideDataSource() -> SQLiteDataSource{
        return SQLiteDataSource()
    }
    
    private func provideSubjectRepository() -> SubjectRespositoryProtocol {
        return SubjectRepository(datasource: provideDataSource())
    }

    private func provideUseCases() -> UseCase {
        let repository = provideSubjectRepository()
        let getSubjectList = GetSubjects(repository: repository)
        let getSubject = GetSubject(repository: repository)
        let createSubject = CreateSubject(repository: repository)
        let deleteSubject = DeleteSubject(repository: repository)
        let updateSubject = UpdateSubject(repository: repository)
        return UseCase(getSubjectList: getSubjectList, getSubject: getSubject, createSubject: createSubject, deleteSubject: deleteSubject, updateSubject: updateSubject)
    }
    
    private func provideSubjectPresenter(ui: SubjectUI) -> SubjectPresenter {
        return SubjectPresenter(ui: ui, useCase: provideUseCases())
    }
    
    private func provideSubjectDataSource() -> SubjectTableViewDataSource {
        return SubjectTableViewDataSource()
    }
    
    private func provideStoryBoard() -> UIStoryboard{
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    func provideRootViewController() -> UIViewController{
        let uiStoryBoard = provideStoryBoard()
        let navigationController = uiStoryBoard.instantiateInitialViewController() as! UINavigationController
        navigationController.viewControllers = [provideSubjectController()]
        return navigationController
    }
    
    func provideSubjectController() -> UIViewController {
        let uiStoryBoard = provideStoryBoard()
        let subjectViewController: ViewController = uiStoryBoard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        let presenter = provideSubjectPresenter(subjectViewController)
        let dataSource = provideSubjectDataSource()
        subjectViewController.presenter = presenter
        subjectViewController.dataSource = dataSource
        subjectViewController.delegate = SubjectTableViewNavigationDelegate(dataSource: dataSource, presenter: presenter)
        return subjectViewController
    }
    
}