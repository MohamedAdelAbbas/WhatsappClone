//
//  CollectionViewDataSource.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

class MultiSectionCollectionViewDataSource<Model, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource
{
    // MARK: Properties
    
    typealias CellConfigurator = (Model, Cell, IndexPath) -> Void
    private let cellConfigurator: CellConfigurator
    
    private var models: [[Model]]
    private var sectionNames: [String]
    
    // MARK: Init
    
    init(models: [[Model]], sectionNames: [String], cellConfigurator: @escaping CellConfigurator)
    {
        self.models = models
        self.sectionNames = sectionNames
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        models[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let model = models[indexPath.section][indexPath.row]
        let cell: Cell = collectionView.dequeue(indexPath: indexPath)
        cellConfigurator(model, cell, indexPath)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
//    {
//        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(SectionHeader.self)", for: indexPath) as? SectionHeader
//        {
//            let sectionTitle = sectionNames[indexPath.section]
//            sectionHeader.sectionTitle.text = sectionTitle
//            return sectionHeader
//        }
//        
//        return UICollectionReusableView()
//    }
}
