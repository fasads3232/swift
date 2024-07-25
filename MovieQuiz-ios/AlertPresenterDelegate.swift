//
//  AlertPresenterDelegate.swift
//  MovieQuiz
//
//  Created by Андрей on 03.07.2024.
//

import Foundation
protocol AlertPresenterDelegate: AnyObject {
    func didReceiveAlertModel(alertModel : AlertModel?)
}
