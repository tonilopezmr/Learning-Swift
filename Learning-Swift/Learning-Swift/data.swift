//
//  data.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 16/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

enum ProteinPerKg {
    case DEFINITION(Double)
    case VOLUME(Double)
}

enum Carbohydrates {
    case DEFINITION(Double)
    case VOLUME(Double)
}

enum KcalPerKg {
    case PROTEIN(Int)
    case Carbohydrates(Int)
    case Fats(Int)
}