//
//  ViewController.swift
//  Counter
//
//  Created by Андрей on 20.05.2024.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var results: UITextView!
    @IBOutlet private weak var addCircle: UIButton!
    @IBOutlet private weak var degreeCircle: UIButton!
    @IBOutlet private weak var eraseCirlce: UIButton!
    @IBOutlet private weak var resultsCircle: UITextView!
    @IBOutlet private weak var clearConsoleCircle: UIButton!
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        results.text = "История изменений: \n"
        behindButtons()
    }
    
    @IBAction func add(_ sender: UIButton) {
        counter += 1
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: значение изменено на +1 \n")
    }
    
    
    func behindButtons(){
        addCircle.layer.cornerRadius = 9
        degreeCircle.layer.cornerRadius = 9
        eraseCirlce.layer.cornerRadius = 9
        resultsCircle.layer.cornerRadius = 9
        clearConsoleCircle.layer.cornerRadius = 9
        
    }

    @IBAction func degree(_ sender: UIButton) {
        sender.layer.cornerRadius = 3
        counter -= 1
        if counter <= 0{
            let date = Date()
            let formattedDate = formatDate(date)
            results.text.append("[\(formattedDate)]: попытка уменьшить значение счётчика ниже 0\n")
            return
        }
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: значение изменено на -1 \n")
    }

    @IBAction func erase(_ sender: Any) {
        counter = 0
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: значение сброшено")
    }

    @IBAction func clearConsole(_ sender: UIButton) {
        results.text = ""
        counter = 0
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: Консоль очищена. Новая история изменений \n")
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "Europe/Moscow")
        return formatter.string(from: date)
    }
}
