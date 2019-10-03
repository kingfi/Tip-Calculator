//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Fianko Buckle on 9/29/19.
//  Copyright © 2019 Fianko Buckle. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var customTipField: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var customTip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func setTip(_ sender: Any) {
           let defaults = UserDefaults.standard
           defaults.set(customTipField.text, forKey: "CustomTip")
           let labelText = customTipField.text ?? "30" + "%"
           customTip.text = labelText + "%"
           
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
