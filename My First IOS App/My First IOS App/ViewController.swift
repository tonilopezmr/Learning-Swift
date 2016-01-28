//
//  ViewController.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 25/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var subjectName: UITextField!
    @IBOutlet var emptyCaseView: UILabel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onAddButtonClick(sender: UIButton) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

