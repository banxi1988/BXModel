//
//  GenericDataSource.swift
//  Pods
//
//  Created by Haizhen Lee on 15/11/8.
//
//

import UIKit

public class SimpleGenericDataSource<T>:NSObject,UITableViewDataSource,UICollectionViewDataSource{
    public var reuseIdentifier = "cell"
    var items = [T]()
    public var section = 0
    public typealias DidSelectedItemBlock = ( (T,atIndexPath:NSIndexPath) -> Void )
    
    public init(items:[T] = []){
        self.items = items
    }
    
   public func updateItems(items:[T]){
        self.items = items
    }
    
    
   public func itemAtIndexPath(indexPath:NSIndexPath) -> T{
        return items[indexPath.row]
    }
    
   public func numberOfRows() -> Int {
        return self.items.count
   }
  
   public func appendItems(items:[T]){
     self.items.appendContentsOf(items)
   }
    
    
    
    
    // MARK: UITableViewDataSource
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows()
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier, forIndexPath: indexPath)
        configureTableViewCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    // MARK: UICollectionViewDataSource
    
   public final func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
   public final func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return numberOfRows()
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
   public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.reuseIdentifier, forIndexPath: indexPath)
        configureCollectionViewCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    // MARK : Helper
    
    public func configureCollectionViewCell(cell:UICollectionViewCell,atIndexPath indexPath:NSIndexPath){
        
    }
    
   public func configureTableViewCell(cell:UITableViewCell,atIndexPath indexPath:NSIndexPath){
        
    }
    
}