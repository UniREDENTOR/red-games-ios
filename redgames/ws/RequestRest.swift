//
//  RequestRest.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RequestRest{
    
    static func getPhotos(complete: @escaping ([Photo]) -> Void) {
        Alamofire.request(ApiService.getPhoto()).responseJSON(){response in
            var photos = [Photo]()
            switch(response.result){
                
            case .success(let data):
                
                for photoJson in JSON(data).array! {
                    photos.append(Photo(json: photoJson))
                }
                complete(photos)
                
            case .failure(_):
                complete(photos)
                
            }
            
        }
    }
    
    static func getGames(id: Int, complete: @escaping ([Game]) -> Void ){
        Alamofire.request(ApiService.getGames(id: id)).responseJSON(){ response in
            var games = [Game]()
            
            switch(response.result){
                
            case .success(let data):
                
                for gameJson in JSON(data).array! {
                    games.append(Game(json: gameJson))
                }
                complete(games)
            case .failure(_):
                complete(games)
            }
        }
    }
}
