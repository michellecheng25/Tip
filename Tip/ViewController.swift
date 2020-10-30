//
//  ViewController.swift
//  Tip
//
//  Created by Michelle Cheng on 10/29/20.
//

import UIKit

class ViewController: UIViewController {
    //dark mode
    @IBOutlet weak var darkLabel: UILabel!
    @IBOutlet weak var outletSwitch: UISwitch!
    
    //bill Amount
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    //tip
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    //partysize
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var partySizeNum: UILabel!
    @IBOutlet weak var perPersonCostLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    //total cost
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    //reset button
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
    }


    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    
    @IBAction func stepper(_ sender: UIStepper) {
        //increase or decrease party size
        partySizeNum.text = String(Int(sender.value+1))
        let total = Double(totalLabel.text!) ?? 0
        let partySize = Double(partySizeNum.text!) ?? 0
        let costPerPerson =  total/partySize
        //update cost per person
        perPersonCostLabel.text = String(format:"$%.2f", costPerPerson)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0 //change invalid input into 0
            
        //Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total =  bill + tip
        let partySize = Double(partySizeNum.text!) ?? 0
        let costPerPerson =  total/partySize
        
        //Update the tip and total labels
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"%.2f", total)
        //update cost per person
        perPersonCostLabel.text = String(format:"$%.2f", costPerPerson)
        
    }
    
    @IBAction func resetAction(_ sender: Any) {
        billField.text = ""
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
        perPersonCostLabel.text = "$0.00"
        
    }
    
    @IBAction func darkAction(_ sender: Any) {
        //change to darkmode
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
            partySizeLabel.textColor = UIColor.white
            partySizeNum.textColor = UIColor.white
            perPersonLabel.textColor = UIColor.white
            perPersonCostLabel.textColor = UIColor.white
            
            
            
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
            partySizeLabel.textColor = UIColor.black
            partySizeNum.textColor = UIColor.black
            perPersonLabel.textColor = UIColor.black
            perPersonCostLabel.textColor = UIColor.black
        }
    }
    
}

