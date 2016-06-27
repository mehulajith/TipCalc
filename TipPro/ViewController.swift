//
//  ViewController.swift
//  TipPro
//
//  Created by Mehul Ajith on 6/21/16.
//  Copyright © 2016 Mehul Ajith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billAmountField: UITextField!
    @IBOutlet var tipSelector: UISegmentedControl!
    @IBOutlet var finalOutput: UILabel!
    @IBOutlet var currencySelector: UISegmentedControl!
    @IBOutlet var tipAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipCalculate(sender: AnyObject) {
        guard let billAmount = Double(billAmountField.text!) else {
            billAmountField.text = ""
            return
        }
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        var currency:String = ""
        
        switch currencySelector.selectedSegmentIndex {
        case 0:
            currency = "$"
        case 1:
            currency = "€"
        case 2:
            currency = "¥"
        case 3:
            currency = "£"
        case 4:
            currency = "₹"
        default:
            break
        }
        
        let roundedBillAmount = round(billAmount*100)/100
        let roundedTipAmount = roundedBillAmount * tipPercentage
        let totalAmount = roundedTipAmount + roundedBillAmount
        
        tipAmount.text = "\(currency)\(roundedTipAmount)"
        finalOutput.text = "\(currency)\(totalAmount)"
        
    }
    

}

