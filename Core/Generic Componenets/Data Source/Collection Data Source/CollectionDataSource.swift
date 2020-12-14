//
//  CollectionDataSource.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

class CollectionDataSource<Model, HeaderModel,
                           Cell: ConfigurableCollectionCell,
                           Header: ConfigurableCollectionReusableView>:
    CollectionDataSourceProvider<DataSourceProvider<Model, Header.Model>, Cell, Header>
    where Cell.Model == Model, Header.Model == HeaderModel
{
    // MARK: - Init
    
    override init(collectionView: RefreshableCollectionView, provider: DataSourceProvider<Model, Header.Model>)
    {
        super.init(collectionView: collectionView, provider: provider)
    }

    init(collectionView: RefreshableCollectionView, data: [[Model]], headerData: [HeaderModel] = [])
    {
        let provider = DataSourceProvider(models: data, headerData: headerData)
        super.init(collectionView: collectionView, provider: provider)
    }
    
    convenience init(collectionView: RefreshableCollectionView, data: [Model], header: HeaderModel? = nil)
    {
        let headerData: [HeaderModel] = header == nil ? [] : [header!]
        self.init(collectionView: collectionView, data: [data], headerData: headerData)
    }
    
    // MARK: - Methods
    
    func item(at indexPath: IndexPath) -> Model?
    {
        provider[indexPath]
    }
    
    func headerItem(at section: Int) -> HeaderModel?
    {
        provider[section]
    }

    func updateItem(at indexPath: IndexPath, value: Model)
    {
        provider.updateItem(at: indexPath, value: value)
    }
    
    func updateData(with data: [Model])
    {
        updateData(with: [data])
    }
    
    func updateData(with data: [[Model]])
    {
        provider.updateData(with: data)
    }
}
