//
//  Extension.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 14/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

protocol DescriptionProtocol{
    var description: String {get}
}

extension Double: DescriptionProtocol{
    var description: String {
        return "Double number \(self)"
    }
}