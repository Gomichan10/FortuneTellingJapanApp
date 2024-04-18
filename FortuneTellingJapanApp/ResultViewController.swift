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
    
    let jsonData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(jsonData)
    }
    

    

}
