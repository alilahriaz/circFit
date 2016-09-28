//
//  CreateCircuitViewController.swift
//  circFit
//
//  Created by Ali Riaz on 2016-09-27.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

import UIKit

class CreateCircuitViewController: UIViewController {
    
    var circuitExcercises : [CircuitObject] = []
    let cellIdentifier = String(CircuitCollectionViewCell)

    @IBOutlet weak var circuitCollectionView: UICollectionView!
    @IBOutlet weak var exerciseNameTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    
    @IBAction func enterButtonPressed(sender: UIButton) {
        let newCircuitEntry = CircuitObject(workoutName: self.exerciseNameTextField.text! , duration : Int(self.durationTextField.text!)!)
        
        
        circuitExcercises.append(newCircuitEntry)
        
        circuitCollectionView.reloadData()
    }
    
}

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

extension CreateCircuitViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.width, 100.0)
    }
    
}
