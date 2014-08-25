//
//  ViewController.swift
//  Web Service Example
//
//  Created by Nick Ross on 8/22/14.
//  Copyright (c) 2014 Nick Ross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var myNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Implement indicator
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET( "http:/graph.facebook.com/bobdylan",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                println("JSON: " + responseObject.description)
                
                if let myName = responseObject.valueForKey("name") as? String {
                    self.myNameLabel.text = myName
                }
                activityIndicator.stopAnimating()
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

