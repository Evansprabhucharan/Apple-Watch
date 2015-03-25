//
//  InterfaceController.swift
//  processingXML WatchKit Extension
//
//  Created by Evans Komonduri on 3/19/15.
//  Copyright (c) 2015 com.example. All rights reserved.
//

import WatchKit
import Foundation



class InterfaceController: WKInterfaceController, NSXMLParserDelegate {
    
    var titles = [String]()

    
    @IBOutlet weak var table: WKInterfaceTable!
    
        var element = ""
        var collectItem = false
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        
        element = elementName  // setting the value of elementName to element.
        
        
    }

    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
    
        if element == "item" {
                collectItem = true
        }
        if element == "title" && collectItem == true && string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) != "" {
            
            titles.append(string)
            
        }
    
    }

    override func awakeWithContext(context: AnyObject?) {
        
        super.awakeWithContext(context)
        
        let url = NSURL(string: "http://images.apple.com/main/rss/hotnews/hotnews.rss")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            if error == nil{
                
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                println(urlContent)
                
                var xmlParser = NSXMLParser()  // object to control XML parsing process.
               
                xmlParser = NSXMLParser(data: data)  // object set to XMLParser and defined with the downloaded data.
                
                xmlParser.delegate = self // defining InterfaceController to be the delegate for XMLParser i.e allowing InterfaceContrller to control the XMLParser.
                
                xmlParser.parse() // Instructing XMLParser to parse the data that has been downloaded.
                
                self.table.setNumberOfRows(self.titles.count, withRowType: "tableRowController")
                
                for(index, title) in enumerate(self.titles){
                
                let row = self.table.rowControllerAtIndex(index) as tableRowController
                
                row.rowLabel.setText(title)
                }
                
            }else{
                
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
