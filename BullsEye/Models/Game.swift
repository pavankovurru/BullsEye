//
//  Game.swift
//  BullsEye
//
//  Created by Pavan Kovurru on 1/8/21.
//

import Foundation


struct LeaderBoardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderBoardEntries: [LeaderBoardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderBoardEntries.append(LeaderBoardEntry(score: 100, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 200, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 300, date: Date()))
        }
    }
    mutating func restart(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)

    }
    
    // 100 - (Guessed Value - Actual value)
    func points(sliderValue: Int) -> Int {
        
        let difference = abs(sliderValue - target)
        
        //Bonus Points
        var bonusPoints: Int
        if difference == 0 {
            bonusPoints = 100
        } else if difference <= 2 {
            bonusPoints = 50
        } else {
            bonusPoints = 0
        }
        
        return (100 - difference) + bonusPoints
    }
    
    mutating func startNewRound(points: Int){
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderBoard(points: points)
    }
    
    mutating func addToLeaderBoard(points: Int){
        leaderBoardEntries.append(LeaderBoardEntry(score: points, date: Date()))
        leaderBoardEntries.sort{ $0.score > $1.score}
    }
}

