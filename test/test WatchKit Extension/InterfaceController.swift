//
//  InterfaceController.swift
//  test WatchKit Extension
//
//  Created by Evans Komonduri on 3/13/15.
//  Copyright (c) 2015 com.example. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var output: WKInterfaceLabel!
    
    var n:Int=5
    
    @IBAction func slider(value: Float) {
    
        n = Int(value)
        output.setText("Value is \(n)")
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
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
