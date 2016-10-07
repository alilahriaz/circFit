//
//  SavedWorkoutsViewController.swift
//  circFit
//
//  Created by Ali Riaz on 2016-10-06.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class SavedWorkoutsViewController: UIViewController {
    
    // Mark: -Outlets
    
    @IBOutlet weak var savedWorkoutsListView: UIView!
    @IBOutlet weak var noSavedView: UIView!
    @IBOutlet weak var createWorkoutView: UIView!
    
    // Mark: - Properties
    var savedWorkouts = 0
    //change to read from manager

    override func viewDidLoad() {
        super.viewDidLoad()

        if (savedWorkouts > 0) {
            //show the saved workouts
        }
        else {
            self.showEmptyState()
        }
    }
    
    func showEmptyState() {
        self.noSavedView.isHidden = false
        self.savedWorkoutsListView.isHidden = true
    }
    
    @IBAction func createWorkoutButtonPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showCreateWorkoutViewController", sender: self)
    }
    

}
