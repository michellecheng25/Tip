//
//  ViewController.swift
//  Tip
//
//  Created by Michelle Cheng on 10/29/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var darkLabel: UILabel!
    @IBOutlet weak var outletSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0 //change invalid input into 0
            
        //Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total =  bill + tip
        
        //Update the tip and total labels
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
    
    
    @IBAction func darkAction(_ sender: Any) {
        if outletSwitch.isOn == true {
            view.backgroundColor = UIColor.black
            darkLabel.textColor = UIColor.white
            tipLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            billField.textColor = UIColor.white
            billAmountLabel.textColor = UIColor.white
            tipAmountLabel.textColor = UIColor.white
            totalCostLabel.textColor = UIColor.white
            tipControl.backgroundColor =  UIColor.white
            billField.layer.borderColor = UIColor.white.cgColor
            billField.layer.borderWidth = 0.3
            
        }
        else {
            view.backgroundColor = UIColor.white
            darkLabel.textColor =  UIColor.black
            tipLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            billField.textColor = UIColor.black
            billAmountLabel.textColor = UIColor.black
            tipAmountLabel.textColor = UIColor.black
            totalCostLabel.textColor = UIColor.black
            tipControl.backgroundColor =  UIColor.white
            billField.layer.borderColor = UIColor.black.cgColor
            billField.layer.borderWidth = 0.3
        }
    }
    
}

