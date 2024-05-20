//
//  ViewController.swift
//  Counter
//
//  Created by Андрей on 20.05.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        labelWork.text = "Значение счетчика : \(counter)"
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var labelWork: UILabel!
    var counter : Int = 0
    @IBAction func plusOne(_ sender: UIButton) {
        counter+=1
        labelWork.text = "Значение счетчика : \(counter)"
    }
    
}

