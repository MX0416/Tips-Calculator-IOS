//
//  ResultsViewController.swift
//  Tips-Calculator
//
//  Created by Matthew Xue on 6/16/23.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var explainationText: UILabel!
    
    var result: Float?
    var split: Float?
    var tipPercentage: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalText.text = String(format: "%.2f", result!)
        
        if split == 1.0{
            explainationText.text = "No split, with 10% tip"
        } else{
            explainationText.text = "Split between \(Int(split!)) people, with \(Int(tipPercentage! * 100))% tip"
        }
        

        // Do any additional setup after loading the view.
    }
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
        
}
