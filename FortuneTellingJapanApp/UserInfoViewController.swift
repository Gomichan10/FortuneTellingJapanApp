//
//  UserInfoViewController.swift
//  FortuneTellingJapanApp
//
//  Created by Gomi Kouki on 2024/04/16.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var bloodPicker: UIPickerView!
    
    var year = 0
    var month = 0
    var day = 0
    
    let bloodType = ["a", "b", "ab", "o"]
    var userBloodType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bloodPicker.dataSource = self
        bloodPicker.delegate = self
        
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let calendar = Calendar.current
        year = calendar.component(.year, from: sender.date)
        month = calendar.component(.month, from: sender.date)
        day = calendar.component(.day, from: sender.date)
        
        print(year,month,day)
    }
    

}

extension UserInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bloodType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bloodType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userBloodType = bloodType[row]
        print(userBloodType)
    }
}
