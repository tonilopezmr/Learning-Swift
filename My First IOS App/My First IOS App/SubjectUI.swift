//
//  SubjectUI.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 27/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

protocol SubjectUI: UI, LoadingUI, MessageUI {
    func showEmptyCase()
    func showItems(items: [Subject])
    func showNewItem(item: Subject)
    func deleteItem(item: Subject)
}