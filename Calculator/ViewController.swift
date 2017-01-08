//
//  ViewController.swift
//  Calculator
//
//  Created by Mir Ali on 3/1/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Addition = "+"
        case Empty = "Empty"
        case Equal = "="
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    var currentOperation: Operation = Operation.Empty

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func numberPressed(_ btn: UIButton!) {
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
        
    }


    @IBAction func onDividePressed(_ sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(_ sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(_ sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAdditionPressed(_ sender: AnyObject) {
        processOperation(Operation.Addition)
    }
    
    @IBAction func onEqualPressed(_ sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func onClearPressed(_ sender: AnyObject) {
        leftValStr = ""
        rightValStr = ""
        result = ""
        currentOperation = Operation.Empty
        outputLbl.text = "0"
    }
    func processOperation(_ op: Operation) {
        if currentOperation != Operation.Empty {
            
            //if leftValStr == 123456789 && currentOperation == Operation.Equal
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Addition {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
            currentOperation = op
        }
        else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
            
        }
        
    }
}

