//
//  ViewController.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 25/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SubjectUI {
    
    var items: [Subject] = []
    
    @IBOutlet var subjectName: UITextField!
    @IBOutlet var emptyCaseView: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var presenter: SubjectPresenter! = nil
    
    override func viewDidLoad() {
        emptyCaseView.hidden = true
        tableView.accessibilityLabel = "SubjectTableView"
        tableView.accessibilityIdentifier = "SubjectTableView"
        presenter.viewDidLoad()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @IBAction func onAddButtonClick(sender: UIButton) {
        let subjectName = self.subjectName.text ?? "No subject"
        let subject = Subject(id: items.count, name: subjectName)
        presenter.createSubject(subject)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showEmptyCase(){
        emptyCaseView.hidden = false
    }
    
    func showItems(items: [Subject]) {
        emptyCase(items)
        self.items = items
        tableView.reloadData()
    }
    
    func showNewItem(item: Subject){
        emptyCase(items)
        self.items.append(item)
        tableView.reloadData()
    }
    
    func showLoader() {}
    func hideLoader() {}
    
    func showMessage(message: String){}
    
    private func emptyCase(items: [Subject]){
        self.emptyCaseView.hidden = items.count > 0
    }
    
    //TableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
}

