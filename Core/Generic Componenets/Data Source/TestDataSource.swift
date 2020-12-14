//
//  TestDataSource.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import Foundation

struct TestModel
{
    let id: Int
    let name: String
}

class CollectionView: RefreshableCollectionView
{
    func refresh()
    {
        reloadData()
    }
}

class TestCollectionCell: ConfigurableCollectionCell
{
    func configure(_ item: TestModel, at indexPath: IndexPath)
    {
        
    }
}

class TestCollcectionHeader: ConfigurableCollectionReusableView
{
    func configure(_ item: TestModel, at indexPath: IndexPath)
    {
        
    }
}

typealias TestCollectionDataSource = CollectionDataSource<TestModel, TestModel, TestCollectionCell, TestCollcectionHeader>
typealias TestDataSourceProvider = DataSourceProvider<TestModel, TestModel>

class TestCollection
{
    var collectionView: RefreshableCollectionView
    var dataSource: TestCollectionDataSource
    
    var data: [TestModel] =
    [
        .init(id: 1, name: "name 1"),
        .init(id: 2, name: "name 2")
    ]
    
    var multiData: [[TestModel]] =
    [
        [.init(id: 1, name: "name 1")],
        [.init(id: 2, name: "name 2")]
    ]
    
    var headerData: [TestModel] =
    [
        .init(id: 1, name: "section 1"),
        .init(id: 2, name: "section 2")
    ]
    
    init()
    {
        collectionView = CollectionView()
        
        dataSource = TestCollectionDataSource(collectionView: collectionView, data: data)
        dataSource = TestCollectionDataSource(collectionView: collectionView, data: multiData, headerData: headerData)
        
        let provider: TestDataSourceProvider = DataSourceProvider(models: multiData)
        dataSource = TestCollectionDataSource(collectionView: collectionView, provider: provider)
        
        dataSource.updateData(with: data)
        dataSource.updateData(with: multiData)
        
        let item = dataSource.item(at: IndexPath(item: 1, section: 0))!
        dataSource.updateItem(at: IndexPath(item: 2, section: 1), value: item)
        
        let _ = dataSource.headerItem(at: 2)
    }
}
