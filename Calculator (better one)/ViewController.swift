//
//  ViewController.swift
//  Calculator (better one)
//
//  Created by Brady Cluff on 2/16/15.
//  Copyright (c) 2015 tim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet var dataBox: UILabel!
    var firstNumber = (String(Int()) as NSString).floatValue
    var secondNumber = (String(Int()) as NSString).floatValue
    var operation = ""
    var result = (String(Int()) as NSString).floatValue
    var isTypingNumber = false
    
    func swag(var newValue:Float)
    {
        var getEnd = Range(start: (advance(toString(newValue).endIndex, -1)), end: toString(newValue).endIndex)
        var isItAZero = toString(newValue).substringWithRange(getEnd)
        if isItAZero.toInt() == 0
        {
            let number = Int(newValue)
            dataBox.text = toString(number)
        }
        else
        {
            dataBox.text = toString(newValue)
        }
    }
    
    
    @IBAction func clearButton(sender: AnyObject)
    {
        firstNumber = 0
        secondNumber = 0
        isTypingNumber = false
        result = (String(0) as NSString).floatValue
        dataBox.text = "\(0)"
    }
    @IBAction func positveNegative(sender: AnyObject) //Changes the Number to a negative number
    {
        var positiveNegative = dataBox.text?.toInt()
        if dataBox.text > "\(0)"
        {
            dataBox.text = "\(positiveNegative! * -1)"
        }
        else
        {
            dataBox.text = "\(positiveNegative! * -1)"
        }
        
    }
    @IBAction func percentButton(sender: AnyObject) /*divdes the number by 100
                                                     to take a percent*/
    {
        var string = String(dataBox.text!)
        var data = (string as NSString).floatValue
        dataBox.text = "\(data / 100)"
    }
    @IBAction func number(sender: AnyObject)
    {
        
        var number = sender.currentTitle
        if isTypingNumber == true
        {
            dataBox.text = dataBox.text! + number!!
        }
        else
        {
            dataBox.text = number
        }
        isTypingNumber = true
    }
    @IBAction func operation(sender: AnyObject)
    {
        isTypingNumber = false
        firstNumber = Float(dataBox.text!.toInt()!)
        operation = sender.currentTitle!!
    }
       @IBAction func decimal(sender: AnyObject)
    {
     
    }
    @IBAction func equalsButton(sender: AnyObject)
    {
        secondNumber = Float(dataBox.text!.toInt()!)
        if operation == "+"
        {
            result = firstNumber + secondNumber
            
        }
        else if operation == "-"
        {
            result = firstNumber - secondNumber
            
        }
        else if operation == "X"
        {
            result = firstNumber * secondNumber
         
        }
        else
        {
            result = firstNumber / secondNumber
        
        }
        dataBox.text = "\(result)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

