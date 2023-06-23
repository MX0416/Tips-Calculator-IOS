//
//  CalculatorBrain.swift
//  Tips-Calculator
//
//  Created by Matthew Xue on 6/16/23.
//

import Foundation

struct CalculatorBrain {
    
    var percentageChosen: Float?
    var finalResult: Float?
    var split: Float?
    
    mutating func calculateBill(billTotal: Float, tipPercentage: Float, split: Float) {
        
        self.split = split
        finalResult = (billTotal * (tipPercentage + 1.0)) / split
        
    }
    //function to calculate the final result, taking in three parameters: total bill amount, tip percentage, and split from user input
    
}
