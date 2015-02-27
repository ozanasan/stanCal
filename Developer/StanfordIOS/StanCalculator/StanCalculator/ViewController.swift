//
//  ViewController.swift
//  StanCalculator
//
//  Created by Ozan Asan on 25/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    var isThereADotInTheDisplay = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if isThereADotInTheDisplay && digit == "." {
            display.text = display.text
        }
        else {
            if(digit == "."){
                isThereADotInTheDisplay = true
            }
            if userIsInTheMiddleOfTypingANumber{
                display.text = display.text! + digit
            } else {
                display.text = digit
                userIsInTheMiddleOfTypingANumber = true
            }
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
            case "×": performOperation(){ $0 * $1 }
            case "+": performOperation(){ $0 + $1 }
            case "÷": performOperation(){ $1 / $0 }
            case "−": performOperation(){ $1 - $0 }
            case "√": performOperation(){ sqrt( $0 ) }
            default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        isThereADotInTheDisplay = false
        operandStack.append(displayValue)
    }
    
    var displayValue:Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        } set {
            display.text! = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

