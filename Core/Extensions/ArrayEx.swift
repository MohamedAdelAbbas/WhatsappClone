//
//  ArrayEx.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import Foundation

extension Array
{
    var isNotEmpty: Bool
    {
        return !isEmpty
    }
    
    func take(_ elementsCount: Int) -> [Element] {
        let min = Swift.min(elementsCount, count)
        return Array(self[0..<min])
    }
}
