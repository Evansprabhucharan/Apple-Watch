//
//  InterfaceController.swift
//  firstApp WatchKit Extension
//
//  Created by Evans Komonduri on 3/12/15.
//  Copyright (c) 2015 com.example. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    
    var audio = AVAudioPlayer()
    
    @IBAction func sleeping() {
        nameLabel.setText("Sleping!!")
    }
    
    @IBAction func awake() {
        
        nameLabel.setText("Awake!!")
    }
    
    
    @IBAction func buttonPressed() {
        
             nameLabel.setText("Hi There! This is E !")
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
