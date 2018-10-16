//
//  ChangeTempViewController.swift
//  HCI4300
//
//  Created by Syed Ahmed on 2018-10-11.
//  Copyright © 2018 Syed Ahmed. All rights reserved.
//

import UIKit

class ChangeTempViewController: UIViewController {

    @IBOutlet weak var Temp: UILabel!
    @IBAction func saveButton(_ sender: Any) {
        // save something before dismissing it
        if let temperature_Unit = Temp.text {
            let tempUnit = String(temperature_Unit)
            UserDefaults.standard.set(tempUnit, forKey: "temp_unit")
            
            
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeButton(_ sender: Any) {
        if (Temp.text == "°F") {
            Temp.text? = "°C"
        } else {
            Temp.text? = "°F"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tempObject = UserDefaults.standard.object(forKey: "temp_unit")
        
        if let temp_unit = tempObject as? String {
            Temp.text = String(temp_unit)
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
