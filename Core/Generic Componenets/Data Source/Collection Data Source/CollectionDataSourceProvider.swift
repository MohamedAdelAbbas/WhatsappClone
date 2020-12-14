//
//  CollectionDataSourceProvider.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

typealias RefreshableCollectionView = UICollectionView & RefreshableData

typealias ConfigurableCollectionCell = UICollectionViewCell & Configurable
typealias ConfigurableCollectionReusableView = UICollectionReusableView & Configurable

class CollectionDataSourceProvider<Provider: ReuseableDataProvider,
                                   Cell: ConfigurableCollectionCell,
                                   Header: ConfigurableCollectionReusableView>:
    NSObject, UICollectionViewDataSource where Provider.Model == Cell.Model, Provider.HeaderModel == Header.Model
{
    // MARK: - Properties
    
    private let collectionView: RefreshableCollectionView
    let provider: Provider

    // MARK: - Init
    
    init(collectionView: RefreshableCollectionView, provider: Provider)
    {
        self.collectionView = collectionView
        self.provider = provider
        super.init()
        setUp()
    }
    
    // MARK: - Setup

    private func setUp()
    {
        collectionView.dataSource = self
        provider.refreshableDelegate = collectionView
    }

    // MARK: - Data Source
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        provider.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        provider.numberOfItems(in: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: Cell = collectionView.dequeue(indexPath: indexPath)
        if let item = provider[indexPath]
        {
            cell.configure(item, at: indexPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        if kind == UICollectionView.elementKindSectionHeader
        {
            let headerView: Header = collectionView.dequeue(indexPath: indexPath, kind: kind)
            
            if let headerData = provider[indexPath.section]
            {
                headerView.configure(headerData, at: indexPath)
            }
            
            return headerView
        }
        
        return UICollectionReusableView()
    }
}
