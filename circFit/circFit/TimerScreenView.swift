//
//  TimerScreenView.swift
//  circFit
//
//  Created by Ali Riaz on 2016-10-12.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class TimerScreenView: UIView {
    
    // MARK: Private Outlets
    @IBOutlet weak fileprivate var currentActivityLabel : UILabel!
    @IBOutlet weak fileprivate var nextActivityLabel : UILabel!
    @IBOutlet weak fileprivate var currentTimeRemainingLabel : UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    // MARK: Properties/setters
    var currentActivityName : String = "" {
        didSet {
            self.currentActivityLabel.text = currentActivityName
        }
    }
    var upNextActivityName : String = "" {
        didSet {
            self.nextActivityLabel.text = upNextActivityName
        }
    }
    var currentActivityTimeRemaining = (CurrentWorkoutSingleton.sharedInstance.currentActivity()?.duration)! {
        didSet {
            print (currentActivityTimeRemaining)
            self.currentTimeRemainingLabel.text = String(currentActivityTimeRemaining) + " s"
        }
    }
    var pauseButtonText : String = "Pause" {
        didSet {
            self.pauseButton.titleLabel?.text = pauseButtonText
        }
    }
    
    // MARK: Public methods
    
    func noUpNextActivity() {
        self.nextActivityLabel.text = "End of Workout"
        
    }
    
}
