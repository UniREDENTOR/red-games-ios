//
//  Ranking.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import Foundation
import SwiftyJSON

class Ranking {
    
    var logo = ""
    var name = ""
    var score = 0.0
    var position = 1
    
    init(json: JSON){
        
        if let logo = json["logo"].string {
            self.logo = logo
        }
        
        if let name = json["name"].string {
            self.name = name
        }
        
        if let score = json["score"].double {
            self.score = score
        }
        
        if let position = json["position"].int {
            self.position = position
        }
    }
    
}
