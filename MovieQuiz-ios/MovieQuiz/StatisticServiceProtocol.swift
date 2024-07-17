//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Андрей on 16.07.2024.
//

import Foundation
struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    func isBetterThan(_ another: GameResult) -> Bool {
        self.correct > another.correct
        }
}
protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    func store(result : GameResult)
}
