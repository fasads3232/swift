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
        return self.correct > another.correct
    }
}

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    func store(result: GameResult)
}

final class StatisticService: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case correct
        case total
        case date
        case gamesCount
        case bestGameCorrect
        case bestGameTotal
        case bestGameDate
        case totalAcc
    }
    
    var gamesCount: Int {
        get {
            return storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameCorrect.rawValue)
            let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
            let date = storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
            storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
            storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
        }
    }
    
    var totalAccuracy: Double {
        get {
            return storage.double(forKey: Keys.totalAcc.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.totalAcc.rawValue)
        }
    }
    
    func store(result: GameResult) {
        gamesCount += 1
        if result.isBetterThan(bestGame) {
            bestGame = result
        }
        
        let totalCorrect = storage.integer(forKey: Keys.correct.rawValue) + result.correct
        let totalGames = storage.integer(forKey: Keys.total.rawValue) + result.total
        let accuracy = Double(totalCorrect) / Double(totalGames) * 100
        totalAccuracy = accuracy
        storage.set(totalCorrect, forKey: Keys.correct.rawValue)
        storage.set(totalGames, forKey: Keys.total.rawValue)
    }
}
