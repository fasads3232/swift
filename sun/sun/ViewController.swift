//
//  ViewController.swift
//  sun
//
//  Created by Андрей on 17.05.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Casey.image = UIImage(systemName: "sun.max")
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var Casey: UIImageView!
    @IBOutlet weak var tiredCasey: UITextView!
    @IBAction func iWasTired(_ sender: UIButton) {
        if tiredCasey.text == ""{
            tiredCasey.text = "This city was an old scar that refused to heal. The rain made it fester. That needed to sun, but there was only the night. I was tired. (c) Alex Casey"
            Casey.image = UIImage(named : "Casey.jpg")
            sender.setTitle("Get Sun", for: .normal)
            self.view.backgroundColor = .black
        }
        else {
            tiredCasey.text = ""
            Casey.image = UIImage(systemName: "sun.max")
            sender.setTitle("Get Casey", for: .normal)
            self.view.backgroundColor = .white
        }
    }
}

