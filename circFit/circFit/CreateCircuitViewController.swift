//
//  CreateCircuitViewController.swift
//  circFit
//
//  Created by Ali Riaz on 2016-09-27.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

let TestCodeEnabled = false

class CreateCircuitViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var circuitExcercises : [CircuitObject] = []
    let cellIdentifier = String (describing : CircuitCollectionViewCell.self)
    var currentExerciseType : exerciseType = .workout
    
    //TEST
    var testCount = 1

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
        
        self.exerciseNameTextField.autocorrectionType = .no
        self.circuitCollectionView.keyboardDismissMode = .interactive
        self.circuitCollectionView.alwaysBounceVertical = true
        
    }
    
// MARK: IBActions
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        if (TestCodeEnabled) {
            generateTestWorkoutEntries()
        }
        else {
            addWorkoutEntry()
        }
    }
    
    func addWorkoutEntry() {
        if let exerciseName = self.exerciseNameTextField?.text! {
            if (exerciseName == "") {
                showAlertViewForBlankActivityName()
            }
            else {
                if let duration = Int(self.durationTextField.text!) {
                    if (duration == 0) {
                        showAlertForBlankDuration()
                    }
                    else {
                        let newCircuitEntry = CircuitObject(workoutName: exerciseName , duration : duration, type: currentExerciseType)
                        self.circuitExcercises.append(newCircuitEntry)
                        
                        self.circuitCollectionView.reloadData()
                        let bottomIndex : IndexPath = IndexPath.init(item: self.circuitExcercises.count-1, section: 0)
                        self.circuitCollectionView.scrollToItem(at: bottomIndex, at: UICollectionViewScrollPosition.bottom, animated: true)
                    }
                }
                else {
                    showAlertForBlankDuration()
                }
            }
        }
        else {
            showAlertViewForBlankActivityName()
        }
        
    }
    
    fileprivate func addExercisesToWorkoutArray() {
        for exercise in self.circuitExcercises {
            CurrentWorkoutSingleton.sharedInstance.addActivityToCircuit(circObj: exercise)
        }
    }
    
// MARK: Navigation
    
    @IBAction func startButtonPressed(_ sender: AnyObject) {
        addExercisesToWorkoutArray()
        if (CurrentWorkoutSingleton.sharedInstance.circuitContainsActivities()) {
            self.performSegue(withIdentifier: Constants.SegueIdentifiers.ShowTimerScreen, sender: self)
        }
        else {
            self.showAlertViewForEmptyActivities()
        }
    }
    
    @IBAction func unwindToCreateAWorkoutScreen(segue: UIStoryboardSegue) {}
    
    func showAlertViewForEmptyActivities() {
        displayAlertViewWithTitle(title: "No activities added", message: "Please add activities before starting a workout")
    }
    
    func showAlertViewForBlankActivityName() {
        displayAlertViewWithTitle(title: "No activity name", message: "Please enter an activity name")
    }
    
    func showAlertForBlankDuration() {
        displayAlertViewWithTitle(title: "No duration added", message: "Please enter duration (in seconds)")
    }
    
    fileprivate func displayAlertViewWithTitle(title: String, message: String) {
        let noActivitiesAlertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        noActivitiesAlertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(noActivitiesAlertView, animated: true, completion: nil)
    }
    
    // MARK : Test code
    func generateTestWorkoutEntries() {
        let newCircuitEntry = CircuitObject(workoutName: "#" + String(testCount), duration: testCount * 4, type: currentExerciseType)
        testCount += 1
        self.exerciseNameTextField.resignFirstResponder()
        self.durationTextField.resignFirstResponder()
        
        self.circuitExcercises.append(newCircuitEntry)
        
        self.circuitCollectionView.reloadData()
        let bottomIndex : IndexPath = IndexPath.init(item: self.circuitExcercises.count-1, section: 0)
        self.circuitCollectionView.scrollToItem(at: bottomIndex, at: UICollectionViewScrollPosition.bottom, animated: true)
    }
    
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
