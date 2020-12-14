//
//  ConfigurableCell.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

protocol Configurable: class
{
    associatedtype Model
    func configure(_ item: Model, at indexPath: IndexPath)
}
