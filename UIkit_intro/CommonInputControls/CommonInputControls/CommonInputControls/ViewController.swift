//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Андрей on 05.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    
    @IBOutlet var button: UIButton!
    
    
    
    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    

    @IBAction func buttonTapped(_ sender: Any) {
        if toggle.isOn{
            print("switch is on!")
        }
        else{
            print("switch is off")
        }
        print("The slider is set to \(slider.value)")
              
        
    }
    
    
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn{
            print("It's on!")
        }
        else{
            print("It's off!")
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBOutlet var toggle: UISwitch!
    
    @IBOutlet var slider: UISlider!
    
    @IBAction func keyboardReturnKeyTapped( _ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
}





