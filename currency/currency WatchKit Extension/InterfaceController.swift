//
//  InterfaceController.swift
//  currency WatchKit Extension
//
//  Created by Evans Komonduri on 3/19/15.
//  Copyright (c) 2015 com.example. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var currencies = ["x","y","z","m"]
    
    @IBOutlet weak var currencyDisplay: WKInterfaceLabel!

    @IBAction func slider(value: Float) {
    
        var s = Int(value)
        
        currencyDisplay.setText(currencies[s])
        
    }


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
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
