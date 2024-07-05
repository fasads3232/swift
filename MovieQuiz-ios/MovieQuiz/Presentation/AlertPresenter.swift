//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Андрей on 03.07.2024.
//

import Foundation
import UIKit
struct AlertModel{
    let title: String
    let message: String
    let buttonText: String
    let completion: (()->Void)
}

class AlertPresenter: UIAlertAction, StartNewGame {
    weak var delegate: AlertPresenterDelegate?
    func alertStartNewGame(on viewController : UIViewController, with result: AlertModel) {
        let alert = UIAlertController(title: result.title, message: result.message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Сыграть еще раз", style: .default) {_ in
            result.completion()
        }
        alert.addAction(action)
        viewController.present(alert,animated: true, completion: nil)
    }
    
    func setup(delegate : AlertPresenterDelegate){
            self.delegate = delegate
        }
        
    }

