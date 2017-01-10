//
//  Constants.swift
//  circFit
//
//  Created by Ali Riaz on 2016-10-04.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class Constants: NSObject {
    
    struct AppColor {
        static let BrilliantBlue : UIColor = UIColor.init(red: 53/255, green: 167/255, blue: 255/255, alpha: 1.0)
        static let KhakiBrown : UIColor = UIColor.init(red: 206/255, green: 168/255, blue: 146/255, alpha: 1.0)
        static let FieryRose : UIColor = UIColor.init(red: 255/255, green: 89/255, blue: 100/255, alpha: 1.0)
        static let BrightYellow : UIColor = UIColor.init(red: 255/255, green: 231/255, blue: 76/255, alpha: 1.0)
    }
    
    struct SegueIdentifiers {
        static let ShowTimerScreen : String = "TimerStoryboardSegue"
        static let UnwindToCreateWorkoutScreen : String = "unwindToCreateAWorkoutScreen"
    }
    
    struct TimerNotifications {
        static let StartTimer : String = "StartTimer"
        static let PauseTimer : String = "PauseTimer"
        static let TimerTriggeredEverySecond : String = "TimerTriggeredEverySecond"
        static let NewTimerInitialized = "NewTimerInitialized"
        static let EndSession = "EndSessionNotification"
    }

}
