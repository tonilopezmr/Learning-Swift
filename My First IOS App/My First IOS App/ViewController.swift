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
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        emptyCaseView.hidden = true
        tableView.accessibilityLabel = "SubjectTableView"
        tableView.accessibilityIdentifier = "SubjectTableView"
        tableView.dataSource = self
        tableView.delegate = self
        presenter.viewDidLoad()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onAddButtonClick(sender: UIButton) {
        var subjectName = self.subjectName.text!
        if subjectName.isEmpty {
            subjectName = "No subject"
        }
        let subject = Subject(id: items.count, name: subjectName)
        presenter.createSubject(subject)
        showNewItem(subject)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showEmptyCase(){
        self.emptyCaseView.hidden = false
        self.tableView.hidden = true
    }
    
    func showItems(items: [Subject]) {
        emptyCase(items)
        self.items += items
        tableView.reloadData()
    }
    
    func showNewItem(item: Subject){
        showItems([item])
    }
    
    func showLoader() {}
    func hideLoader() {}
    
    func showMessage(message: String){
        print("Message: \(message)")
    }
    
    private func emptyCase(items: [Subject]){
        let hasSubjects = items.count > 0
        self.emptyCaseView.hidden = hasSubjects
        self.tableView.hidden = !hasSubjects
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
        presenter.onItemClick(Subject(id: indexPath.row, name: self.items[indexPath.row].name))
        items.removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
}

