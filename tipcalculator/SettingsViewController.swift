//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by Angeline Rao on 6/14/16.
//  Copyright © 2016 Angeline Rao. All rights reserved.
//

import UIKit
protocol DefaultPickerDelegate: class {
    func    defaultPicker(picker: SettingsViewController, didPickDefault default: Double?)
}
class SettingsViewController: UIViewController {
    weak var delegate: DefaultPickerDelegate?
    
    let tips = [("0.18", 0.18), ("0.20", 0.20), ("0.25", 0.25)]
    var initialTip: Double?
    
    @IBOutlet weak var defaultSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultSegmentedControl.removeAllSegments()
        
        var selectedSegmentIndex = UISegmentedControlNoSegment
        
        for (index, tip) in tips.enumerate() {
            if tip.1 == initialTip {
                selectedSegmentIndex = index
            }
            defaultSegmentedControl.insertSegmentWithTitle(tip.0, atIndex: index, animated: false)
        }
        defaultSegmentedControl.selectedSegmentIndex = selectedSegmentIndex
        

        // Do any additional setup after loading the view.
    }
    
    func defaultFromSelection() -> Double? {
        let selectedSegmentIndex = defaultSegmentedControl.selectedSegmentIndex
        if selectedSegmentIndex != UISegmentedControlNoSegment {
            return tips[selectedSegmentIndex].1
        }
        return nil
    }
    
    @IBAction func doneButtonTapper(sender: AnyObject) {
        delegate?.defaultPicker(self, didPickDefault: defaultFromSelection())
        navigationController!.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
