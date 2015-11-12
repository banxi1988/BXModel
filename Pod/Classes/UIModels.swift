//
//  UIModels.swift
//  Pods
//
//  Created by Haizhen Lee on 15/11/10.
//
//

import Foundation

public protocol BXBindable{
    typealias ModelType
    func bind(item:ModelType)
}

public protocol BXNibable{
    typealias ItemType
    static var hasNib:Bool{ get }
    static func nib() -> UINib
    static func instaniate() -> ItemType
}


extension UITableViewCell:BXNibable{
    public static var hasNib:Bool{
        let name = simpleClassName(self)
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "nib")
        return path != nil
    }
    
    public static func nib() -> UINib{
        let name = simpleClassName(self)
        return UINib(nibName: name, bundle: nil)
    }
    
    public static func instaniate() -> UITableViewCell {
        return nib().instantiateWithOwner(self, options: nil).first as! UITableViewCell
    }
}
