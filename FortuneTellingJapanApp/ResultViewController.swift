//
//  ResultViewController.swift
//  FortuneTellingJapanApp
//
//  Created by Gomi Kouki on 2024/04/18.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var citizenDayLabel: UILabel!
    @IBOutlet weak var hasCoatLineLabel: UILabel!
    @IBOutlet weak var detailLabel: UITextView!
    
    var jsonString: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        castData()
    }
    
    //jsonデータを[String: Any]型にキャストする関数
    func castData() {
        if let jsonData = jsonString as? [String: Any] {
            setData(jsonData: jsonData)
        } else {
            print("Error: Unable to retrieve JSON data")
        }
    }
    
    //キャストしたjsonデータを出力する関数
    func setData(jsonData: [String:Any]) {
        print(jsonData)
        let name = jsonData["name"] as? String
        nameLabel.text = name
        capitalLabel.text = "県庁所在地：\(jsonData["capital"] as? String ?? "なし")"
        if let citizenDayData = jsonData["citizen_day"] as? [String: Int], let citizenDay = try? JSONDecoder().decode(MonthDay.self, from: JSONSerialization.data(withJSONObject: citizenDayData)) {
            citizenDayLabel.text = "\(name ?? "No Name")県の県民の日は、\(citizenDay.month)月\(citizenDay.day)日です"
        } else {
            citizenDayLabel.text = "\(name ?? "No Name")県は県民の日がありません"
        }
        if jsonData["has_coast_line"] as? Bool == true {
            hasCoatLineLabel.text = "海岸線：あり"
        } else {
            hasCoatLineLabel.text = "海岸線：なし"
        }
        detailLabel.text = jsonData["brief"] as? String
        if let urlString = jsonData["logo_url"] as? String, let url = URL(string: urlString) {
            setImage(url: url)
        } else {
            print("Error: Failed to properly store the URL in a variable")
        }
    }
    
    //都道府県の画像を出力する関数
    func setImage(url: URL) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.logoImage.image = image
                    }
                }
            } catch {
                print(error)
            }
        }
    }

}
