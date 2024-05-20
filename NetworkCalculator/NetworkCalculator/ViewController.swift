//
//  ViewController.swift
//  NetworkCalculator
//
//  Created by Андрей on 27.03.2024.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var octet1: UITextField!
    @IBOutlet var octet2: UITextField!
    @IBOutlet var octet3: UITextField!
    @IBOutlet var octet4: UITextField!

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength: Int = 0
        if textField == octet1 || textField == octet2 || textField == octet3 || textField == octet4 {
            maxLength = 3
            
        }
        
        guard let currentText = textField.text else {
            return false
        }
        
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        if newText.isEmpty {
            return true
        }
        
        
        if let number = Int(newText), number >= 0 && number <= 255 {
            return newText.count <= maxLength
        } else {
            return false
        }
    }

    
}
