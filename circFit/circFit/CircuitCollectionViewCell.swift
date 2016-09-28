//
//  CircuitCollectionViewCell.swift
//  circFit
//
//  Created by Ali Riaz on 2016-09-27.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class CircuitCollectionViewCell: UICollectionViewCell {
    
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
    
    @IBOutlet weak var workoutDurationLabel: UILabel!
    @IBOutlet weak var workoutNameLabel: UILabel!
    
    
}
