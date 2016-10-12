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
    
    private override init() {
        print ("initialize singleton")
    }
}
