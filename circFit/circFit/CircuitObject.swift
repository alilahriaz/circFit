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
    var type : exerciseType
    
    init(workoutName:String, duration:Int, type:exerciseType) {
        self.workoutName = workoutName
        self.duration = duration
        self.type = type
    }
}

enum exerciseType: Int, CustomStringConvertible {
    case workout = 0
    case rest = 1
    
    static var count: Int { return exerciseType.rest.rawValue + 1 }
    
    var description: String {
        switch self {
        case .workout:
            return "Workout"
        case .rest:
            return "Rest"
        }
    }
    
    init?(value: Int) {
        switch value {
        case 0:
            self = .workout
        case 1:
            self = .rest
        default:
            return nil
        }
    }
    
    
}
