//
//  ViewController.swift
//  IB_basics
//
//  Created by Андрей on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBAction func changeTtile(_ sender: Any) {
        
        mainLabel.text = "здарова ебач)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

