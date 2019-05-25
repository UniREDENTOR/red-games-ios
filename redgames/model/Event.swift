//
//  Event.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import Foundation
import SwiftyJSON

class Event {
    
    var name = ""
    var active = false
    var description = ""
    var id = 1
    
    init(json : JSON){
        
        if let name = json["name"].string {
            self.name = name
        }
        
        if let active = json["active"].bool {
            self.active = active
        }
        
        if let description = json["description"].string {
            self.description = description
        }
        
        if let id = json["id"].int {
            self.id = id 
        }
    }
}
