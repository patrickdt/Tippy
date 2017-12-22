//
//  ViewController.swift
//  tippy
//
//  Created by Patrick Tirtapraja on 12/13/17.
//  Copyright © 2017 Patrick Tirtapraja. All rights reserved.
//

import UIKit

let tipPercentages = [0.18, 0.20, 0.25]

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tipDefault = UserDefaults.standard
        tipDefault.set(18, forKey: "one")
        tipDefault.set(20, forKey: "two")
        tipDefault.set(25, forKey: "three")
        tipDefault.synchronize()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip
        // amount
        let tipDefault = UserDefaults.standard
        let tip1 = tipDefault.double(forKey:"one")
        let tip2 = tipDefault.double(forKey:"two")
        let tip3 = tipDefault.double(forKey:"three")
        tipControl.setTitle(String(tip1) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(tip2) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(tip3) + "%", forSegmentAt: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipDefault = UserDefaults.standard
        
        //let tip1 = tipDefaults.double(forKey: "myDouble") ?? "tip1"
        //let doubleValue = tipDefault.double(forKey: "myDouble")
        let tip1 = tipDefault.double(forKey:"one")
        let tip2 = tipDefault.double(forKey:"two")
        let tip3 = tipDefault.double(forKey:"three")
        let tipPercentages = [tip1, tip2, tip3]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100
        let total = bill + tip
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
    }
    
}

