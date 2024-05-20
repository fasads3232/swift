//
//  ViewController.swift
//  Counter
//
//  Created by Андрей on 20.05.2024.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var results: UITextView!
    var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        results.text = "История изменений: \n"
    }

    @IBAction func add(_ sender: Any) {
        counter += 1
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: значение изменено на +1 \n")
    }

    @IBAction func degree(_ sender: Any) {
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

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "Europe/Moscow")
        return formatter.string(from: date)
    }
}
