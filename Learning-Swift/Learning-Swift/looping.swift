//
//  looping.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 10/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation

class LoopingExample: ExampleProtocol{
    func example(){
        print("**** Looping Examples ****")
        
        var complete: Bool = false
        var cont = 0
        
        while !complete {
            printDownloading(cont)
            cont++
            if cont > 8 {
                complete = true
            }
        }
        
        print("*** repeat - while ***")
        
        complete = false
        cont = 0;
        
        repeat {
            printDownloading(cont)
            cont++
            if cont > 10 {
                complete = true
            }
        } while !complete
        
        
        for number in 0...10 {
            print(number)
        }
        
        indexLoopExample()
    }
    
    func printDownloading(cont: Int){
        var downloadingMessage = "Downloading.."
        for var i = 0; i < cont; i++ {
            downloadingMessage += "."
        }
        print(downloadingMessage)
    }
    
    func indexLoopExample(){
        //Use ..< to make a range that omits its upper value, and use ... to make a range that includes both values.
        
        var firstForLoop = 0
        for i in 0..<4 {
            print("")
            firstForLoop = i
        }
        print(firstForLoop)
        
        var secondForLoop = 0
        for i in 0...4 {
            secondForLoop = i
        }
        print(secondForLoop)
        
    }
}