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
        static let AppGreen : UIColor = UIColor.init(red: 77/255, green: 179/255, blue: 104/255, alpha: 1.0)
        static let WorkoutBlue : UIColor = UIColor.init(red: 80/255, green: 124/255, blue: 192/255, alpha: 1.0)
        static let RestGray : UIColor = UIColor.init(red: 127/255, green: 127/255, blue: 127/255, alpha: 1.0)
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
    }

}
