//
//  SubjectTableViewDataSource.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 01/02/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation
import UIKit

public class SubjectTableViewDataSource: NSObject, UITableViewDataSource {
    
    var items: [Subject] = []
    
    public override init(){
        super.init()
    }
    
    public func deleteSubject(indexPath: NSIndexPath){
        items.removeAtIndex(indexPath.item)
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("SubjectCellIdentifier", forIndexPath: indexPath)
        let item = itemAtIndexPath(indexPath)
        (cell as! SubjectTableViewCell).configureForItem(item)
        return cell
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> Subject {
        return items[indexPath.item]
    }
}