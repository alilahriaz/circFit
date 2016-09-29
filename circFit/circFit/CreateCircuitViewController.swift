//
//  CreateCircuitViewController.swift
//  circFit
//
//  Created by Ali Riaz on 2016-09-27.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class CreateCircuitViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var circuitExcercises : [CircuitObject] = []
    let cellIdentifier = String(CircuitCollectionViewCell)
    var currentExerciseType : exerciseType = .Workout

// MARK: IBOutlets
    @IBOutlet weak var circuitCollectionView: UICollectionView!
    @IBOutlet weak var exerciseNameTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var exerciseTypePickerView: UIPickerView!
    
// MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exerciseTypePickerView.delegate = self;
        self.exerciseTypePickerView.dataSource = self;
    }
    
// MARK: IBActions
    @IBAction func enterButtonPressed(sender: UIButton) {
        
        if let exerciseName = self.exerciseNameTextField?.text! {
            if let duration = Int(self.durationTextField.text!) {
                
                let newCircuitEntry = CircuitObject(workoutName: exerciseName , duration : duration, type: currentExerciseType)
                self.circuitExcercises.append(newCircuitEntry)
                
                self.circuitCollectionView.reloadData()
            }
            else {
                print("Please add a duration")
            }
        }
        else {
            print("Please add an exercise name")
        }
    }
    
// MARK: UIPickerView DataSource
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return exerciseType.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
// MARK: UIPickerView Delegate
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let type = exerciseType(rawValue: row)
        self.currentExerciseType = type!
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let type = exerciseType(rawValue: row)
        return type?.description
    }
}

//UICollectionView DataSource
extension CreateCircuitViewController : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return circuitExcercises.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! CircuitCollectionViewCell
        let circuit = self.circuitExcercises[indexPath.item]
        cell.workoutName = circuit.workoutName!
        cell.workoutDuration = circuit.duration!
        
        return cell
    }
}

//UICollectionViewFlow Delegate
extension CreateCircuitViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.width, 100.0)
    }
    
}
