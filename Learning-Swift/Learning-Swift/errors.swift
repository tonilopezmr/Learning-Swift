//
//  errors.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 15/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

enum SampleError: ErrorType {
    case errorOne
    case errorTwo(oneParameter: Int)
    case errorThree
}

class ErrorHandlingExample: ExampleProtocol {
    
    func example() {
        do{
            try canThrowAnError()
            print("all right")
        } catch SampleError.errorOne {
            print("Error has ocurred")
        } catch SampleError.errorTwo(let oneParameter){
            print("Error two parameter: \(oneParameter)")
        } catch SampleError.errorThree {
            print("eeeeerrrorrr")
        }catch let specialError as NSError {
            print(specialError)
        }
        
    }
    
    func canThrowAnError() throws {
        throw SampleError.errorTwo(oneParameter: 3)
    }
    
}