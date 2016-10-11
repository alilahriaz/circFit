//
//  TimerScreenViewController.swift
//  circFit
//
//  Created by Ali Riaz on 2016-10-10.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class TimerScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "unwindToCreateAWorkoutScreen", sender: self)
    }

}
