//
//  StaticTableViewAdapter.swift
//  Pods
//
//  Created by Haizhen Lee on 15/12/1.
//
//

import Foundation

public protocol StaticTableViewCellAware{
  var bx_height:CGFloat{ get }
}

extension UITableViewCell:StaticTableViewCellAware{
  public var bx_height:CGFloat{ return 44 }
}

public class StaticTableViewAdapter:StaticTableViewDataSource,UITableViewDelegate{
  
 public override init(cells: [UITableViewCell] = []) {
   super.init(cells: cells)
  }
  
  
  
  // MARK:UITableViewDelegate
   public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
    return cellAtIndexPath(indexPath).bx_height
  }
}