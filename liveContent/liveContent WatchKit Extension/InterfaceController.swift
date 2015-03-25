//
//  InterfaceController.swift
//  liveContent WatchKit Extension
//
//  Created by Evans Komonduri on 3/17/15.
//  Copyright (c) 2015 com.example. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let url = NSURL(string: "http://www.applewatchdevelopercourse.com/message.html")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            if error == nil{
                
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                self.label.setText(urlContent)
                
            } else{
                println(error)
            }
        })
        task.resume()
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
