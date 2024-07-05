//
//  QuizStepViewModel.swift
//  MovieQuiz
//
//  Created by Андрей on 03.07.2024.
//

import Foundation
import UIKit
//основная модель экрана
struct QuizStepViewModel {
  let image: UIImage
  let question: String
  let questionNumber: String
    init(image: UIImage, question: String, questionNumber: String) {
        self.image = image
        self.question = question
        self.questionNumber = questionNumber
    }
}
