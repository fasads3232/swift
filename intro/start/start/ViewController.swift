//
//  ViewController.swift
//  start
//
//  Created by Андрей on 17.01.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myButton: UIButton!
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        print("hello world!")
    }
    
    
    override func viewDidLoad() {
        myButton.tintColor = .red
    }
    


}


