//
//  SubjectTableViewNavigationDelegate.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 01/02/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation
import UIKit

public class SubjectTableViewNavigationDelegate: NSObject, UITableViewDelegate {
    
    private let dataSource: SubjectTableViewDataSource
    private let presenter: SubjectPresenter
    
    init(dataSource: SubjectTableViewDataSource, presenter: SubjectPresenter) {
        self.dataSource = dataSource
        self.presenter = presenter
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = dataSource.itemAtIndexPath(indexPath)
        dataSource.deleteSubject(indexPath)
        presenter.onItemClick(item)
    }
}