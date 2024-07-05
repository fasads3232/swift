//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Андрей on 03.07.2024.
//

import Foundation
protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
