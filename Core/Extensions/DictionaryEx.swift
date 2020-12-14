//
//  DictionaryEx.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import Foundation

// MARK: '+' Operator Overloading
func + <Key, Value> (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value]
{
    var result = lhs
    rhs.forEach{ result[$0] = $1 }
    return result
}
