import Foundation
import SwiftyJSON

public protocol JSONDeserializable{
    init(json:JSON)
}

public protocol BXModel:JSONDeserializable{
}


public extension BXModel{
    public static func arrayFrom(json:JSON) -> [Self]{
        var array = [Self]()
        for (_,subJson):(String,JSON) in json{
            let item = Self(json:subJson)
            array.append(item)
        }
        return array
    }
}

public extension NSObject{
   
    public func bx_modelSetWithJSON(json:JSON){
        
    }
    
}
