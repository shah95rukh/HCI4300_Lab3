//
//  ViewController.swift
//  HCI4300
//
//  Created by Syed Ahmed on 2018-10-11.
//  Copyright © 2018 Syed Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    @IBOutlet weak var currentTime: UILabel!
    
    @IBOutlet weak var Temp: UILabel!
    
    @IBAction func increaseTemp(_ sender: UITapGestureRecognizer) {
        // Celsius temp change
        if (Temp.text == "21") {
            Temp.text? = "22"
        } else if (Temp.text == "22") {
            Temp.text? = "23"
        }
        
        // Fahr temp change
        if (Temp.text == "71") {
            Temp.text? = "72"
        } else if (Temp.text == "72") {
            Temp.text? = "73"
        }
        
        if let temperature = Temp.text {
            let temp = Int(temperature)
            UserDefaults.standard.set(temp, forKey: "temp_value")
        }
    }
    @IBOutlet weak var tempUnitLabel: UILabel!
    
    
    @IBAction func LongPressDecrease(_ sender: UILongPressGestureRecognizer) {
        let modalViewController = storyboard?.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
        
        present(modalViewController, animated: true, completion: nil)
    }
    
    @IBAction func LongPressIncrease(_ sender: UILongPressGestureRecognizer) {
        
        let modalViewController = storyboard?.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
        
        present(modalViewController, animated: true, completion: nil)
    }
    
    @IBAction func decreaseTemp(_ sender: Any) {
        // Celsius temp change
        if (Temp.text == "22") {
            Temp.text? = "21"
        } else if (Temp.text == "23") {
            Temp.text? = "22"
        }
        
        // Fahr temp change
        if (Temp.text == "73") {
            Temp.text? = "72"
        } else if (Temp.text == "72") {
            Temp.text? = "71"
        }
        
        if let temperature = Temp.text {
            let temp = Int(temperature)
            UserDefaults.standard.set(temp, forKey: "temp_value")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentTime.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Pull Temperature Unit
        let tempObject = UserDefaults.standard.object(forKey: "temp_unit")
        
        if let temp_unit = tempObject as? String {
            tempUnitLabel.text = String(temp_unit)
        }
        
        // Pull Temperature
        let temp_valueObject = UserDefaults.standard.object(forKey: "temp_value")
        
        if let temp_value = temp_valueObject as? Int {
            Temp.text = String(temp_value)
        }
        
        // Do Celsius to Fahr Conversion
        if (tempUnitLabel.text == "°F") {
            if (Temp.text == "23") {
                Temp.text? = "73"
            } else if (Temp.text == "21") {
                Temp.text? = "71"
            } else if (Temp.text == "22") {
                Temp.text? = "72"
            }
        } else if (tempUnitLabel.text == "°C") {
            if (Temp.text == "73") {
                Temp.text? = "23"
            } else if (Temp.text == "71") {
                Temp.text? = "21"
            } else if (Temp.text == "72") {
                Temp.text? = "22"
            }
        }
    }
    
    @objc func tick() {
        currentTime.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    }
}

