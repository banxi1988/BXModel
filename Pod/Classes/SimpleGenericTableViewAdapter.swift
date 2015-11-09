//
//  SimpleGenericTableViewAdapter.swift
//  Pods
//
//  Created by Haizhen Lee on 15/11/8.
//
//

import UIKit

public class SimpleGenericTableViewAdapter<T:BXModel,V:UITableViewCell where V:BXBindable >: SimpleGenericDataSource<T>,UITableViewDelegate{
    public let tableView:UITableView
    public var didSelectedItem: DidSelectedItemBlock?
    public init(tableView:UITableView,items:[T],section:Int = 0){
        self.tableView = tableView
        super.init(items: items,section:section)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
   public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.didSelectedItem?(itemAtIndexPath(indexPath),atIndexPath:indexPath)
    }
    
   public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellForRowAtIndexPath(indexPath)
    }
    
    public func cellForRowAtIndexPath(indexPath:NSIndexPath) -> V {
         let cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier, forIndexPath: indexPath) as! V
        let model = itemAtIndexPath(indexPath)
        if let m = model as? V.ModelType{
            cell.bind(m)
        }
        return cell       
    }
    
   public override func updateItems(items: [T]) {
        super.updateItems(items)
        tableView.reloadData()
    }
    
}