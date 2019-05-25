//
//  Photo.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import Foundation
import SwiftyJSON

class Photo {
    var url = ""
    
    init(){
        url = "http://www.gaveanews.com/wp-content/uploads/2019/03/Escudo-do-Flamengo-%C3%A9-exposto-pr%C3%B3ximo-a-um-dos-gols-no-gramado-do-Maracan%C3%A3.jpg"
    }
    
    init(json : JSON){
        
        if let url = json["url"].string {
            self.url = url
        }
    }
    
    func getUrl() -> URL{
        return URL(string: url) ?? URL(string:  "https://pbs.twimg.com/profile_images/726252987/imagem_400x400.JPG")!
    }
}

