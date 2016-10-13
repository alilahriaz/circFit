//
//  TimerScreenViewController.swift
//  circFit
//
//  Created by Ali Riaz on 2016-10-10.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class TimerScreenViewController: UIViewController {

    @IBOutlet var timerScreenView: TimerScreenView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CurrentWorkoutSingleton.sharedInstance.workoutArray.count > 0) {
            self.timerScreenView.currentActivityName.text = CurrentWorkoutSingleton.sharedInstance.workoutArray.first?.workoutName
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier:  Constants.SegueIdentifiers.UnwindToCreateWorkoutScreen , sender: self)
    }

}
