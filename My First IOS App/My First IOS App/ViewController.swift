//
//  ViewController.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 25/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SubjectUI {
    
    @IBOutlet var subjectName: UITextField!
    @IBOutlet var emptyCaseView: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var presenter: SubjectPresenter! = nil

    var dataSource: SubjectTableViewDataSource!
    var delegate: UITableViewDelegate!
    
    override func viewDidLoad() {
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        emptyCaseView.hidden = true
        tableView.accessibilityLabel = "SubjectTableView"
        tableView.accessibilityIdentifier = "SubjectTableView"
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        presenter.viewDidLoad()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onAddButtonClick(sender: UIButton) {
        var subjectName = self.subjectName.text!
        if subjectName.isEmpty {
            subjectName = "No subject"
        }
        let subject = Subject(id: dataSource.items.count, name: subjectName)
        presenter.createSubject(subject)
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
        dataSource.items = items
        tableView.reloadData()
    }
    
    func showNewItem(item: Subject){
        emptyCase([item])
        dataSource.items += [item]
        tableView.reloadData()
    }
    
    func deleteItem(item: Subject){
        emptyCase(dataSource.items)
        tableView.reloadData()
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
}

