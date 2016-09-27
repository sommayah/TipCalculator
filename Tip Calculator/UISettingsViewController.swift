//
//  UISettingsViewController.swift
//  Tip Calculator
//
//  Created by Sommayah Soliman on 9/25/16.
//  Copyright © 2016 Sommayah Soliman. All rights reserved.
//

import UIKit

class UISettingsViewController: UIViewController {
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(tipSegmentedControl.selectedSegmentIndex, forKey: "tip_percentage")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tip = defaults.integer(forKey: "tip_percentage")
        tipSegmentedControl.selectedSegmentIndex = tip
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
