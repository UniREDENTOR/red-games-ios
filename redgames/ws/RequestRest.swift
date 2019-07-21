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
    
    static func postEvents(eventId: Int, teamId: Int, uuid: String, amount: Int, complete: @escaping (Event) -> Void) {
        Alamofire.request(ApiService.postEvent(eventId: eventId, teamId: teamId),
                          method: .post, parameters: ["uuid" : uuid,   "amount" : amount]).responseJSON(){response in
            complete(Event())
        }
    }
    
    static func getEventsTeams(eventId: Int, complete: @escaping ([Team]) -> Void) {
        Alamofire.request(ApiService.getEventTeams(eventId: eventId)).responseJSON(){response in
            
            
            var teams = [Team]()
            switch(response.result){
                
            case .success(let data):
                print("Data \(data)")
                for teamJson in JSON(data).array! {
                    teams.append(Team(json: teamJson))
                }
                complete(teams)
                
            case .failure(let msg):
                complete(teams)
                
            }
        }
    }
    
    static func getEvents(complete: @escaping ([Event]) -> Void) {
        Alamofire.request(ApiService.getEvents()).responseJSON(){response in
            var events = [Event]()
            switch(response.result){
                
            case .success(let data):
                
                for eventJson in JSON(data).array! {
                    events.append(Event(json: eventJson))
                }
                complete(events)
                
            case .failure(_):
                complete(events)
                
            }
        }
    }
    
    static func getRanking(complete: @escaping ([Ranking]) -> Void) {
        Alamofire.request(ApiService.getRanking()).responseJSON(){response in
            var ranking = [Ranking]()
            switch(response.result){
                
            case .success(let data):
                for rankingJson in JSON(data).array! {
                    ranking.append(Ranking(json: rankingJson))
                }
                complete(ranking)
                
            case .failure(_):
                complete(ranking)
                
            }
            
        }
    }
    
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
    
    static func getTeams(complete: @escaping ([Team]) -> Void ){
        Alamofire.request(ApiService.getTeams()).responseJSON { response in
            
            var teams = [Team]()
            switch(response.result){
                
            case .success(let data):
                
                for teamJson in JSON(data).array! {
                    teams.append(Team(json: teamJson))
                }
                complete(teams)
            case .failure(_):
                complete(teams)
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
