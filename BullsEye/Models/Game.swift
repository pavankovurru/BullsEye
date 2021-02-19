//
//  Game.swift
//  BullsEye
//
//  Created by Pavan Kovurru on 1/8/21.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    
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
    }
}

