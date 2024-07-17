//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Андрей on 16.07.2024.
//

import Foundation

final class StatisticService : StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    private enum Keys: String {
        case correct
        case bestGame
        case gamesCount
    }
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    var bestGame: GameResult {
        get {
            storage.integer(forKey: Keys.bestGame.rawValue)
            storage.integer(forKey: Keys.correct.rawValue)
            storage.object(forKey: Keys.bestGame.rawValue)
            let result = GameResult(correct: storage.integer(forKey: Keys.correct.rawValue), total: storage.integer(forKey: Keys.gamesCount.rawValue), date: storage.object(forKey: Keys.bestGame.rawValue) as? Date ?? Date())
            return result
        }
        set {
            storage.set(newValue.correct, forKey: Keys.correct.rawValue)
            storage.set(bestGame.total, forKey: Keys.bestGame.rawValue)
        }
    }
    var totalAccuracy: Double {
        get {
            storage.double(forKey: "totalAcc")
        }
        set {
            let correct = storage.integer(forKey: "correct")
            let total = storage.integer(forKey: "total")
            let totalAcc : Double = Double(total / correct * 100)
            if  totalAcc != 0 {
                storage.set(totalAcc, forKey: "totalAcc")
            }
            else {
                return
            }
        }
    }
    func store(result: GameResult) {
        let total = result.total
        let correct = storage.integer(forKey: Keys.correct.rawValue)
        let newGamesCount = storage.integer(forKey: Keys.gamesCount.rawValue) + 1
        if result.correct > correct {
            storage.set(result.correct , forKey: Keys.correct.rawValue)
        }
    }
    
}
