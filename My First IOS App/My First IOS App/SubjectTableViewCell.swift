//
//  SubjectTableViewCell.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 01/02/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation
import UIKit

class SubjectTableViewCell: UITableViewCell {
    
    @IBOutlet var subjectName: UILabel!
    
    func configureForItem(item: Subject){
        subjectName.text = item.name
        subjectName.accessibilityLabel = item.name
    }
    
}