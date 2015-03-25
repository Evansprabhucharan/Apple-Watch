//
//  InterfaceController.swift
//  Tables WatchKit Extension
//
//  Created by Evans Komonduri on 3/16/15.
//  Copyright (c) 2015 com.example. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet weak var table: WKInterfaceTable!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // sets the number of rows!
        table.setNumberOfRows(10, withRowType: "tableRowController")
       
        var i = 0;
        
        for(i ; i < 10 ; i++){
            
            //points to the particular row in the Table.
            let row = table.rowControllerAtIndex(i) as tableRowController
            
            //setting text to the label.
            row.rowLabel.setText("Row \(i+1)")
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
