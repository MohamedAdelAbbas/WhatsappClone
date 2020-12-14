//
//  CollectionViewDataSource.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

class CollectionViewDataSource<Model, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let model = models[indexPath.row]
        let cell: Cell = collectionView.dequeue(indexPath: indexPath)
        cellConfigurator(model, cell, indexPath)
        return cell
    }
}
