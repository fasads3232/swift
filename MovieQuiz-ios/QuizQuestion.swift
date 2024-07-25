//
//  QuizQuestion.swift
//  MovieQuiz
//
//  Created by Андрей on 03.07.2024.
//

import Foundation
//модель экрана с вопросом
struct QuizQuestion{
    let image : String
    let text : String
    let correctAnswer : Bool
    init(image: String, text: String, correctAnswer: Bool) {
        self.image = image
        self.text = text
        self.correctAnswer = correctAnswer
    }
}
