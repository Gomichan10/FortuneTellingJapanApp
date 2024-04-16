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
        
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    /// DatePickerの値が変更されたときに年、月、日を更新し、コンソールに表示する関数です
    @objc func dateChanged(_ sender: UIDatePicker) {
        let calendar = Calendar.current
        year = calendar.component(.year, from: sender.date)
        month = calendar.component(.month, from: sender.date)
        day = calendar.component(.day, from: sender.date)
        
        print(year,month,day)
    }
    
    /// 指定されたメッセージを含むアラートダイアログを表示する関数
    func errorMessage(_ message: String) {
        let alert = UIAlertController(title: "エラー", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func fortuneTellingButton(_ sender: Any) {
        if !checkName() || !checkDate() || !checkBlood() {
            print("Error")
        }
    }
    
    //名前が入力されているかのチェック
    func checkName() -> Bool {
        if userName.text == "" {
            errorMessage("名前が入力されてません。")
            return false
        }
        return true
    }
    //誕生日が入力されているかのチェック
    func checkDate() -> Bool {
        if year == 0 || month == 0 || day == 0 {
            errorMessage("誕生日が設定されていません。")
            return false
        }
        return true
    }
    
    //血液型が入力されているかのチェック
    func checkBlood() -> Bool {
        if userBloodType == "" {
            errorMessage("血液型が設定されていません。")
            return false
        }
        return true
    }
    
    

}


extension UserInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    //ここではPickerViewの列数を決めています
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //ここではPickerViewの行数を決めています
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bloodType.count
    }
    
    // UIPickerViewに表示する配列（内容）
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bloodType[row]
    }
    
    // UIPickerViewが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userBloodType = bloodType[row]
        print(userBloodType)
    }
}
