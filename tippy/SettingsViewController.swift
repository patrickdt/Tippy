//
//  SettingsViewController.swift
//  tippy
//
//  Created by Patrick Tirtapraja on 12/22/17.
//  Copyright © 2017 Patrick Tirtapraja. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tipDefault = UserDefaults.standard
        
        tipDefault.set(Double(tip1Field.text!), forKey: "one")
        tipDefault.set(Double(tip2Field.text!), forKey: "two")
        tipDefault.set(Double(tip3Field.text!), forKey: "three")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func setTipValues(_ sender: Any) {
        
        let tipDefault = UserDefaults.standard
        
        ///let tip1 = Double(tip1Field.text!) ?? 0
        //let tip2 = Double(tip2Field.text!) ?? 0
        //let tip3 = Double(tip3Field.text!) ?? 0
        
        tipDefault.set(Double(tip1Field.text!), forKey: "one")
        tipDefault.set(Double(tip2Field.text!), forKey: "two")
        tipDefault.set(Double(tip3Field.text!), forKey: "three")
        tipDefault.synchronize()
    }
    
}
