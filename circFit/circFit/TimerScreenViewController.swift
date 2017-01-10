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
    
    fileprivate var timerPaused : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWorkoutLabels()
        updateTimeLeftLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(timerTriggered), name: Notification.Name(rawValue: Constants.TimerNotifications.TimerTriggeredEverySecond), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateWorkoutLabels), name: Notification.Name(rawValue: Constants.TimerNotifications.NewTimerInitialized), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: Constants.TimerNotifications.NewTimerInitialized), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: Constants.TimerNotifications.TimerTriggeredEverySecond), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateWorkoutLabels()
        self.timerScreenView.currentActivityTimeRemaining = (CurrentWorkoutSingleton.sharedInstance.currentActivity()?.duration)!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.TimerNotifications.StartTimer), object: nil, userInfo: nil)
    }
    
    func timerTriggered() {
        updateTimeLeftLabel()
    }
    
    func updateTimeLeftLabel() {
        self.timerScreenView.currentActivityTimeRemaining = CurrentWorkoutSingleton.sharedInstance.currentWorkoutRemainingDuration
    }
    
    func updateWorkoutLabels() {
        if let currentExercise = CurrentWorkoutSingleton.sharedInstance.currentActivity() {
            self.timerScreenView.currentActivityTimeRemaining = CurrentWorkoutSingleton.sharedInstance.currentWorkoutRemainingDuration
            self.timerScreenView.currentActivityName = currentExercise.workoutName!
            
            if let upNextActivity = CurrentWorkoutSingleton.sharedInstance.upNextActivity() {
                self.timerScreenView.upNextActivityName = upNextActivity.workoutName!
            }
            else {
                self.timerScreenView.noUpNextActivity()
            }
        }
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        self.timerPaused = !self.timerPaused
        if (self.timerPaused) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.TimerNotifications.PauseTimer), object: nil, userInfo: nil)
            self.timerScreenView.pauseButtonText = "Start"
        }
        else {
            NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.TimerNotifications.StartTimer), object: nil, userInfo: nil)
            self.timerScreenView.pauseButtonText = "Pause"
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.TimerNotifications.EndSession), object: nil, userInfo: nil)
        self.performSegue(withIdentifier:  Constants.SegueIdentifiers.UnwindToCreateWorkoutScreen , sender: self)
    }

}
