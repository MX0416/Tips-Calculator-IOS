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
    
    @IBAction func splitStepperChanged(_ sender: UIStepper) {
        
        splitNumberText.text = String(Int(sender.value))
        
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
//        print(calculatorBrain.percentageChosen!)
//        print(splitNumberText.text!)
//        print(billAmountText.text ?? 0)

        calculatorBrain.calculateBill(billTotal: Float(billAmountText.text!)!, tipPercentage: calculatorBrain.percentageChosen!, split: Float(splitNumberText.text!)!)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = calculatorBrain.finalResult
            destinationVC.split = calculatorBrain.split
            destinationVC.tipPercentage = calculatorBrain.percentageChosen
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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

