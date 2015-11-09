//
//  SimpleGenericCollectionViewAdapter.swift
//  Pods
//
//  Created by Haizhen Lee on 15/11/8.
//
//

import UIKit


public class SimpleGenericCollectionViewAdapter<T:BXModel,V:UICollectionViewCell where V:BXBindable >: SimpleGenericDataSource<T>,UICollectionViewDelegate{
    public let collectionView:UICollectionView
    public var didSelectedItem: DidSelectedItemBlock?
    
    public init(collectionView:UICollectionView,items:[T] = []){
        self.collectionView = collectionView
        super.init(items: items)
    }
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.didSelectedItem?(itemAtIndexPath(indexPath),atIndexPath:indexPath)
    }
    
    public override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.reuseIdentifier, forIndexPath: indexPath) as! V
        let model = itemAtIndexPath(indexPath)
        if let m = model as? V.ModelType{
            cell.bind(m)
        }
        return cell
    }
    
    
    
    public override func updateItems(items: [T]) {
        super.updateItems(items)
        collectionView.reloadData()
    }
    
    
    
    
}