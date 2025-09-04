//
//  ViewController.swift
//  BMI Calculator
//
//  Created by SDC-USER on 03/09/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightField: UITextField!
    
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var unitChanger: UISegmentedControl!
    
    
    
    var height: Double?
    var weight: Double?
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUnits(unitChanger)
    }
    
    @IBAction func updateUnits(_ sender: UISegmentedControl) {
        if unitChanger.selectedSegmentIndex == 0 {
            heightField.placeholder = "Height (m)"
        }
        else {
            heightField.placeholder = "Height (inches)"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let heightText = heightField.text, !heightText.isEmpty,
              let weightText = weightField.text, !weightText.isEmpty,
              let height = Double(heightText),
              let weight = Double(weightText),
              height > 0,
              weight > 0 else {
            
            showAlert(title: "Invalid Input", message: "Please enter valid positive numbers for height and weight.")
            return
        }
        
        self.height = height
        self.weight = weight
        
        if unitChanger.selectedSegmentIndex == 0 {
            bmi = (weight / (height * height))
        }
        else {
            bmi = (weight / (height * height * 0.00064516))
        }
        if let destination = segue.destination as? SecondViewController, let bmi = bmi {
            destination.str = String(format: "Calculated BMI: %.2f", bmi)
        }
    }


      @IBAction func calculateButtonTapped(_ sender: Any) {
          guard let heightText = heightField.text, !heightText.isEmpty,
                        let weightText = weightField.text, !weightText.isEmpty,
                        let height = Double(heightText),
                        let weight = Double(weightText),
                        height > 0,
                        weight > 0 else {
                      showAlert(title: "Invalid Input", message: "Please enter valid positive numbers for height and weight.")
                      return
                  }
          performSegue(withIdentifier: "svc", sender: nil)
      }
    
    private func showAlert(title: String, message: String) {
         let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "OK", style: .default))
         present(alertController, animated: true)
     }
}
