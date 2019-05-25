//
//  Game.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import Foundation
import SwiftyJSON

class Game{
    
    var id = 0
    var name = ""
    var description = ""
    var date = ""
    var time = ""
    var edital = ""
    var locale = ""
    var information = ""
    
    init(){}
    
    init(json : JSON){
        if let id = json["id"].int {
            self.id = id
        }
        
        if let name = json["name"].string {
            self.name = name
        }
        
        if let description = json["description"].string {
            self.description = description
        }
        
        if let date = json["date"].string {
            self.date = date
        }
        
        if let time = json["time"].string {
            self.time = time
        }
        
        if let edital = json["edital"].string {
            self.edital = edital
        }
        
        if let locale = json["locale"].string {
            self.locale = locale
        }
        
        if let information = json["information"].string {
            self.information = information
        }
    }
}
