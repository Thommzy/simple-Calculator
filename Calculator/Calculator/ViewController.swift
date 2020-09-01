//
//  ViewController.swift
//  Calculator
//
//  Created by Tim on 31/08/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

enum Operation: String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Muliply = "*"
    case NULL  = "Null"
}



class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var currentOperation:Operation = .NULL
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "0"
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
            print("NumberPressed")
        }
    }
    @IBAction func allClearedPressed(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
        print("allClearedPressed")
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if runningNumber.count <= 7 {
            runningNumber += "."
            outputLabel.text = runningNumber
            print("DotPressed")
        }
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
        print("EqualPressed")
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
        print("addPressed")
    }
    
    @IBAction func subtractPressed(_ sender: UIButton) {
        operation(operation: .Subtract)
        print("subtractPressed")
    }
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operation(operation: .Muliply)
        print("multiplyPressed")
    }
     
    @IBAction func divisorPressed(_ sender: UIButton) {
        operation(operation: .Divide)
        print("divisorPressed")
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == .Subtract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == .Muliply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                } else if currentOperation == .Divide{
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                     result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    //-----------
}

