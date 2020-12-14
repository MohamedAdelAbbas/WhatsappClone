//
//  TableViewDataSource.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

class TableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource
{
    // MARK: Properties
    
    typealias CellConfigurator = (Model, Cell, IndexPath) -> Void
    private let cellConfigurator: CellConfigurator
    private var models: [Model]
    
    // MARK: Init
    
    init(models: [Model], cellConfigurator: @escaping CellConfigurator)
    {
        self.models = models
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let model = models[indexPath.row]
        let cell: Cell = tableView.dequeue()
        cellConfigurator(model, cell, indexPath)
        return cell
    }
}
