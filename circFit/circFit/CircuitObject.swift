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
    case Workout = 0
    case Rest = 1
    
    static var count: Int { return exerciseType.Rest.rawValue + 1 }
    
    var description: String {
        switch self {
        case .Workout:
            return "Workout"
        case .Rest:
            return "Rest"
        }
    }
    
    init?(value: Int) {
        switch value {
        case 0:
            self = .Workout
        case 1:
            self = .Rest
        default:
            return nil
        }
    }
    
    
}
