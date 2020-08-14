//
//  ListData.swift
//  MediaMagic
//
//  Created by ABDUL KADIR ANSARI on 13/08/20.
//  Copyright © 2020 ABDUL KADIR ANSARI. All rights reserved.
//

import Foundation

struct dataList{
    
    var imgID = String()
    var imgName = String()
    
    init (objectID : [String : AnyObject]){
        
        imgID = objectID["id"] as? String ?? ""
        imgName = objectID["author"] as? String ?? ""
    }
    
}
