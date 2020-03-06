//
//  ViewController.swift
//  Stop Watch (iOS)
//
//  Created by Anubhav Singh on 07/03/20.
//  Copyright © 2020 singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
        

        var counter: Float = 0.0 {
            // Property observer
            didSet {
                timerLabel.text = String(format: "%.1f", counter)
            }
        }
        // Give timer a default value so that timer will not be Optional
        // No need to unpack later
        // var timer = Timer()
        
        // This definition can reclaim memory when the timer is not used
        var timer: Timer? = Timer()
        var isPlaying = false
        
        // Knowledge points: storage attributes and calculated attributes
        override var preferredStatusBarStyle: UIStatusBarStyle {
            // Read-only calculated attributes, can get rid of get and curly braces
    //        get {
    //            return UIStatusBarStyle.lightContent
    //        }
            return UIStatusBarStyle.lightContent
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // timeLabel.text = String(counter)
            
            // Change to using Property Watcher to monitor and respond to changes in property values
            counter = 0.0
        }
    
    @IBAction func resetButtonDidTouch(_ sender: UIButton) {
   if let timerTemp = timer {
       timerTemp.invalidate()
   }
   timer = nil
   isPlaying = false
   counter = 0
   playButton.isEnabled = true
   pauseButton.isEnabled = true

    }
    
    @IBAction func playButtonDidTouch(_ sender: UIButton) {
   playButton.isEnabled = false
   pauseButton.isEnabled = true
   timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
   isPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: UIButton) {
   playButton.isEnabled = true
   pauseButton.isEnabled = false
   if let timerTemp = timer {
       timerTemp.invalidate()
   }
   timer = nil
   isPlaying = false
   
    }
    
    @objc func UpdateTimer() {
         counter = counter + 0.1
     }


}

