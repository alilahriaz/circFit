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
    let cellIdentifier = String (describing : CircuitCollectionViewCell.self)
    var currentExerciseType : exerciseType = .workout

// MARK: IBOutlets
    @IBOutlet weak var circuitCollectionView: UICollectionView!
    @IBOutlet weak var exerciseNameTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var exerciseTypePickerView: UIPickerView!
    @IBOutlet weak var addCircuitFormView: UIView!
    
// MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exerciseTypePickerView.delegate = self;
        self.exerciseTypePickerView.dataSource = self;
    }
    
// MARK: IBActions
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        
        if let exerciseName = self.exerciseNameTextField?.text! {
            if let duration = Int(self.durationTextField.text!) {
                let newCircuitEntry = CircuitObject(workoutName: exerciseName , duration : duration, type: currentExerciseType)
                self.circuitExcercises.append(newCircuitEntry)
                CurrentWorkoutSingleton.sharedInstance.workoutArray.append(newCircuitEntry)
                
                self.circuitCollectionView.reloadData()
                let bottomIndex : IndexPath = IndexPath.init(item: self.circuitExcercises.count-1, section: 0)
                self.circuitCollectionView.scrollToItem(at: bottomIndex, at: UICollectionViewScrollPosition.bottom, animated: true)
            }
            else {
                print("Please add a duration")
            }
        }
        else {
            print("Please add an exercise name")
        }
    }
    
    @IBAction func unwindToCreateAWorkoutScreen(segue: UIStoryboardSegue) {}
    
// MARK: UIPickerView DataSource
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return exerciseType.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
// MARK: UIPickerView Delegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let type = exerciseType(rawValue: row)
        self.currentExerciseType = type!
        
        if (self.currentExerciseType == .rest) {
            self.restSelectedFromPickerView()
        }
        else {
            self.workoutSelectedFromPickerView()
        }
    }
    
    func restSelectedFromPickerView() {
        self.exerciseNameTextField.text = "Rest"
        self.exerciseNameTextField.isEnabled = false
        self.addCircuitFormView.backgroundColor = Constants.AppColor.RestGray
    }
    
    func workoutSelectedFromPickerView() {
        self.exerciseNameTextField.isEnabled = true
        self.exerciseNameTextField.text = ""
        self.addCircuitFormView.backgroundColor = Constants.AppColor.AppGreen
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let type = exerciseType(rawValue: row)
        return type?.description
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel : UILabel?
        
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "System", size: 20.0)
            pickerLabel?.textColor = UIColor.white
            pickerLabel?.textAlignment = NSTextAlignment.center
        }
        pickerLabel?.text = exerciseType(rawValue: row)?.description
        
        return pickerLabel!
    }
}

//MARK: UICollectionView DataSource
extension CreateCircuitViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return circuitExcercises.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CircuitCollectionViewCell
        let circuit = self.circuitExcercises[(indexPath as NSIndexPath).item]
        cell.workoutName = circuit.workoutName!
        cell.workoutDuration = circuit.duration!
        cell.type = circuit.type
        
        return cell
    }
}

//MARK: UICollectionViewFlow Delegate
extension CreateCircuitViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100.0)
    }
}
