//
//  ViewController.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 25/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet var label: UILabel!
    
    @IBAction func onButtonClick(sender: UIButton) {
        label.text = "I've touch the button"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

