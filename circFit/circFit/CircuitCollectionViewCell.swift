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
    var activityNumber : Int = 0 {
        didSet {
            activityNumberLabel.text = "#" + String(activityNumber)
        }
    }
    
    var workoutName : String = "" {
        didSet {
            workoutNameLabel.text = workoutName
        }
    }
    var workoutDuration : Int = 0 {
        didSet {
            workoutDurationLabel.text = String(workoutDuration) + " s"
        }
    }
    
    var type : exerciseType? {
        didSet {
            if self.type != nil {
                switch self.type! {
                case .workout:
                    self.backgroundColor = Constants.AppColor.BrilliantBlue
                case .rest:
                    self.backgroundColor = Constants.AppColor.KhakiBrown
                    
                }
            }
        }
    }
    
//MARK: IBOutlets
    @IBOutlet weak var activityNumberLabel: UILabel!
    @IBOutlet weak var workoutDurationLabel: UILabel!
    @IBOutlet weak var workoutNameLabel: UILabel!

    
}
