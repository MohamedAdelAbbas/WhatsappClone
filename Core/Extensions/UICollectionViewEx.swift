//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

// MARK: UICollectionView

extension UICollectionView
{
    // MARK: Properties
    
    var visibleCurrentCellIndexPath: Int?
    {
        for cell in visibleCells
        {
            let indexPath = self.indexPath(for: cell)
            return indexPath?.row
        }
        return nil
    }
    
    // MARK: Methods
    
    // MARK: Register
    
    func register<T: UICollectionViewCell>(cell: T.Type)
    {
        register(cell.nib, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func register<R: UICollectionReusableView>(header: R.Type)
    {
        register(header.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: header.identifier)
    }
    
    func register<R: UICollectionReusableView>(footer: R.Type)
    {
        register(footer.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: footer.identifier)
    }
    
    // MARK: Dequeue
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell
    {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "\(Cell.self)", for: indexPath) as? Cell
        else { fatalError("Error in cell") }
        return cell
    }
    
    func dequeue<R: UICollectionReusableView>(indexPath: IndexPath, kind: String) -> R
    {
        guard let reusableView = dequeueReusableSupplementaryView(ofKind: kind,
                                                                  withReuseIdentifier: R.identifier, for: indexPath) as? R
        else { fatalError("Error in ReusableView") }
        return reusableView
    }
    
    // MARK: Scroll
    
    func scrollToNextItem()
    {
        scrollToItem(at: IndexPath(row: visibleCurrentCellIndexPath! + 1, section: 0), at: .right, animated: true)
    }
    
    func scrollToPreviousItem()
    {
        let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }
    
    func moveToFrame(contentOffset: CGFloat)
    {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
    }
    
    func deselectAllItems(animated: Bool = false)
    {
        for indexPath in self.indexPathsForSelectedItems ?? [] {
            self.deselectItem(at: indexPath, animated: animated)
        }
    }
}

extension UICollectionViewCell
{
    var collectionView: UICollectionView?
    {
        next(of: UICollectionView.self)
    }
    
    var indexPath: IndexPath?
    {
        collectionView?.indexPath(for: self)
    }
}
