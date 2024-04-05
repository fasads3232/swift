//
//  ViewController.swift
//  MyCalculcator
//
//  Created by Андрей on 15.03.2024.
// !!!Остановился на том, что нужно проверять состояние num1, возможно нужно добавить третью переменную, которая будет записывать в себя num, а num1 при этом очищать
//да и в целом нужно выводить только num2 в поле вывода!!!


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet var userTyped: UITextField!
    
    var value : Int = 0
    var num = ""
    var typed1 = ""
    var typed2 = ""
    
    
    
    
    @IBAction func button0(_ sender: UIButton) {
        value = 0
        num.append("\(value)")
        userTyped.text = num
    }
    
    @IBAction func button1(_ sender: UIButton) {
        value = 1
        num.append("\(value)")
        userTyped.text = num
        
        
    }
    
    @IBAction func divison(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func equal(_ sender: UIButton) {
        print(typed1 , typed2)
    }
    
    
}
