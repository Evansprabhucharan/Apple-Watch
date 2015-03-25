//
//  InterfaceController.swift
//  image download and caching WatchKit Extension
//
//  Created by Evans Komonduri on 3/18/15.
//  Copyright (c) 2015 com.example. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var image: WKInterfaceImage!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        //setting local path!
        let path: AnyObject = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
     
        let destinationPath = path.stringByAppendingPathComponent("BMW.png")
       
        //seraching the local location for the file!
        var fileManager = NSFileManager.defaultManager()
        
        if fileManager.fileExistsAtPath(destinationPath){
    
                var outputImage = UIImage(contentsOfFile: destinationPath)
               
                image.setImage(outputImage)
        
        // if the file is not found in the local location it is downloaded from web!
        }else{
        
            
            var image = NSURL(string: "http://upload.wikimedia.org/wikipedia/commons/thumb/4/44/BMW.svg/300px-BMW.svg.png")
        
            let task = NSURLSession.sharedSession().dataTaskWithURL(image!, completionHandler: { (data, response, error) -> Void in
            
            if error == nil{
                
                var outputImage = UIImage(data: data)
                
                self.image.setImage(outputImage)

                
                UIImagePNGRepresentation(outputImage).writeToFile(destinationPath, atomically: true)
                
                
                
            }else{
                println(error)
            }
        
        })
        task.resume()
        }
    
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
