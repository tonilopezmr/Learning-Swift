//
//  functions.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 12/01/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import Foundation


class FunctionExample: ExampleProtocol{
    func example(){
        print(sum(3, n2: 3))
        
        let agesStatistics = statistics(["Ana": 19, "Angel":21, "Toni":22, "Jesus": 18])
        print("Results of statistics:")
        print("Younger: \(agesStatistics.younger)")
        print("Older: \(agesStatistics.older)")
        
        print(nestedFunction())
        
        let incrementMethod = makeIncrementer()
        print(incrementMethod(10))
        
        print(map([1,2,3,4,5], f: double))
    }
    
    
    func sum(n1: Int, n2: Int) -> Int {
        return n1 + n2;
    }
    
    func statistics(people: [String: Int]) -> (older: Int, younger: Int) {
        var older: Int = people.values.first!
        var younger: Int = people.values.first!
        
        for (name, age) in people {
            if age > older {
                older = age
            } else if age < younger {
                younger = age
            }
            
            print("\(name) has \(age) years old")
        }
        
        return (older, younger)
    }
    
    func nestedFunction() -> Int{
        var x = 10
        
        func changeVariableX(){
            x /= 2
        }
        changeVariableX()
        return x
    }
    
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    func map(var list: [Int], f: (Int) -> Int) -> [Int]{
        let item = list[0]
        list.removeAtIndex(0)
        if list.isEmpty {
            return [f(item)]
        }else{
            return [f(item)] + map(list, f: f)
        }
    }
    
    func double(number: Int) -> Int {
        return number*2
    }
    
    func sum(numbers: Int...) -> [Int] {
        var list = [Int]()
        for number in numbers{
            list += [double(number)]
        }
        return list
    }
}

func closures() {
    print("Closures")
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func mult(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func op(op: (Int, Int) -> Int) -> Int {
        return op(2, 2)
    }
    
    let result = op(add)
    
    print("Operation over a: 2 b: 2 = \(result)")
    
    let other = op({ (a: Int, b: Int) -> Int in
        return a - b
    })
    
    print("Operation over a closure a: 2 b: 2 = \(other)")
}