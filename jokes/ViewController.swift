//
//  ViewController.swift
//  jokes
//
//  Created by faizan on 16/06/16.
//  Copyright © 2016 faizan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
    
{
    var jokes: String = "" {
        didSet {
            textVIew.text = "\(jokes)"
        }
    }
    
    @IBOutlet weak var textVIew: UITextView!
    
    
    
    @IBAction func loadJokes(sender: AnyObject) {
        
        JokeService.GetJokeData{ (joke) in
            
            dispatch_async(dispatch_get_main_queue()) {
                
                self.jokes = (joke?.jokes)!

                
            }
        }

        
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
        
    }
        

   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

