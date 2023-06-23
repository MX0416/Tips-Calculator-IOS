//
//  ViewController.swift
//  Tips-Calculator
//
//  Created by Matthew Xue on 6/13/23.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billAmountText: UITextField!
    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    @IBOutlet weak var splitNumberText: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billAmountText.endEditing(true)
        // remove the numbers keypad from the screen automatically when one of the tips options is chosen
        
        if sender == zeroPercentTip{
            sender.isSelected = true
            sender.tintColor = hexStringToUIColor(hex: "C38154")
            calculatorBrain.percentageChosen = 0.0
        } else {
            zeroPercentTip.isSelected = false
        }
        // Zero percent button is selected, change tint.
        // Deselect if another percent is selected
        
        if sender == tenPercentTip{
            sender.isSelected = true
            sender.tintColor = hexStringToUIColor(hex: "C38154")
            calculatorBrain.percentageChosen = 0.1
        } else {
            tenPercentTip.isSelected = false
        }
        // Ten percent button is selected
        
        if sender == twentyPercentTip{
            sender.isSelected = true
            sender.tintColor = hexStringToUIColor(hex: "C38154")
            calculatorBrain.percentageChosen = 0.2
        } else {
            twentyPercentTip.isSelected = false
        }
        // Twenty percent button is selected
    }
    // function that activats when the user has selected or changed a tip percentage amount
    // returns the percentage the user has chosen to the calculatorBrain created above, and keeps the value in the percentageChosen variable inside calculatorBrain
    
    @IBAction func splitStepperChanged(_ sender: UIStepper) {
        
        splitNumberText.text = String(Int(sender.value))
        
    }
    // function that activates when the user has interacted with the stepper
    // changes the text number next to the stepper to match user input
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        calculatorBrain.calculateBill(billTotal: Float(billAmountText.text!)!, tipPercentage: calculatorBrain.percentageChosen!, split: Float(splitNumberText.text!)!)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    // function is activated when the calculate button is pressed
    // calls the calculateBill method from the calculatorBrain created at the top, giving three values
    // performs segueway to the results view
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = calculatorBrain.finalResult
            destinationVC.split = calculatorBrain.split
            destinationVC.tipPercentage = calculatorBrain.percentageChosen
        }
    }
    // double check the identifier is correct for the segueway to perform
    // passes three values to the results view controller (final result after calculations. split number and tip percentage for one line description below the final result value)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

