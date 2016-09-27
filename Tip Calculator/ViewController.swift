//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Sommayah Soliman on 9/22/16.
//  Copyright © 2016 Sommayah Soliman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        let defaults = UserDefaults.standard
        let tip = defaults.integer(forKey: "tip_percentage")
        tipControl.selectedSegmentIndex = tip
        let bill = defaults.double(forKey:"bill_value")
        if(bill != 0){
            billField.text = String(format: "%.2f", bill)
        }
        updateTip()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tip_percentage")
        defaults.set(Double(billField.text!) ?? 0, forKey:"bill_value")
        defaults.synchronize()
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        updateTip()
    }
    
    func updateTip(){
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

