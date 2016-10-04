//
//  CircuitCollectionViewCell.swift
//  circFit
//
//  Created by Ali Riaz on 2016-09-27.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class CircuitCollectionViewCell: UICollectionViewCell {
    
// MARK: properties
    var workoutName : String = "" {
        didSet {
            workoutNameLabel.text = workoutName
        }
    }
    var workoutDuration : Int = 0 {
        didSet {
            workoutDurationLabel.text = String(workoutDuration)
        }
    }
    
    var type : exerciseType? {
        didSet {
            if self.type != nil {
                switch self.type! {
                case .Workout:
                    self.backgroundColor = Constants.AppColor.WorkoutBlue
                case .Rest:
                    self.backgroundColor = UIColor.grayColor()
                }
            }
        }
    }
    
//MARK: IBOutlets
    @IBOutlet weak var workoutDurationLabel: UILabel!
    @IBOutlet weak var workoutNameLabel: UILabel!

    
}
