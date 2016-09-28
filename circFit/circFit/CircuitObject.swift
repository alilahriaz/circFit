//
//  CircuitObject.swift
//  circFit
//
//  Created by Ali Riaz on 2016-09-27.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class CircuitObject: NSObject {

    var workoutName : String?
    var duration : Int?
    
    init(workoutName:String, duration:Int) {
        self.workoutName = workoutName
        self.duration = duration
    }
}
