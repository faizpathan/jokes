//
//  NetworkOprator.swift
//  Newweather
//
//  Created by faizan on 13/06/16.
//  Copyright © 2016 faizan. All rights reserved.
//

import Foundation

struct NetworkOprator {
    
    var URL: NSURL?
    
    
    init(url:NSURL) {
        URL = url
    }
    
    func downloadData(completion:[String:AnyObject] -> Void) {
        let configuration: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session: NSURLSession = NSURLSession(configuration:configuration)
        
        let request = NSURLRequest(URL: URL!)
        
        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            do{
                let jsonDict = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! [String:AnyObject]
                completion(jsonDict)
            }
            catch{
                print("json error: \(error)")
            }
            
        });
        task.resume()
    }

}