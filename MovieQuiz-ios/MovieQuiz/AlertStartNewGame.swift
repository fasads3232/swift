//
//  AlertStartNewGame.swift
//  MovieQuiz
//
//  Created by Андрей on 05.07.2024.
//

import Foundation
import UIKit
protocol StartNewGame: UIAlertAction {
    func alertStartNewGame(on viewController : UIViewController, with result: AlertModel)
}
