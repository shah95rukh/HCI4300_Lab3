//
//  ModalViewController.swift
//  HCI4300
//
//  Created by Syed Ahmed on 2018-10-12.
//  Copyright © 2018 Syed Ahmed. All rights reserved.
//

import UIKit



class ModalViewController: UIViewController {

    @IBOutlet weak var Hours: UILabel!
    @IBOutlet weak var Minutes: UILabel!
    @IBOutlet weak var hoursStepper: UIStepper!
    @IBOutlet weak var minutesStepper: UIStepper!
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func StepperMinutesButton(_ sender: UIStepper) {
        Minutes.text = Int(sender.value).description
    }
    @IBAction func StepperHoursButton(_ sender: UIStepper) {
         Hours.text = Int(sender.value).description
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hours Stepper count
        hoursStepper.wraps = true
        hoursStepper.value = 2
        hoursStepper.maximumValue = 24
        hoursStepper.minimumValue = 1
        
        // Minutes Stepper count
        minutesStepper.wraps = true
        minutesStepper.value = 35
        minutesStepper.maximumValue = 60
        minutesStepper.minimumValue = 1

        // Do any additional setup after loading the view.
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
