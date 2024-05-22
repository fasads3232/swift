//
//  ViewController.swift
//  Counter
//
//  Created by Андрей on 20.05.2024.
//

import Foundation
import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var results: UITextView!
    @IBOutlet private weak var addCircle: UIButton!
    @IBOutlet private weak var degreeCircle: UIButton!
    @IBOutlet private weak var eraseCirlce: UIButton!
    @IBOutlet private weak var resultsCircle: UITextView!
    @IBOutlet private weak var clearConsoleCircle: UIButton!
    @IBOutlet private weak var counterValue: UITextView!
    private var counter: Int = 0
    override var shouldAutorotate: Bool {
           return false
       }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        behindButtons()
    }
    private func behindButtons(){
        addCircle.layer.cornerRadius = 9
        degreeCircle.layer.cornerRadius = 9
        eraseCirlce.layer.cornerRadius = 9
        resultsCircle.layer.cornerRadius = 9
        clearConsoleCircle.layer.cornerRadius = 9
        counterValue.layer.cornerRadius = 9
        results.text = "История изменений: \n"
        counterValue.text = "Значение счетчика : \(counter)"
    }
    
    @IBAction private func add(_ sender: UIButton) {
        counter += 1
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: значение изменено на +1 \n")
        counterValue.text = "Значение счетчика : \(counter)"
    }

    @IBAction private func degree(_ sender: UIButton) {
        counter -= 1
        if counter < 0{
            let date = Date()
            let formattedDate = formatDate(date)
            results.text.append("[\(formattedDate)]: попытка уменьшить значение счётчика ниже 0\n")
            counter = 0
            counterValue.text = "Значение счетчика : \(counter)"
            return
        }
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: значение изменено на -1 \n")
        counterValue.text = "Значение счетчика : \(counter)"
    }

    @IBAction private func erase(_ sender: Any) {
        let date = Date()
        let formattedDate = formatDate(date)
        counter = 0
        results.text.append("[\(formattedDate)]: значение сброшено \n")
        counterValue.text = "Значение счетчика : \(counter)"
    }

    @IBAction private func clearConsole(_ sender: UIButton) {
        results.text = ""
        counter = 0
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: Консоль очищена. Новая история изменений \n")
        counterValue.text = "Значение счетчика : \(counter)"
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "Europe/Moscow")
        return formatter.string(from: date)
    }
}
