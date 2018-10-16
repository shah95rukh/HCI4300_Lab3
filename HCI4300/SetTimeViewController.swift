//
//  SetTimeViewController.swift
//  HCI4300
//
//  Created by Syed Ahmed on 2018-10-11.
//  Copyright © 2018 Syed Ahmed. All rights reserved.
//

import UIKit

class SetTimeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var TimeZonePicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let colors = ["Newfoundland Time -3.5", "Atlantic Time -4", "Eastern Time -5", "Central Time -6", "Mountain Time -7", "Pacific Time -8"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButton(_ sender: Any) {
        // Save something before dismissing
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TimeZonePicker.selectRow(2, inComponent: 0, animated: true)
        datePicker.minimumDate = Date()
        
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
