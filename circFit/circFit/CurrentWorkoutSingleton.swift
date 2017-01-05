//
//  CurrentWorkoutSingleton.swift
//  circFit
//
//  Created by Ali Riaz on 2016-10-11.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class CurrentWorkoutSingleton: NSObject {
    static let sharedInstance = CurrentWorkoutSingleton()
    var workoutArray = [CircuitObject]()
    var workoutTimer : Timer!
    var currentWorkoutRemainingDuration : Int = 0
    
    private override init() {
        print ("initialize singleton")
        super.init()
        
        setupNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: Constants.TimerNotifications.StartTimer), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: Constants.TimerNotifications.PauseTimer), object: nil)
    }
    
    fileprivate func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(initializeTimer), name: NSNotification.Name(rawValue: Constants.TimerNotifications.StartTimer), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(pauseTimer), name: NSNotification.Name(rawValue: Constants.TimerNotifications.PauseTimer), object: nil)
    }
    
    func initializeTimer() {
        //Check if timer was paused before
        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.TimerNotifications.NewTimerInitialized), object: nil)
        if (self.currentWorkoutRemainingDuration == 0) {
            self.currentWorkoutRemainingDuration = (self.workoutArray.first?.duration!)!
        }
        
        self.workoutTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(CurrentWorkoutSingleton.triggerTimerEverySecond), userInfo: nil, repeats: true)
    }
    
    func pauseTimer() {
        self.workoutTimer.invalidate()
    }
    
    func triggerTimerEverySecond() {
        self.currentWorkoutRemainingDuration -= 1
        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.TimerNotifications.TimerTriggeredEverySecond), object: nil, userInfo: nil)
        
        if (self.currentWorkoutRemainingDuration <= 0) {
            exerciseFinished()
        }
    }
    
    func exerciseFinished() {
        pauseTimer()
        self.currentWorkoutRemainingDuration = 0
        self.workoutArray.removeFirst()
        
        if (self.workoutArray.count >= 1) {
            initializeTimer()
        }
    }
}
