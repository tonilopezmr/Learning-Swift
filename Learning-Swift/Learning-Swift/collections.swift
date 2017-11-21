//
//  collections.swift
//  Learning-Swift
//
//  Created by Antonio López Marín on 21/11/17.
//  Copyright © 2017 Antonio López Marín. All rights reserved.
//

import Foundation

func sayHello() -> String { return "Hello" }

func collections() {
    print("** Arrays **")
    
    var array = [String]()
    
    array = ["Toni", "Sara"]
    print(array[0])
    
    array += ["Uno más", "Otro", "Y otro"]
    print(array)
    
    array[2...4] = ["Todo en uno"]
    print(array)
    
    print("\n** Set **")
    
    let a: Set = [1, 2, 3, 4, 5, 6]
    print("A: \(a)")
    
    let b: Set = [4, 5, 6, 7, 8 , 9]
    print("B: \(b)" )
    
    print("\nA intersect B: \(a.intersect(b).sort())")
    print("\nA union B: \(a.union(b).sort())")
    print("\nA subscract B: \(a.subtract(b).sort())")
    print("\nB subscract A: \(b.subtract(a).sort())")
    print("\nA union B substracting (A intersect B): \(a.union(b).subtract(a.intersect(b)).sort())")
    print("\n(A substract B) union (B substract A): \(a.subtract(b).union(b.subtract(a)).sort())")
    
    let oneTwo: Set = [1,2]
    print("[1, 2] is a subset of [1,2,3,4,5,6]: \(oneTwo.isSubsetOf(a))")
    
    print("\n ** Dictionary **")
    
    var dic = [Int: String]() //mutable
    
    dic[1] = "Toni"
    dic[2] = "Sara"
    dic = [:]
    
    print(dic)
    
    let inmu = [1: "Toni", 2: "Sara"]
    print(inmu[2])
    
}