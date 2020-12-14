//
//  DataSourceProvider.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

class DataSourceProvider<Model, HeaderModel>: ReuseableDataProvider
{
    // MARK: - Properties
    
    private var items: [[Model]]
    private var headerData: [HeaderModel]
    
    weak var refreshableDelegate: RefreshableData?
    var numberOfSections: Int { items.count }

    // MARK: - Init
    
    required init(models: [[Model]], headerData: [HeaderModel] = [])
    {
        items = models
        self.headerData = headerData
    }

    // MARK: - Provider Methods
        
    func numberOfItems(in section: Int) -> Int
    {
        guard section >= 0 && section < items.count else {
            return 0
        }
        
        return items[section].count
    }

    func item(at indexPath: IndexPath) -> Model?
    {
        guard indexPath.section >= 0 && indexPath.section < items.count &&
            indexPath.row >= 0 && indexPath.row < items[indexPath.section].count else {
            return nil
        }
        
        return items[indexPath.section][indexPath.row]
    }
    
    func headerItem(at section: Int) -> HeaderModel?
    {
        guard section >= 0 && section < items.count else {
            return nil
        }
        
        return headerData[section]
    }
    
    func updateData(with data: [[Model]])
    {
        items = data
        refresh()
    }
    
    func updateHeaderData(with data: [HeaderModel])
    {
        headerData = data
        refresh()
    }

    func updateItem(at indexPath: IndexPath, value: Model)
    {
        guard indexPath.section >= 0 && indexPath.section < items.count &&
            indexPath.row >= 0 && indexPath.row < items[indexPath.section].count else {
            return
        }
        
        items[indexPath.section][indexPath.row] = value
        refresh()
    }
    
    // MARK: - Private Methods
    
    private func refresh()
    {
        refreshableDelegate?.refresh()
    }
}

extension DataSourceProvider
{
    subscript(indexPath: IndexPath) -> Model?
    {
        item(at: indexPath)
    }
    
    subscript(section: Int) -> HeaderModel?
    {
        headerItem(at: section)
    }
}
