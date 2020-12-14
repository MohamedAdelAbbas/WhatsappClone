//
//  ReuseableDataProvider.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

protocol ReuseableDataProvider: class
{
    associatedtype Model
    associatedtype HeaderModel

    init(models: [[Model]], headerData: [HeaderModel])
    
    var refreshableDelegate: RefreshableData? { get set }
    var numberOfSections: Int { get }
    
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Model?
    func updateData(with data: [[Model]])
    func updateItem(at indexPath: IndexPath, value: Model)
    
    func headerItem(at section: Int) -> HeaderModel?
    func updateHeaderData(with data: [HeaderModel])
    
    subscript(indexPath: IndexPath) -> Model? { get }
    subscript(section: Int) -> HeaderModel? { get }
}
