//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by SDC-USER on 03/09/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var str: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = str
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
