//
//  ViewController.swift
//  Two Buttons(he-he)
//
//  Created by Андрей on 06.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var label: UITextField!
    
    @IBOutlet var textField: UITextField!
    @IBAction func setText(_ sender: UIButton) {
        textField.text = label.text
        
    }
    
    @IBAction func clearText(_ sender: UIButton) {
        label.text = ""
        textField.text = ""
    }
    
    @IBAction func slider(_ sender: UISlider) {
        textField.text = "\(sender.value)"
    }
    @IBAction func of_or_on(_ sender: UISwitch) {
        if sender.isOn{
            textField.text = "\(true)"
        }
        else {
            textField.text = "\(false)"
        }
    }
    
}

