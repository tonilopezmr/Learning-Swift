//
//  main.swift
//  FitCalculator
//
//  Created by Antonio López Marín on 17/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

let locator = AppServiceLocator()
locator.presenter.onInitialize()

while true {
    locator.presenter.onInputContact()
    locator.presenter.onContinue()
}
