//
//  SimpleGenericTableViewController.swift
//  Pods
//
//  Created by Haizhen Lee on 15/11/20.
//
//

import UIKit

public class SimpleGenericTableViewController<T,V:UITableViewCell where V:BXBindable>: UITableViewController{
  var adapter:SimpleGenericTableViewAdapter<T,V>?
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    adapter = SimpleGenericTableViewAdapter(tableView:tableView)
    if !_copyItems.isEmpty{
      adapter?.updateItems(_copyItems)
      // 有可能
    }
  }
  
  var _copyItems = [T]()
  // Helper
  public func updateItems(items:[T]){
    _copyItems = items
    if let adapter = adapter{
      adapter.updateItems(items)
    }
  }
  
  public func appendItems(items:[T]){
    _copyItems.appendContentsOf(items)
    if let adapter = adapter{
      adapter.appendItems(items)
    }
  }
  
  

  
}

// MARK:SimpleGenericTableViewController - Helper
public extension SimpleGenericTableViewController{
  public func itemAtIndexPath(indexPath:NSIndexPath) -> T{
    return _copyItems[indexPath.row]
  }
  
  public func numberOfRows() -> Int {
    return self._copyItems.count
  }
}
