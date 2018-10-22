//
//  ModalViewController.swift
//  HCI4300
//
//  Created by Syed Ahmed on 2018-10-12.
//  Copyright © 2018 Syed Ahmed. All rights reserved.
//

import UIKit



class ModalViewController: UIViewController {

    @IBOutlet weak var tempValue: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var Hours: UILabel!
    @IBOutlet weak var Minutes: UILabel!
    @IBOutlet weak var hoursStepper: UIStepper!
    @IBOutlet weak var minutesStepper: UIStepper!
    @IBOutlet weak var holdStepper: UIStepper!
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveModal(_ sender: Any) {
        if let temperature_set = tempValue.text {
            let setTemp = Int(temperature_set)
            UserDefaults.standard.set(setTemp, forKey: "set_temp")
            
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func StepperHoldButton(_ sender: UIStepper) {
        tempValue.text = Int(sender.value).description
    }
    @IBAction func StepperMinutesButton(_ sender: UIStepper) {
        Minutes.text = Int(sender.value).description
    }
    @IBAction func StepperHoursButton(_ sender: UIStepper) {
         Hours.text = Int(sender.value).description
    }
   
    
    override func viewDidAppear(_ animated: Bool) {
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
        
        // Pull Temperature Unit
        let tempObject = UserDefaults.standard.object(forKey: "temp_unit")
        
        if let temp_unit = tempObject as? String {
            tempLabel.text = String(temp_unit)
        }
        
        // Stepper customization
        if (tempLabel.text == "°F") {
            tempValue.text = "73"
            holdStepper.value = 73
            holdStepper.maximumValue = 95
            holdStepper.minimumValue = 50
        } else if (tempLabel.text == "°C") {
            holdStepper.value = 23
            holdStepper.maximumValue = 35
            holdStepper.minimumValue = 10
            tempValue.text = "23"
        }
        
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
