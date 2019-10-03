//
//  ViewController.swift
//  tipCalculator
//
//  Created by Fianko Buckle on 9/21/19.
//  Copyright © 2019 Fianko Buckle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let bill = Double(billField.text!) ?? 0
        let customTipString = defaults.string(forKey: "CustomTip") ?? "30"
        let customTip = Double(customTipString) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2,customTip/100]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    @IBAction func goToSettingsPage(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender:self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let customTipString = defaults.string(forKey: "CustomTip") ?? "Custom"
        tipControl.setTitle(customTipString + "%", forSegmentAt: 3)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
}

