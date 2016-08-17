//
//  JokeService.swift
//  jokes
//
//  Created by faizan on 16/06/16.
//  Copyright © 2016 faizan. All rights reserved.
//

import Foundation

struct JokeService {
    
    private static let baseURL = "http://api.icndb.com/jokes/random"
    
    private static func constructURL() -> NSURL? {
        let urlComponents = NSURLComponents(string: baseURL)
        return urlComponents?.URL
    }

    
    
    static func GetJokeData(complition:Joke? -> Void){
        
        let  url = JokeService.constructURL()
        
        
        let nw = NetworkOprator(url: url!)
        
        nw.downloadData { (jsonDict) in
            let joke = parseJSON(jsonDict)
            complition(joke)
        }
    }
    static func parseJSON(json: [String: AnyObject]) -> Joke? {
        
        var joke = Joke()
        
        
        if let dictFromJSON = json["value"] {
            joke.jokes = (dictFromJSON["joke"] as? String)!
        }
        
        return joke
    }

        
        
    }
    
