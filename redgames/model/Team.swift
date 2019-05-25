//
//  Team.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import Foundation
import SwiftyJSON

class Team {
    
    var id = 0
    var logo = ""
    var description = ""
    var leader = ""
    var participations = 0
    var name = ""
    var members = [String]()
    
    init(json : JSON){
        if let logo = json["logo"].string {
            self.logo = logo
        }
        
        if let description = json["description"].string {
            self.description = description
        }
        
        if let leader = json["leader"].string {
            self.leader = leader
        }
        
        if let name = json["name"].string {
            self.name = name
        }
        
        
        if let participations = json["participations"].int {
            self.participations = participations
        }
        
        if let members = json["members"].array{
            for member in members {
                self.members.append(member.string!)
            }
        }
        
        if let id = json["id"].int {
            self.id = id 
        }
    }
    
    
}
