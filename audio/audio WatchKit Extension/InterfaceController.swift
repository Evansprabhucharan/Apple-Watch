//
//  InterfaceController.swift
//  audio WatchKit Extension
//
//  Created by Evans Komonduri on 3/16/15.
//  Copyright (c) 2015 com.example. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation


class InterfaceController: WKInterfaceController {

    var audio = AVAudioPlayer()
    
    
    @IBAction func play() {
        
        
      
        audio.play()
        
    }
    
    
    @IBAction func pause() {
        
        audio.pause()
    }
    
    @IBAction func stop() {
        
        audio.stop()
        audio.currentTime=0
    
    }
    
    @IBAction func volume(value: Float) {
    
        audio.volume = value

    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var soundPath = NSBundle.mainBundle().pathForResource("Demo", ofType: "mp3")
        var soundPathURL = NSURL(fileURLWithPath: soundPath!)
        var error:NSError?
        audio = AVAudioPlayer(contentsOfURL: soundPathURL, error: &error)
    
          audio.prepareToPlay()

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
