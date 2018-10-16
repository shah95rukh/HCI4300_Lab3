//
//  ScheduleViewController.swift
//  HCI4300
//
//  Created by Syed Ahmed on 2018-10-11.
//  Copyright © 2018 Syed Ahmed. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

class ScheduleViewController: UIViewController {

    @IBOutlet weak var tempUnitLabel: UILabel!
    @IBOutlet weak var Temp: UILabel!
    @IBOutlet weak var stepperValue: UIStepper!
    @IBOutlet weak var fromDate: UIDatePicker!
    @IBOutlet weak var ToDate: UIDatePicker!
    
    @IBAction func Stepper(_ sender: UIStepper) {
        Temp.text = Int(sender.value).description
    }

    
    override func viewDidAppear(_ animated: Bool) {
        // Pull Temperature Unit
        let tempObject = UserDefaults.standard.object(forKey: "temp_unit")
        
        if let temp_unit = tempObject as? String {
            tempUnitLabel.text = String(temp_unit)
        }
        
        // Stepper customization
        if (tempUnitLabel.text == "°F") {
            Temp.text = "73"
            stepperValue.value = 73
            stepperValue.maximumValue = 95
            stepperValue.minimumValue = 50
        } else if (tempUnitLabel.text == "°C") {
            stepperValue.value = 23
            stepperValue.maximumValue = 35
            stepperValue.minimumValue = 10
            Temp.text = "23"
        }
        
        
        // Date customization
        fromDate.minimumDate = Date()
        ToDate.minimumDate = Date()
        
 
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
