//
//  ViewController.swift
//  tipcalculator
//
//  Created by Angeline Rao on 6/14/16.
//  Copyright © 2016 Angeline Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DefaultPickerDelegate {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        let settingsButton: UIBarButtonItem = UIBarButtonItem(title: "Settings", style: .Plain, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItem = settingsButton
        
        self.title = "Tip Calculator"
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func settingsTap(sender: AnyObject) {
        
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        
        var tip: Double = 0
        if defaultTip != nil {
            tip = bill * defaultTip!
        }
        else {
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        }
        
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func defaultTipPickerTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let defaultPickerVC = storyboard.instantiateViewControllerWithIdentifier("Settings") as! SettingsViewController
        defaultPickerVC.delegate = self
        presentViewController(defaultPickerVC, animated: true, completion: nil)
    }
    
    func defaultPicker(picker: SettingsViewController, didPickDefault defaultElm: Double?) {
        if let selectedDefault = defaultElm {
            defaultTip = selectedDefault
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
        
        var defaultTip : Double?
}

