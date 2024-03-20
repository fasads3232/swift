//
//  ViewController.swift
//  MyCalculcator
//
//  Created by Андрей on 15.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var typed = ""
    var num1 = ""
    var num2 = ""
    var result = ""
    @IBOutlet var userTyped: UITextField!
    
    func checkValue(){
        if userTyped.text == ""{
            let value = 0
            typed.append("\(value)")
            num2 = typed
            userTyped.text = typed
        }
    }
    
    @IBAction func button0(_ sender: UIButton) {
        let value = 0
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    
    @IBAction func button1(_ sender: UIButton) {
        let value = 1
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    
    @IBAction func button2(_ sender: UIButton) {
        let value = 2
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    
    @IBAction func button3(_ sender: UIButton) {
        let value = 3
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    
    @IBAction func button4(_ sender: UIButton) {
        let value = 4
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    
    @IBAction func button5(_ sender: UIButton) {
        let value = 5
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    @IBAction func button6(_ sender: UIButton) {
        let value = 6
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    
    @IBAction func button7(_ sender: UIButton) {
        let value = 7
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    
    @IBAction func button8(_ sender: UIButton) {
        let value = 8
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    
    @IBAction func button9(_ sender: UIButton) {
        let value = 9
        typed.append("\(value)")
        num1 = typed
        userTyped.text = typed
        checkValue()
    }
    @IBAction func erase(_ sender: UIButton) {
        num1 = ""
        num2 = ""
        typed = ""
        userTyped.text = ""
    }
    
    @IBAction func division(_ sender: UIButton) {
        
    }
    
    }

        
    




