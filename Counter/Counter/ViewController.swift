//
//  ViewController.swift
//  Counter
//
//  Created by Андрей on 20.05.2024.
//

import Foundation
import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        behindButtons()
        alertNewValue()
    }
    
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
    
    private func saveResultCounter(){
        UserDefaults.standard.set(counter, forKey: "Counter")
    }
    
    private func saveResultConsole(){
        UserDefaults.standard.set(results.text, forKey: "Console")
    }
    
    private func alertNewValue(){
        DispatchQueue.main.async {
        let alert = UIAlertController(title: "Предупреждение", message: "Сейчас вы видите результаты предыдущей сессии. \n При попытке изменить значение оно сбросится до нуля, и старые результаты будут перезаписаны.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default){ [weak self] _ in
            guard self != nil else {return}
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    }
    
    private func behindButtons(){
        addCircle.layer.cornerRadius = 9
        degreeCircle.layer.cornerRadius = 9
        eraseCirlce.layer.cornerRadius = 9
        resultsCircle.layer.cornerRadius = 9
        clearConsoleCircle.layer.cornerRadius = 9
        counterValue.layer.cornerRadius = 9
        results.text = UserDefaults.standard.string(forKey: "Console")
        counterValue.text = "Значение счетчика : \(UserDefaults.standard.integer(forKey: "Counter"))"
    }
    private func clearUserDefaults(){
        let allValues = UserDefaults.standard.dictionaryRepresentation()
        allValues.keys.forEach { key in
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    
    @IBAction private func add(_ sender: UIButton) {
        counter += 1
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: значение изменено на +1 \n")
        counterValue.text = "Значение счетчика : \(counter)"
        saveResultCounter()
        saveResultConsole()
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
        saveResultCounter()
        saveResultConsole()
    }

    @IBAction private func erase(_ sender: Any) {
        let date = Date()
        let formattedDate = formatDate(date)
        counter = 0
        results.text.append("[\(formattedDate)]: значение сброшено \n")
        counterValue.text = "Значение счетчика : \(counter)"
        clearUserDefaults()
    }

    @IBAction private func clearConsole(_ sender: UIButton) {
        results.text = ""
        counter = 0
        let date = Date()
        let formattedDate = formatDate(date)
        results.text.append("[\(formattedDate)]: Консоль очищена. Новая история изменений \n")
        counterValue.text = "Значение счетчика : \(counter)"
        clearUserDefaults()
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "Europe/Moscow")
        return formatter.string(from: date)
    }
}
